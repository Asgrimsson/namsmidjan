-- Námsmiðjan v1.5 — Úthlutun verkefna á bekki og hópa
-- Keyra í Supabase SQL Editor eftir v1.4 SQL.

create table if not exists public.namsmidjan_assignments (
  id text primary key,
  workspace text not null default 'vallaskoli',
  task_id text not null,
  task_title text,
  task_code text,
  class_id text,
  class_name text,
  group_name text,
  instructions text,
  due_date date,
  status text not null default 'active',
  visible_to_students boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.namsmidjan_assignments enable row level security;

grant usage on schema public to anon, authenticated;
grant select on table public.namsmidjan_assignments to anon;
grant select, insert, update, delete on table public.namsmidjan_assignments to authenticated;

drop policy if exists "assignments_anon_read_v15" on public.namsmidjan_assignments;
drop policy if exists "assignments_auth_all_v15" on public.namsmidjan_assignments;

create policy "assignments_anon_read_v15"
on public.namsmidjan_assignments
for select
to anon
using (visible_to_students = true and status = 'active');

create policy "assignments_auth_all_v15"
on public.namsmidjan_assignments
for all
to authenticated
using (true)
with check (true);

create index if not exists namsmidjan_assignments_workspace_idx on public.namsmidjan_assignments(workspace);
create index if not exists namsmidjan_assignments_class_idx on public.namsmidjan_assignments(class_id);
create index if not exists namsmidjan_assignments_task_idx on public.namsmidjan_assignments(task_id);
create index if not exists namsmidjan_assignments_status_idx on public.namsmidjan_assignments(status);
