-- ============================================================
-- Nala's Gallery — Supabase schema (PROJECT BARU, TERPISAH
-- dari project bisnis ClientPulse)
-- Cara pakai: buat project Supabase baru → buka SQL Editor →
-- paste seluruh file ini → Run. Lalu buat 1 user admin di
-- dashboard (Authentication > Users) dan jalankan blok
-- "Tandai admin" di paling bawah dengan user id tersebut.
-- ============================================================

-- ---------- 1. Tabel profiles ----------
create table if not exists public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  is_admin boolean not null default false,
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;

-- ---------- 1b. Helper admin (SECURITY DEFINER) ----------
-- Harus SETELAH tabel profiles dibuat (Postgres memvalidasi
-- isi SQL-function saat CREATE).
create or replace function public.is_admin()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1 from public.profiles p
    where p.id = auth.uid() and p.is_admin = true
  );
$$;

drop policy if exists "profiles_select_own_or_admin" on public.profiles;
create policy "profiles_select_own_or_admin" on public.profiles
  for select using (auth.uid() = id or public.is_admin());

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own" on public.profiles
  for insert with check (auth.uid() = id);

drop policy if exists "profiles_update_admin" on public.profiles;
create policy "profiles_update_admin" on public.profiles
  for update using (public.is_admin());

-- ---------- 2. Tabel tweets (1 tweet = 1 unit, berisi 1-N foto) ----------
create table if not exists public.tweets (
  id uuid primary key default gen_random_uuid(),
  url text not null unique,
  author text not null,
  handle text not null,
  caption text not null default '',
  tweet_date date,
  curated_at date not null default current_date,
  status text not null default 'pending'
    check (status in ('pending', 'approved', 'rejected')),
  report_count integer not null default 0,
  created_at timestamptz not null default now()
);
alter table public.tweets enable row level security;

-- Baca: publik hanya yang approved; admin semua.
drop policy if exists "tweets_select_approved_or_admin" on public.tweets;
create policy "tweets_select_approved_or_admin" on public.tweets
  for select using (status = 'approved' or public.is_admin());

-- Tulis publik: hanya INSERT berstatus pending (kotak saran terkunci).
drop policy if exists "tweets_insert_pending_only" on public.tweets;
create policy "tweets_insert_pending_only" on public.tweets
  for insert with check (status = 'pending');

-- Ubah/hapus: admin saja.
drop policy if exists "tweets_update_admin" on public.tweets;
create policy "tweets_update_admin" on public.tweets
  for update using (public.is_admin());

drop policy if exists "tweets_delete_admin" on public.tweets;
create policy "tweets_delete_admin" on public.tweets
  for delete using (public.is_admin());

-- Index: arsip selalu disaring status + diurutkan tanggal.
create index if not exists tweets_status_date_idx
  on public.tweets (status, tweet_date desc nulls last);
-- Partial index khusus bacaan publik (approved saja).
create index if not exists tweets_approved_date_idx
  on public.tweets (tweet_date desc)
  where status = 'approved';

-- ---------- 3. Tabel photos (N foto per tweet) ----------
create table if not exists public.photos (
  id uuid primary key default gen_random_uuid(),
  tweet_id uuid not null references public.tweets (id) on delete cascade,
  position integer not null default 0,
  image_url_orig text,
  image_url_large text,
  width integer,
  height integer,
  created_at timestamptz not null default now(),
  unique (tweet_id, position)
);
alter table public.photos enable row level security;

-- Baca: foto milik tweet approved (publik) atau admin.
drop policy if exists "photos_select_via_tweet_or_admin" on public.photos;
create policy "photos_select_via_tweet_or_admin" on public.photos
  for select using (
    public.is_admin()
    or exists (
      select 1 from public.tweets t
      where t.id = tweet_id and t.status = 'approved'
    )
  );

-- Tulis: admin saja (foto ditambahkan saat approval/kurasi).
drop policy if exists "photos_write_admin" on public.photos;
create policy "photos_write_admin" on public.photos
  for all using (public.is_admin()) with check (public.is_admin());

create index if not exists photos_tweet_position_idx
  on public.photos (tweet_id, position);

-- ---------- 4. Tabel reports (laporan link mati) ----------
create table if not exists public.reports (
  id uuid primary key default gen_random_uuid(),
  tweet_id uuid not null references public.tweets (id) on delete cascade,
  note text not null default '',
  created_at timestamptz not null default now()
);
alter table public.reports enable row level security;

-- Lapor: siapa pun boleh menulis (kotak saran kedua).
drop policy if exists "reports_insert_anyone" on public.reports;
create policy "reports_insert_anyone" on public.reports
  for insert with check (true);

-- Baca/hapus: admin saja.
drop policy if exists "reports_select_admin" on public.reports;
create policy "reports_select_admin" on public.reports
  for select using (public.is_admin());

drop policy if exists "reports_delete_admin" on public.reports;
create policy "reports_delete_admin" on public.reports
  for delete using (public.is_admin());

create index if not exists reports_tweet_idx on public.reports (tweet_id);

-- ---------- 5. Storage: bucket nala-photos (baca publik, tulis admin) ----------
insert into storage.buckets (id, name, public)
values ('nala-photos', 'nala-photos', true)
on conflict (id) do nothing;

drop policy if exists "storage_public_read" on storage.objects;
create policy "storage_public_read" on storage.objects
  for select using (bucket_id = 'nala-photos');

drop policy if exists "storage_write_admin" on storage.objects;
create policy "storage_write_admin" on storage.objects
  for all using (
    bucket_id = 'nala-photos' and public.is_admin()
  ) with check (
    bucket_id = 'nala-photos' and public.is_admin()
  );

-- ============================================================
-- 6. TANDAI ADMIN (jalankan sekali, ganti USER_ID):
--
--   insert into public.profiles (id, is_admin)
--   values ('USER_ID-DARI-DASHBOARD', true)
--   on conflict (id) do update set is_admin = true;
--
-- Ambil USER_ID dari dashboard: Authentication > Users > klik
-- user admin > salin UID.
-- ============================================================
