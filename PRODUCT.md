# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

Supabase (Postgres + Auth) dengan frontend statis, pengguna memilih Supabase untuk backend pengiriman tautan/persetujuan dan admin login penuh. Tanpa rehosting file: foto tampil lewat embed Twitter/X, jadi tidak perlu pipeline penyimpanan.

## Users

Penggemar Shabilqis Naila (Nala), member JKT48, mayoritas basis penggemar Indonesia yang menjelajah lewat ponsel. Tiga peran: (1) pengunjung galeri yang menemukan dan mengunduh foto; (2) kontributor yang mengirim tautan Twitter/X tanpa akun; (3) pemilik (admin tunggal) yang mengkurasi lewat setujui/tolak. Tugas utama: menjelajah dan menikmati foto-foto kurasi Nala.

## Product Purpose

Galeri bergaya Pixabay yang didedikasikan untuk Shabilqis Naila (Nala) dari JKT48, bisa dicari, atribusi tetap terlihat, bersumber dari tautan Twitter/X bukan unggahan file. Penggemar mengirim tautan tweet lewat formulir terbuka; tweet yang disetujui tampil sebagai embed yang menjaga siapa pengunggah dan apa isi caption-nya. Keberhasilan berarti pengunjung mudah mencari, menjelajah, dan mengunduh foto Nala sementara fotografer tetap mendapat kredit yang terlihat.

## Positioning

Galeri khusus satu member untuk Nala dengan atribusi bawaan, berbeda dari akun repost yang menghapus kredit, setiap foto membawa pengunggah dan caption-nya lewat embed tweet asli. Pengiriman terbuka dengan kurasi manusia: siapa pun boleh mengirim tautan, hanya tweet yang disetujui yang tampil. Dibuat oleh penggemar; tanpa afiliasi resmi yang terkonfirmasi (jangan diklaim).

## Operating Context

Penjelajahan yang mengutamakan foto, mayoritas lewat ponsel, konteks audiens Indonesia, UI sepenuhnya berbahasa Indonesia. Empat halaman berbagi satu stylesheet: index.html sepenuhnya tentang Nala (hero, galeri, viewer); upload.html adalah halaman pengiriman publik (formulir tunggal + massal); live.html adalah halaman update X (embed timeline resmi yang lazy-load); n4l4/ adalah halaman admin tersembunyi tanpa tautan (5 tab: antrean, galeri terbit, laporan, ditolak, arsip), hanya bisa diakses lewat URL langsung. Tautan share per foto dilayani Worker nala-foto di luar repo (meta caption + foto untuk crawler, manusia diarahkan ke galeri). Alur pengiriman: upload.html → antrean n4l4 via Supabase (status pending → approve). Alur kerja: cari/jelajahi galeri, buka viewer foto (foto + bilah kredit berisi penulis, caption, tautan ke tweet asli), unduh HD lewat gambar sumber ukuran asli, kirim tautan Twitter lewat formulir, pemilik meninjau antrean moderasi dengan pratinjau tweet langsung. Penggunaan oleh penggemar: mengecek foto baru, mencari karya fotografer tertentu, menyimpan wallpaper.

## Capabilities and Constraints

Terkonfirmasi: galeri membaca approved via Supabase REST (fetch langsung, anon key publik, RLS menegakkan), grid yang bisa dicari/difilter, viewer foto imersif dengan bilah kredit (penulis + caption + tautan ke tweet sumber), unduhan HD lewat gambar sumber ukuran asli, pengiriman tautan Twitter terbuka (tanpa login) dengan validasi URL dan dedupe, antrean persetujuan pemilik dengan pratinjau tweet (setujui/tolak), area admin di balik login penuh, snapshot penulis/caption/URL gambar disimpan saat persetujuan (galeri tetap menyimpan kredit meski tweet nanti dihapus).

Batasan: hanya URL tweet foto Twitter/X yang valid yang diterima; tidak ada yang terbit sebelum disetujui; satu akun pemilik-admin; halaman admin/ops berada di jalur diskret /n4l4 (sekadar pengaburan, bukan pengganti login).

Diputuskan belakangan dan sudah jalan: avatar author tertarik otomatis saat kurasi lalu tampil di direktori fotografer + viewer; tweet arsip-mati disembunyikan total dari galeri dan dikelola di tab Arsip (kembalikan/hapus permanen); tautan share per foto via Worker nala-foto (og:title/description/image, manusia diarahkan ke galeri); halaman live.html berisi timeline X resmi; admin bertab (antrean, galeri terbit, laporan, ditolak, arsip) dengan paginasi, dialog hapus custom, pratinjau thumbnail per baris, dan logout otomatis saat sesi habis; throttle server per IP (30 kirim / 60 lapor per jam) dengan pesan jeda ramah; tameng render safeHttpUrl + CHECK format URL + batas caption/author.

Yang masih eksplisit belum diputuskan: dukungan tweet video/GIF, perlindungan spam tingkat bot serius (Turnstile), status perizinan/lisensi foto. Sudah diputuskan: kolom pencarian/filter (caption, fotografer, era), perlakuan tweet yang dihapus (sembunyi total dari galeri + kelola di tab Arsip).

## Brand Commitments

Nama: "Nala's Gallery". Subjek: Shabilqis Naila (Nala) dari JKT48, sesuai pernyataan pengguna: "ini adalah gallery untuk foto foto dari salah satu member jkt 48 yaitu Shabilqis Naila (nala)". Belum ada logo, voice, atau identitas visual yang terkonfirmasi. Dunia visual terkunci: GOODS WORLD (tipografi NALA raksasa di atas bidang warna datar ala goods idola). Warna bidang yang disepakati: Nala Teal (keluarga #0E7C86), dipatok pemilik dari unggahan #SeniNala milik Nala sendiri. Voice/penamaan yang disetujui (dari riset karakter): nama kurasi #SeniNala, baris atribusi Nalania ("Dititipkan oleh Nalania"), register microcopy Roar!/Hai-hai!. Jangkar karakter: identitas singa betina (nama + jikoshoukai "Roar!"), dualitas gagah-feminin, hobi melukis/mahasiswa DKV.

## Evidence on Hand

Kode galeri saat ini tidak memuat item apa pun (pemilik memerintahkan semua mock dikosongkan; data asli pertama di bawah ini disimpan untuk dimasukkan kembali bersama file foto). Data asli pertama (terverifikasi langsung lewat X oEmbed): (1) @Nala_JKT48 (Shabilqis Naila sendiri), "#SeniNala", https://x.com/Nala_JKT48/status/2081784289973387574, 27 Jul 2026; (2) @nocontext_Nala (akun penggemar "kerandoman Nala"), "Pretty little baby ‧₊˚♪ 𝄞₊ ♫ ˚⊹", https://x.com/nocontext_Nala/status/2094051625673596936, 30 Aug 2026; (3) @48timee ("48TIME"), "JKT48 Birthday T-Shirt Nala", https://x.com/48timee/status/2084581472334434811, 4 Aug 2026. File foto R1 sudah terpasang (pbs.twimg.com, 306px, via pipeline Opsi C); R2–R3 dan seterusnya menyusul. Mock yang tersisa tetap sintetis dan diberi label. Tidak ada aset logo atau copy selain yang di atas. Pengerjaan selanjutnya tidak boleh memfabrikasi foto Nala. Tidak ada testimoni, studi kasus, liputan pers, atau benchmark yang tersedia.

## Product Principles

1. Nala adalah bintang utama, setiap permukaan mengutamakan fotonya, chrome belakangan.
2. Kredit tetap menempel, penulis dan caption ikut bersama setiap foto, tidak pernah dilepas.
3. Terbuka tapi terkurasi, siapa pun boleh mengirim tautan, hanya tweet yang disetujui yang tampil; antrean adalah standar kualitas.
4. Pembingkaian jujur sebagai karya penggemar, jangan pernah mengklaim afiliasi resmi JKT48 kecuali terkonfirmasi.
5. Ringan dan cepat, gambar pratinjau tetap ringan, HD hanya saat diminta.
