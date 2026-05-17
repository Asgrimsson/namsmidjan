-- Námsmiðjan v1.4 — Bekkir og nemendaskrá
create table if not exists public.namsmidjan_classes (
  id text primary key,
  workspace text not null default 'vallaskoli',
  name text not null,
  grade text,
  teacher text,
  description text,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.namsmidjan_students (
  id text primary key,
  workspace text not null default 'vallaskoli',
  class_id text references public.namsmidjan_classes(id) on delete cascade,
  name text not null,
  display_name text,
  group_name text,
  student_code text,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.namsmidjan_classes enable row level security;
alter table public.namsmidjan_students enable row level security;

grant usage on schema public to anon, authenticated;
grant select on table public.namsmidjan_classes to anon;
grant select on table public.namsmidjan_students to anon;
grant select, insert, update, delete on table public.namsmidjan_classes to authenticated;
grant select, insert, update, delete on table public.namsmidjan_students to authenticated;

drop policy if exists "classes_anon_read_v14" on public.namsmidjan_classes;
drop policy if exists "classes_auth_all_v14" on public.namsmidjan_classes;
drop policy if exists "students_anon_read_v14" on public.namsmidjan_students;
drop policy if exists "students_auth_all_v14" on public.namsmidjan_students;

create policy "classes_anon_read_v14" on public.namsmidjan_classes for select to anon using (is_active = true);
create policy "classes_auth_all_v14" on public.namsmidjan_classes for all to authenticated using (true) with check (true);
create policy "students_anon_read_v14" on public.namsmidjan_students for select to anon using (is_active = true);
create policy "students_auth_all_v14" on public.namsmidjan_students for all to authenticated using (true) with check (true);

create index if not exists namsmidjan_classes_workspace_idx on public.namsmidjan_classes(workspace);
create index if not exists namsmidjan_students_workspace_idx on public.namsmidjan_students(workspace);
create index if not exists namsmidjan_students_class_idx on public.namsmidjan_students(class_id);
