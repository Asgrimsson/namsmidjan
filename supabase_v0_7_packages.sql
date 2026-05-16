-- Námsmiðjan v0.7 — Verkefnapakkar
-- Keyrðu þessa skrá í Supabase SQL Editor eftir v0.5.
-- Hún býr til töflu fyrir verkefnapakka kennara.

create table if not exists public.namsmidjan_packages (
  id text primary key,
  workspace text not null default 'vallaskoli',
  title text not null,
  code text default '',
  subject text default '',
  grades jsonb not null default '[]'::jsonb,
  time text default '',
  module_id text default '',
  description text default '',
  goal text default '',
  questions jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.namsmidjan_packages enable row level security;

grant usage on schema public to anon;
grant usage on schema public to authenticated;

grant select on table public.namsmidjan_packages to anon, authenticated;
grant insert, update, delete on table public.namsmidjan_packages to authenticated;
revoke insert, update, delete on table public.namsmidjan_packages from anon;

drop policy if exists "packages_public_read_v07" on public.namsmidjan_packages;
drop policy if exists "packages_teacher_insert_v07" on public.namsmidjan_packages;
drop policy if exists "packages_teacher_update_v07" on public.namsmidjan_packages;
drop policy if exists "packages_teacher_delete_v07" on public.namsmidjan_packages;

create policy "packages_public_read_v07"
on public.namsmidjan_packages
for select
to anon, authenticated
using (true);

create policy "packages_teacher_insert_v07"
on public.namsmidjan_packages
for insert
to authenticated
with check (true);

create policy "packages_teacher_update_v07"
on public.namsmidjan_packages
for update
to authenticated
using (true)
with check (true);

create policy "packages_teacher_delete_v07"
on public.namsmidjan_packages
for delete
to authenticated
using (true);

create index if not exists namsmidjan_packages_workspace_idx on public.namsmidjan_packages(workspace);
create index if not exists namsmidjan_packages_code_idx on public.namsmidjan_packages(code);
