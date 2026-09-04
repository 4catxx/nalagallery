# Nala's Gallery

Galeri foto fanmade untuk **Shabilqis Naila (Nala)** dari JKT48 — sentral arsip foto Nala dari berbagai fotografer maupun Nala sendiri, dengan kredit yang selalu menempel. Hai-hai!

## Fitur

- **Galeri** — grid foto dengan pencarian, filter era & fotografer (bisa dilipat, Esc menutup), sortir Terbaru/Terlama, pagination, dan statistik koleksi
- **Sorotan Nala** — 3 foto terbaru dari akun Nala sendiri di hero
- **Viewer imersif** — satu foto per layar, navigasi keyboard, pager multi-foto dalam satu tweet, tombol Unduh HD
- **Credit bar** — penulis, caption, dan tautan tweet sumber di setiap foto; fallback arsip bila tweet sumber terhapus
- **Submit publik** — form tautan tunggal + tempel-banyak (bulk) dengan validasi dan cegah duplikat, tanpa perlu akun
- **Direktori fotografer** — klik kartu untuk melihat karya masing-masing
- **Ketahanan arsip** — laporkan link mati, penanda tanggal kurasi, bingkai acak stabil (Nala selalu teal penuh)
- **Animasi ceria-anggun** — reveal saat scroll, micro-interaction, hero bernapas; hormat `prefers-reduced-motion`

## Struktur

```
index.html      → galeri murni Nala (hero, grid, viewer, direktori)
upload.html     → halaman submit publik (tunggal + bulk)
n4l4/index.html → halaman admin tersembunyi (gate + antrean + laporan)
styles.css      → sistem visual bersama (Nala Teal #0E7C86)
PRODUCT.md      → konteks produk (tidak ikut repo publik)
DESIGN.md       → sistem desain (tidak ikut repo publik)
```

## Jalan lokal

Tidak perlu build maupun server — buka langsung:

```
index.html        → galeri
upload.html       → kirim tautan
n4l4/index.html   → admin (password demo: nala-admin-demo)
```

Catatan: aliran data antar-halaman memakai `localStorage` browser; menjadi penuh saat backend Supabase tersambung.

## Rencana

- [ ] Foto asli pertama (3 tweet terverifikasi menunggu berkasnya)
- [ ] Wiring Supabase (database + auth + storage)
- [ ] Deploy Cloudflare Pages + domain

## Disclaimer

Fanmade — dibuat penggemar untuk penggemar. Tidak terafiliasi resmi dengan JKT48 atau agensi mana pun. Seluruh kredit fotografer ditampilkan utuh via tautan sumber. Kurasi mingguan #SeniNala — dititipkan oleh Nalania.
