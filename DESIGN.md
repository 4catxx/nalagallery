---
name: Nala's Gallery
description: Fanmade photo gallery for Shabilqis Naila (Nala) of JKT48 — idol merchandise at architectural scale.
colors:
  field: "#0E7C86"
  field-deep: "#0A5D64"
  field-soft: "#E2F2EF"
  paper: "#FFFBF2"
  sand: "#F2E9DE"
  ink: "#0F0F0E"
  muted: "#6B625C"
  line: "#E8DDD3"
  notice-wash-yellow: "#FFF8D6"
  notice-wash-green: "#EFF9E0"
  accent: "#E8FF2E"
  accent-ink: "#0F0F0E"
typography:
  display:
    fontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif"
    fontSize: "clamp(48px, 16vw, 164px)"
    fontWeight: 950
    lineHeight: 0.78
    letterSpacing: "-0.06em"
  headline:
    fontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif"
    fontSize: "clamp(20px, 2.8vw, 28px)"
    fontWeight: 900
    lineHeight: 0.95
    letterSpacing: "-0.04em"
  body:
    fontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif"
    fontSize: "14px"
    fontWeight: 650
    lineHeight: 1.5
    letterSpacing: "-0.02em"
  label:
    fontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif"
    fontSize: "11px"
    fontWeight: 800
    letterSpacing: "0.06em"
  caption:
    fontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif"
    fontSize: "10px"
    fontWeight: 800
    letterSpacing: "0.02em"
  serif-accent:
    fontFamily: "Georgia, 'Times New Roman', serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: "-0.01em"
rounded:
  hairline: "2px"
  tag: "6px"
  kbd: "7px"
  chip-sm: "9px"
  tile: "12px"
  raised: "14px"
  surface: "16px"
  card: "18px"
  stage: "22px"
  pill: "999px"
---

# Design System: Nala's Gallery

## Overview

**Creative North Star: "The Merch Table"**

Nala's Gallery tampak seperti meja merchandise di luar teater, diperbesar hingga skala arsitektural: bidang warna datar yang pekat, wordmark NALA raksasa yang terbaca dari seberang arena, dan setiap foto dipasang seperti wajah di uchiwa dan handuk goods. Suasananya lantang, hangat, dan kolektibel, tidak pernah abu-abu minimal, tidak pernah berkaca. Kepadatan tinggi di grid (goods dijejer seperti display meja) dan hening total di viewer (satu foto per viewport, tiga elemen chrome saja). Voice UI sepenuhnya berbahasa Indonesia, dengan register MC Nala yang ceria.

**Key Characteristics:**
- Warna hemat: teal hanya mengisi sekitar sepuluh persen permukaan; netral hangat menanggung sisanya.
- Pemasangan yang tenang: border hairline, bayangan yang dilembutkan, whitespace lega, tile terbaca sebagai karya galeri.
- Tipografi sebagai jangkar, bukan banjir: display type tetap memimpin hero tapi foto memimpin setiap viewport.
- Kredit adalah infrastruktur: penulis dan caption ikut di setiap foto.
- Geometri surai: surai radial abstrak (datar, memakai token yang ada, tepi memudar), identitas singa betina Nala, bukan singa harfiah.
- Microcopy ala Nala: register Roar!/Hai-hai!, Indonesia dulu, energi MC yang ceria di state sukses dan kosong.
- Penamaan SeniNala: kurasi membawa hashtag-nya; kiriman dititipkan oleh Nalania.

## Colors

Strategi yang disepakati, satu bidang pekat mendominasi, netral hangat mengistirahatkan mata, satu aksen bercahaya hanya menyala di aksi dan fokus.

### Primary
- **Nala Teal** (#0E7C86): display type, motif surai, aksi utama, badge (aturan ~10%). Dipatok pemilik dari unggahan #SeniNala milik Nala sendiri, tidak bisa ditukar.
- **Deep Teal** (#0A5D64): kedalaman tekan/hover dari keluarga primer.
- **Soft Teal Wash** (#E2F2EF): pita bernuansa dan permukaan istirahat di bawah keluarga primer.

### Secondary
- **Signal Lime** (#E8FF2E): satu-satunya aksen bercahaya, glow fokus, aksi utama, badge ARSIP. Tidak pernah jadi background.

### Neutral
- **Warm Paper** (#FFFBF2): dasar halaman dan permukaan mat.
- **Warm Sand** (#F2E9DE): dasar kartu yang tenang dan pita wash.
- **Ink** (#0F0F0E): teks, border, bingkai mount foto, dasar viewer.
- **Warm Grey** (#6B625C): teks sekunder dan caption.
- **Seam Line** (#E8DDD3): divider hairline dan tepi kartu.
- **Notice Wash Yellow** (#FFF8D6) / **Notice Wash Green** (#EFF9E0): isian notice sukses/warn hanya di alur submit.

Overlay putih/hitam translusen (mis. rgba(255,255,255,.14-.86), rgba(0,0,0,.35-.45)) diizinkan untuk scrim, wash, dan fade mask, tidak pernah sebagai isian brand.

### Named Rules
**The Ten-Percent Rule.** Teal hanya mengisi sekitar sepuluh persen dari viewport mana pun, display type, surai, aksi utama. Netral menanggung sisanya; bidang pekat kedua di layar yang sama adalah cacat, bukan variasi.
**The One-Glow Rule.** Glow bercahaya hanya ada di `:focus-visible` dan satu kontrol yang aktif. Glow dekoratif di tempat lain dilarang.

## Typography

**Display Font:** system stack (dengan fallback -apple-system, Segoe UI, Roboto), tanpa webfont; file tidak membawa dependensi jaringan apa pun.
**Body Font:** system stack yang sama.
**Label/Mono Font:** stack yang sama dengan angka tabular untuk counter dan hint kbd.

**Character:** tebal, rapat, cenderung uppercase, huruf handuk sport, bukan serif editorial. Tracking negatif yang rapat di setiap level (-0.02em hingga -0.06em). Kelembutan hadir lewat aksen serif, bukan dengan melunakkan display.

### Hierarchy
- **Display** (950, clamp(48px, 16vw, 164px), 0.78): wordmark hero NALA, jangkar, bukan banjir.
- **Headline** (900, clamp(20px, 2.8vw, 28px), 0.95): judul section dan caption viewer.
- **Title** (950, 18px, 1.0): kepala panel (submit, antrean admin).
- **Body** (650, 14px, 1.5): deskripsi, caption bilah kredit, bantuan formulir. Body copy membentang 13-18px sesuai penekanan (13 meta, 16 intro panel, 18 lead section).
- **Label** (800, 11px, +0.06em, uppercase): chip, badge, hint kbd, penanda SINTETIS.
- **Caption** (800, 10px, +0.02em): judul kartu, meta tile, baris antrean, small print viewer. Ukuran fungsional terkecil adalah 10px.
- **Serif accent** (400 italic Georgia, 13px, 1.5): judul kartu, catatan pameran, baris caption viewer, suara feminin/pelukis. Hanya serif sistem, tidak pernah webfont.

### Named Rules
**The Tight-Tracking Rule.** Display dan headline selalu memakai tracking negatif; tracking renggang hanya muncul di label uppercase.

## Layout

Toolbar sticky (pencarian + chip era/fotografer) menjadi jangkar di atas; grid goods mengalir di bawahnya dengan jarak napas galeri (celah 22px); viewer memenuhi seluruh viewport dengan counter, tag era, dan unduh sebagai satu-satunya chrome yang menetap. Di layar sempit, tipografi menumpuk di atas foto, lapisan tidak pernah tumpang tindih. Rel era menciut jadi titik tepi di tampilan imersif. Ritme spasi lega dan rata: padding section yang lapang, tile terbaca sebagai karya galeri, section dipisah pita wash yang lembut.

**The Contain-Everywhere Rule.** Tidak ada foto yang dipotong di permukaan mana pun: grid, sorotan, viewer, dan thumbnail admin semuanya letterbox (contain) di atas panggung yang seragam; kerapian dijaga bingkai 4/5 + matte paper, bukan crop. Keutuhan arsip menang di semua ukuran layar, portrait maupun landscape.

## Elevation & Depth

Kedalaman berupa bayangan struktural di atas warna datar, bukan kaca ber- blur, bukan gradien. Pelapisan tonal (paper di atas soft wash) menangani pemisahan yang tenang; bayangan menangani angkatan.

### Shadow Vocabulary
- **Goods lift** (`box-shadow: 0 12px 28px rgba(15,15,14,.14), 0 2px 8px rgba(15,15,14,.08)`): kartu foto yang diam dan mini-goods.
- **Float** (`box-shadow: 0 24px 48px rgba(15,15,14,.18)`): frame viewer dan dialog.
- **Focus ring** (`box-shadow: 0 0 0 3px var(--paper), 0 0 0 6px rgba(232,255,46,.9), 0 0 22px rgba(232,255,46,.55)`): hanya untuk fokus keyboard.

### Named Rules
**The Flat-By-Default Rule.** Permukaan datar saat diam. Bayangan hanya muncul sebagai angkatan objek, float dialog, atau state fokus.

## Shapes

Bahasa merchandise yang tenang: border hairline (token line) di kartu, mount, input, dan chip; 1.5px ink yang lebih tebal dicadangkan hanya untuk tombol primer/aksen. Radius kartu yang lapang (18px), chip dan badge pill penuh (999px). Radius fungsional menurun bertahap: surface (16px), panel raised (14px), tile (12px), chip kecil (9px), kbd (7px), tag (6px), hairline (2px). Geometri persegi dan percaya diri; lingkaran hanya muncul untuk avatar dan badge bergaya segel.

**Signature motif: the abstract mane.** Geometri radial datar (pita conic berulang memakai token yang ada, opasitas rendah, fade mask radial) duduk di belakang tipografi hero sebagai tanda singa betina Nala. Aturan: hanya abstrak, hanya token yang ada di dunia ini, di belakang konten (tidak pernah menutupi tipografi atau foto), tepi selalu memudar, surai adalah atmosfer, bukan ilustrasi.

**Painter's ground: canvas grain + one brush divider.** Grain kanvas yang hampir tak terlihat (titik 1px ink/teal di ~0.02 alpha, tiling 4-5px, fixed sepenuh halaman) memberi jiwa kanvas pada paper; satu divider sapuan kuas yang tertahan (teal/ink di opasitas rendah) memisahkan hero dari galeri. Grain berupa titik, bukan garis grid; tekstur hanya hidup di dua tempat ini, di tempat lain tidak.

## Components

### Buttons
- **Shape:** pill (999px), bobot tebal, border ink.
- **Primary:** bidang teal, teks kontras tinggi; hover menggelap ke field-deep.
- **Hover / Focus:** pergeseran warna saat hover; cincin fokus One-Glow saat fokus keyboard.

### Chips
- **Style:** pill, background paper, border ink; state terpilih terisi warna field.
- **State:** chip filter mengganti facet era/fotografer tanpa reload.

### Cards / Containers
- **Corner Style:** radius kartu (18px).
- **Background:** mat paper di atas dasar field atau wash.
- **Shadow Strategy:** goods lift saat diam (lihat Elevation).
- **Border:** hairline (token line) di mount dan frame unggulan; 1.5px ink hanya di tombol primer/aksen.
- **Internal Padding:** tebal dan rata, kartu terbaca sebagai objek meja.

### Inputs / Fields
- **Style:** field paper, border ink, radius kecil.
- **Focus:** cincin fokus One-Glow.
- **Error / Disabled:** blok notice inline (peran sukses/error/warn di alur submit).

### Navigation
- Toolbar sticky: tautan jangkar di kanan; menyusut rapi di layar sempit. Chrome viewer: counter, tag era, unduh, tidak ada lagi yang menetap.

### Quiet-room viewer (signature behavior)
Viewer adalah satu ruang tenang bermaterial paper hangat, lembut, feminin, foto sebagai pemimpin. Doktrin: ruangan melayani foto; satu cahaya, tidak ada pilihan yang perlu dibuat. Viewer selalu berjalan di atas daftar yang sedang terlihat (setelah filter, sort, dan pagination), counter dan panah tidak pernah bertentangan dengan grid.

### Motion (ceria-anggun: cheerful-graceful)
Gerak sesuai Nala: sigap dan hangat, tidak pernah khidmat, tidak pernah memantul. Scroll reveal (fade + naik 12px, 220-320ms ease-out, stagger terbatas, sekali per elemen, konten tetap terlihat tanpa JS). Feedback tekan mikro (scale .97-.98, ≤150ms). Surai hero bernapas dalam loop 68 detik; copy hero naik sekali; tipografi NALA tidak pernah bergerak. Titik crossfade (lebar terpotong instan, potongan bersih, tanpa animasi layout). Pager dalam-tweet: foto keluar 150ms lalu masuk 240ms searah (lanjut geser kiri, mundur geser kanan), bingkai diam; kunci 400ms cegah klik bertumpuk; reduced-motion = ganti instan. Satu penjaga reduced-motion terpusat menetralkan semuanya jadi state instan.

### Archive controls
- **Sort:** select "Terbaru / Terlama" (default Terbaru), field paper dengan border hairline, cincin fokus. Urutan operasi selalu filter → sort → paginate.
- **Stats line:** bisikan kepercayaan yang tenang di kepala galeri, "X foto · Y fotografer · diperbarui [date]" dengan baris kedua (10px uppercase muted). Hitungan mencakup seluruh koleksi; tanggal diperbarui diambil dari item terbaru.
- **Load more:** tombol pill sekunder "Muat lebih banyak", tersembunyi saat semua muat dalam satu halaman (PAGE_SIZE 12). Setiap perubahan filter/pencarian/sort mereset ke halaman satu.
- **Result meta:** baris live "Menampilkan X dari Y" di bawah pencarian.
- **Multi-photo tweet:** satu tweet menampung 1-N foto; kartu menampilkan cover + badge bisikan "+N foto"; viewer membalik foto di dalam tweet (titik + "Foto X dari N", tombol `,`/`.`, panah tetap di level tweet); unduhan mengambil foto yang sedang tampil; hitungan (stats, direktori, meta) menghitung foto sementara pagination/sort/filter berjalan per tweet.

### Frames
Lima varian frame acak-stabil dari token yang ada saja, frame-teal (teal penuh), frame-ink (hairline), frame-mat (mat paper tebal + tape), frame-lime (aksen lime tipis), frame-wash (wash lembut). Ditetapkan deterministik dengan hash id tweet + id foto: stabil di semua render, filter, dan reload, tidak pernah diacak ulang. Foto-foto Nala sendiri selalu memakai frame-teal sebagai penghormatan, tidak pernah acak. Foto yang sama memakai frame yang sama di grid, viewer, dan admin.

### Hero spotlight
"Terbaru dari Nala": 3 foto terbaru dari akun Nala sendiri, diturunkan langsung (terbaru dulu, bertambah otomatis, tanpa filler). Tile spotlight MEMAKAI ULANG sistem kartu galeri (`.card` + `.card-media` + `.card-body` + badge + varian frame) dengan satu konteks ukuran ringkas `.card.spotlight`, satu sumber kebenaran, tidak pernah desain tile paralel. Grid kini contain seperti sorotan: tidak ada permukaan yang memotong foto. Tanggal berada di baris meta-pill, tidak pernah sebagai overlay.

### Resilience
- **Curation pill:** pill serif-italic yang halus "Dikurasi [date]" di meta kartu dan viewer, tanggal sisi galeri (item asli: hari kurasi yang sebenarnya; mock: tanggal sintetis yang ditandai, tidak pernah di masa depan).
- **Report link:** tombol teks muted yang tenang "Laporkan link mati" di kartu dan viewer (tersembunyi di item ARSIP yang sudah diketahui mati); satu laporan per pengunjung per item (disimpan), lalu state nonaktif "Sudah dilaporkan"; toast mengonfirmasi "Terima kasih, akan ditinjau".
- **Admin reports panel:** di dalam antrean persetujuan, flag "Dilaporkan" per item yang dilaporkan beserta hitungan, triase kurasi, bukan mempermalukan publik.

### Pipeline foto (Opsi C)
Foto asli mengalir lewat dua jalur: **otomatis** (tombol "Ambil foto otomatis" memanggil API fixup publik per ID tweet dengan timeout, mengisi kolom + pratinjau — gagal tidak pernah memblokir) dan **manual** (kolom URL gambar 1–4 + pratinjau instan sebagai cadangan yang selalu bisa diandalkan). Submit publik tetap 1 langkah (URL tweet saja). Galeri merender `<img loading="lazy">` dari `image_url_large` (fallback `_orig`) dengan contain di semua permukaan (tidak ada crop di mana pun), dengan fallback `onerror`; unduhan HD memakai `_orig`. Varian tampil vs asli: URL `pbs.twimg.com ?name=orig` diturunkan ke `?name=large` untuk tampil (cepat), `:orig` hanya untuk unduh; foto tetangga di-preload, pager tidak pernah menunggu jaringan. Tanpa kunci, tanpa dependensi, tanpa server baru.

### Photographer directory
Section komunitas yang tenang setelah grid, sebelum footer, tidak pernah bersaing dengan foto. Kartu diturunkan langsung dari koleksi (unik per handle): lingkaran avatar inisial (teal di atas paper), display name, @handle yang menaut ke profil X, hitungan "N foto". Nala sendiri selalu di urutan pertama dengan segel DARI NALA; sisanya diurutkan menurun menurut jumlah foto. Mengklik kartu mengatur filter fotografer, mereset ke halaman satu, membuka filter jika tertutup, dan smooth-scroll ke galeri. Tombol/tautan asli dengan cincin fokus; tanpa bio, foto avatar, atau hitungan follower.

### Bulk submit
Mode textarea di samping formulir URL tunggal: banyak URL (satu per baris, koma/spasi ditoleransi), "Periksa" merender baris status per baris (valid / bukan URL foto-tweet / duplikat-dari-koleksi / duplikat-dalam-batch) memakai validasi dan register pesan yang sama dengan URL tunggal, lalu satu "Kirim N tautan" mendorong hanya baris unik yang valid ke antrean. Ringkasan hitungan berbahasa Indonesia; baris kosong diabaikan.

### Ops tabs (admin)
Lima daftar kelola (antrean, galeri terbit, laporan, ditolak, arsip) tampil satu per satu di balik tab berpill berhitungan; antrean 6 kartu dulu (berat), sisanya 15 baris + Muat lebih banyak. Satu anchor statistik di atas, seksi berjarak lega, aksi penting melempar ke tab tujuannya.

### Confirm dialog (signature behavior)
Pengganti confirm() browser untuk hapus permanen: surai radial di kepala, segel "!" cincin ganda, judul dengan mark lime di kata bahaya, strip sampai 3 thumbnail itemnya, copy faktual + bisikan serif "Nala jagain arsip ini baik-baik kok.". Tombol Batalkan aja (fokus awal, selalu aman), aksi aman teal (mis. Arsipkan saja), Hapus permanen tinta. Esc/klik luar = batal, fokus dikurung lalu dikembalikan, tanpa gerak saat reduced-motion.

### Live page
Satu panel di halaman sendiri (live.html) berisi timeline X resmi: lazy-load saat di-scroll (hemat request ke X), baris status + tombol Coba lagi bila X membatasi (429), selalu ada tautan Buka langsung di X. Galeri tidak tersentuh script X.

### Credit Bar (signature component)
Penulis (tebal, 13px) + caption + tautan tweet sumber + penanda SINTETIS selama placeholder masih ada. Sumber yang terhapus tampil desaturasi dengan tekstur garis, snapshot tetap tersimpan, tidak pernah kosong.

### Voice Moments (signature behavior)
Microcopy ala Nala dalam register MC-nya yang ceria, sepenuhnya berbahasa Indonesia: sapaan Hai-hai!, perayaan Roar!, penyemangat "semangat!/tetap semangat!", frasa hangat yang santai ("tetap nempel ya", "favoritmu", "yuk"). Verba aksi (Buka, Unduh, Tutup, Setujui, Tolak) tetap jelas, nuansa hidup di sekitarnya, bukan di dalamnya. Error tetap ramah dan instruktif ("coba lagi ya"). Kurasi bernama #SeniNala; kiriman "Dititipkan oleh Nalania". Voice tidak pernah menyentuh kejelasan error, data tweet asli, atau penanda sistem.

## Do's and Don'ts

### Do:
- **Do** biarkan foto memimpin, web adalah panggung, Nala penampilnya; keindahan miliknya, bingkai mengalah.
- **Do** pertahankan badge SINTETIS di setiap placeholder sampai data tweet asli menggantikannya (lihat daftar pengganti di handoff build).
- **Do** jaga penulis, caption, dan tautan sumber tetap menempel di setiap foto, termasuk sumber yang mati.
- **Do** kirim tanpa dependensi jaringan, hanya SVG/CSS inline.
- **Do** uji keyboard-only di setiap permukaan baru: panah, Enter, Esc harus semuanya berfungsi.
- **Do** sebut kurasi #SeniNala dan atribusikan kiriman kepada Nalania, hashtag dan fanbase miliknya, bukan branding karangan.
- **Do** jaga Nala Teal sebagai satu-satunya bidang yang disepakati, dipatok pemilik dari unggahannya, jangan ditukar sembarangan.

### Don't:
- **Don't** mengklaim afiliasi resmi JKT48, pembingkaian karya penggemar adalah komitmen brand.
- **Don't** menambahkan bidang pekat kedua ke viewport yang sudah memilikinya.
- **Don't** memakai glow secara dekoratif di luar `:focus-visible` dan kontrol yang aktif.
- **Don't** menumpuk tipografi display di atas foto di lebar sempit, tumpuk, jangan tutupi.
- **Don't** mengarang handle fotografer, caption, atau URL tweet, mock tetap fiktif secara kasatmata sampai data asli mendarat.
- **Don't** menggambar singa harfiah di mana pun, surai adalah geometri abstrak atau tidak usah dikirim.

