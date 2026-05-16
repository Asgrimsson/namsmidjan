-- Námsmiðjan v0.4 — Supabase schema
-- Keyrðu þessa skrá í Supabase SQL Editor.
-- Hún býr til þrjár töflur: námsvefi, verkefni og framvindu.
-- Þetta er einföld byrjendaútgáfa með workspace dálki.

create table if not exists public.namsmidjan_modules (
  id text primary key,
  workspace text not null default 'vallaskoli',
  title text not null,
  icon text default '✦',
  subject text default '',
  grades jsonb not null default '[]'::jsonb,
  type text default '',
  url text default '#',
  description text default '',
  tags jsonb not null default '[]'::jsonb,
  color text default 'rgba(125,211,252,.20)',
  updated_at timestamptz not null default now()
);

create table if not exists public.namsmidjan_tasks (
  id text primary key,
  workspace text not null default 'vallaskoli',
  title text not null,
  code text default '',
  subject text default '',
  type text default '',
  grades jsonb not null default '[]'::jsonb,
  time text default '',
  level text default 'Miðlungs',
  module_id text default '',
  description text default '',
  goal text default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.namsmidjan_progress (
  id text primary key,
  workspace text not null default 'vallaskoli',
  student_name text default 'Ónefndur',
  code text default '',
  task_id text default '',
  task_title text default '',
  status text default 'not_started',
  note text default '',
  xp integer not null default 0,
  updated_at timestamptz not null default now()
);

-- Kveikjum á Row Level Security.
alter table public.namsmidjan_modules enable row level security;
alter table public.namsmidjan_tasks enable row level security;
alter table public.namsmidjan_progress enable row level security;

-- Byrjendastefna fyrir v0.4:
-- Leyfir anon notendum að lesa og skrifa í þessar töflur.
-- Þetta er í lagi fyrir lokaðan/prófunarvef, en v0.5 ætti að bæta við innskráningu.
drop policy if exists "namsmidjan_modules_anon_select" on public.namsmidjan_modules;
drop policy if exists "namsmidjan_modules_anon_insert" on public.namsmidjan_modules;
drop policy if exists "namsmidjan_modules_anon_update" on public.namsmidjan_modules;
drop policy if exists "namsmidjan_modules_anon_delete" on public.namsmidjan_modules;

create policy "namsmidjan_modules_anon_select" on public.namsmidjan_modules for select to anon using (true);
create policy "namsmidjan_modules_anon_insert" on public.namsmidjan_modules for insert to anon with check (true);
create policy "namsmidjan_modules_anon_update" on public.namsmidjan_modules for update to anon using (true) with check (true);
create policy "namsmidjan_modules_anon_delete" on public.namsmidjan_modules for delete to anon using (true);

drop policy if exists "namsmidjan_tasks_anon_select" on public.namsmidjan_tasks;
drop policy if exists "namsmidjan_tasks_anon_insert" on public.namsmidjan_tasks;
drop policy if exists "namsmidjan_tasks_anon_update" on public.namsmidjan_tasks;
drop policy if exists "namsmidjan_tasks_anon_delete" on public.namsmidjan_tasks;

create policy "namsmidjan_tasks_anon_select" on public.namsmidjan_tasks for select to anon using (true);
create policy "namsmidjan_tasks_anon_insert" on public.namsmidjan_tasks for insert to anon with check (true);
create policy "namsmidjan_tasks_anon_update" on public.namsmidjan_tasks for update to anon using (true) with check (true);
create policy "namsmidjan_tasks_anon_delete" on public.namsmidjan_tasks for delete to anon using (true);

drop policy if exists "namsmidjan_progress_anon_select" on public.namsmidjan_progress;
drop policy if exists "namsmidjan_progress_anon_insert" on public.namsmidjan_progress;
drop policy if exists "namsmidjan_progress_anon_update" on public.namsmidjan_progress;
drop policy if exists "namsmidjan_progress_anon_delete" on public.namsmidjan_progress;

create policy "namsmidjan_progress_anon_select" on public.namsmidjan_progress for select to anon using (true);
create policy "namsmidjan_progress_anon_insert" on public.namsmidjan_progress for insert to anon with check (true);
create policy "namsmidjan_progress_anon_update" on public.namsmidjan_progress for update to anon using (true) with check (true);
create policy "namsmidjan_progress_anon_delete" on public.namsmidjan_progress for delete to anon using (true);

-- Gagnlegt index fyrir leit eftir workspace/kóða.
create index if not exists namsmidjan_modules_workspace_idx on public.namsmidjan_modules(workspace);
create index if not exists namsmidjan_tasks_workspace_idx on public.namsmidjan_tasks(workspace);
create index if not exists namsmidjan_tasks_code_idx on public.namsmidjan_tasks(code);
create index if not exists namsmidjan_progress_workspace_idx on public.namsmidjan_progress(workspace);
create index if not exists namsmidjan_progress_code_idx on public.namsmidjan_progress(code);
