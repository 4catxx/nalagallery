# Teknis — Nala's Gallery

Dokumen ini pintu masuk teknis: arsitektur, data, alur, deploy, dan runbook.
Bahasa produk ada di `PRODUCT.md`, bahasa visual di `DESIGN.md`.

## 1. Arsitektur

```
Browser (file statis, tanpa build)
├── index.html    → galeri (hero, grid, viewer, direktori fotografer)
├── upload.html   → submit publik (tunggal + bulk)
├── live.html     → timeline X resmi (embed publish.twitter.com, lazy-load)
├── n4l4/index.html → admin (login + 5 tab kelola)
└── styles.css    → satu sistem visual (token Nala Teal #0E7C86)

Supabase (Postgres + Auth, proyek TERPISAH dari proyek bisnis)
├── tabel tweets / photos / reports / profiles (+ Storage bucket nala-photos)
└── RLS: publik baca approved + insert pending/laporan; tulis lain admin saja

Cloudflare Worker `nala-foto` (akun pribadi, di luar repo)
└── GET /<uuid-tweet> → HTML meta per foto (og:*/twitter:) + antar manusia ke galeri
    URL publik: https://nala-foto.muhammadadhi2803.workers.dev/<uuid-tweet>
```

Tidak ada server aplikasi, tidak ada bundler. Buka `index.html` langsung jalan;
deploy produksi = Cloudflare Pages dari branch `main` (`nalagallery.pages.dev`).

## 2. Model data

Satu tweet = satu unit arsip berisi 1–N foto.

**tweets** — `id` (uuid), `url` (unik, format tweet foto twitter/x),
`author`, `handle`, `caption` (≤2000), `tweet_date`, `curated_at`,
`status` (`pending`/`approved`/`rejected`), `report_count`,
`is_dead` (arsip link mati, sembunyi dari galeri), `avatar_url`,
`submitter_ip` (diisi trigger), `created_at`.

**photos** — `id`, `tweet_id` (cascade), `position`,
`image_url_orig` (unduh HD), `image_url_large` (tampil),
`width`, `height`. Unik per `(tweet_id, position)`.

**reports** — `id`, `tweet_id` (cascade), `note`, `reporter_ip`
(diisi trigger), `created_at`.

**profiles** — `id` (fk auth.users), `is_admin`, `created_at`.
Admin = 1 user yang ditandai manual (lihat `supabase/schema.sql` blok "TANDAI ADMIN").

**Constraint penting** (ditolak server bila dilanggar):
`tweets_url_twitter_only`, `tweets_caption_length`, `tweets_author_length`.
**Trigger anti-spam** (per IP per jam): `tweets_throttle` (30 kirim),
`reports_throttle` (60 lapor). Pesan ramah "jeda 1 jam" ditangani frontend.

## 3. Alur utama

**Terbit** — `upload.html` (POST anon, `Prefer: return=minimal`, status
`pending`) → antrean `n4l4` → `Ambil foto otomatis` (API fixup publik +
ekstrak caption/author/avatar/tanggal, pratinjau dulu) → `Setujui`
(simpan foto + snapshot + `curated_at`) → tampil di galeri.
Bulk: validasi per baris (valid/duplikat/invalid), kirim yang unik saja.

**Lapor mati** — tombol di kartu/viewer (1x per browser via `localStorage`)
→ `POST reports` → panel Laporan admin → `Tandai arsip mati`
(`is_dead=true` + laporan ikut terhapus otomatis) atau `Bersihkan laporan`.
Arsip hidup di tab Arsip (kembalikan/hapus permanen).

**Kelola** — tab Antrean (setujui/tolak), Galeri terbit (arsipkan/hapus),
Laporan, Ditolak (pulihkan/hapus), Arsip. Daftar 15/baris + `Muat lebih
banyak`; antrean 6 kartu dulu (berat). Hapus permanen selalu lewat dialog
konfirmasi custom (bukan `confirm()` browser). Sesi kedaluwarsa (401)
otomatis kembali ke login.

**Share** — salin URL worker per UUID tweet. Crawler dapat caption +
fotografer + foto; manusia diarahkan ke `/#galeri`. Hanya tweet
approved & hidup yang ber-meta; sisanya fallback generik.

**Live** — `live.html` menanam timeline X resmi (lazy-load saat di-scroll,
status + tombol `Coba lagi` bila X membatasi/429). Deteksi tweet-foto
otomatis TIDAK ada (butuh API X berbayar) — alurnya tetap via Kirim tautan.

## 4. Keamanan (ringkas)

* SQLi tertutup arsitektur: semua via PostgREST berparameter + RLS.
* XSS: semua interpolasi lewat `esc()`; semua `href`/`src` lewat
  `safeHttpUrl()` (non-`http(s)` jadi teks polos).
* Kunci: hanya anon key di frontend (publik by design); tidak ada
  service_role di repo/klien.
* Sesi admin 1 jam; 401 → logout otomatis.

## 5. Deploy & operasi

* **Pages**: push `main` → redeploy otomatis (`nalagallery.pages.dev`).
* **Worker**: kelola via API (`PUT .../workers/scripts/nala-foto`);
  `GALLERY_URL` di dalam kode worker menunjuk domain galeri.
* **Migrasi DB**: seluruh file `supabase/schema.sql` idempoten — aman
  di-Run utuh ulang di SQL Editor proyek galeri setiap ada update.
* **Cek sehat cepat**: galeri memuat angka `X foto dari Y tweet`;
  antrean kosong + hitungan tab admin sinkron; share link unfurl
  caption + foto; `live.html` timeline tampil (atau status 429 yang jelas).
