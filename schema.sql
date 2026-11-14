-- Run in Supabase: SQL Editor -> New query -> paste -> Run
create table if not exists public.scores (
  user_id uuid primary key references auth.users(id) on delete cascade,
  name text not null,
  best int not null default 0,
  updated_at timestamptz default now()
);
alter table public.scores enable row level security;
create policy "read all scores" on public.scores for select using (true);
create policy "insert own score" on public.scores for insert with check (auth.uid() = user_id);
create policy "update own score" on public.scores for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
