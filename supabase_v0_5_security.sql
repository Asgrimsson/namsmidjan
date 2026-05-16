-- Námsmiðjan v0.5 — öruggari Supabase réttindi
-- Keyrðu þessa skrá EFTIR að v0.4 supabase_schema.sql hefur verið keyrt.
-- Markmið:
-- 1. Kennari þarf að vera authenticated til að búa til/breyta/eyða námsvefjum og verkefnum.
-- 2. Nemendur/gestir mega lesa námsvefi og verkefni.
-- 3. Nemendur/gestir mega skila framvindu með kóða.
-- 4. Kennari/authenticated má lesa alla framvindu.

grant usage on schema public to anon;
grant usage on schema public to authenticated;

-- Hreinsum eldri v0.4 policies sem leyfðu anon að skrifa allt.
drop policy if exists "namsmidjan_modules_anon_select" on public.namsmidjan_modules;
drop policy if exists "namsmidjan_modules_anon_insert" on public.namsmidjan_modules;
drop policy if exists "namsmidjan_modules_anon_update" on public.namsmidjan_modules;
drop policy if exists "namsmidjan_modules_anon_delete" on public.namsmidjan_modules;

drop policy if exists "namsmidjan_tasks_anon_select" on public.namsmidjan_tasks;
drop policy if exists "namsmidjan_tasks_anon_insert" on public.namsmidjan_tasks;
drop policy if exists "namsmidjan_tasks_anon_update" on public.namsmidjan_tasks;
drop policy if exists "namsmidjan_tasks_anon_delete" on public.namsmidjan_tasks;

drop policy if exists "namsmidjan_progress_anon_select" on public.namsmidjan_progress;
drop policy if exists "namsmidjan_progress_anon_insert" on public.namsmidjan_progress;
drop policy if exists "namsmidjan_progress_anon_update" on public.namsmidjan_progress;
drop policy if exists "namsmidjan_progress_anon_delete" on public.namsmidjan_progress;

-- Námsvefir: allir mega lesa, aðeins authenticated má skrifa.
grant select on table public.namsmidjan_modules to anon, authenticated;
grant insert, update, delete on table public.namsmidjan_modules to authenticated;
revoke insert, update, delete on table public.namsmidjan_modules from anon;

-- Verkefni: allir mega lesa, aðeins authenticated má skrifa.
grant select on table public.namsmidjan_tasks to anon, authenticated;
grant insert, update, delete on table public.namsmidjan_tasks to authenticated;
revoke insert, update, delete on table public.namsmidjan_tasks from anon;

-- Framvinda: nemendur mega skila með kóða; kennari má lesa/eyða.
grant select on table public.namsmidjan_progress to authenticated;
grant insert, update on table public.namsmidjan_progress to anon, authenticated;
grant delete on table public.namsmidjan_progress to authenticated;
revoke select, delete on table public.namsmidjan_progress from anon;

-- MODULES
create policy "modules_public_read_v05"
on public.namsmidjan_modules
for select
to anon, authenticated
using (true);

create policy "modules_teacher_insert_v05"
on public.namsmidjan_modules
for insert
to authenticated
with check (true);

create policy "modules_teacher_update_v05"
on public.namsmidjan_modules
for update
to authenticated
using (true)
with check (true);

create policy "modules_teacher_delete_v05"
on public.namsmidjan_modules
for delete
to authenticated
using (true);

-- TASKS
create policy "tasks_public_read_v05"
on public.namsmidjan_tasks
for select
to anon, authenticated
using (true);

create policy "tasks_teacher_insert_v05"
on public.namsmidjan_tasks
for insert
to authenticated
with check (true);

create policy "tasks_teacher_update_v05"
on public.namsmidjan_tasks
for update
to authenticated
using (true)
with check (true);

create policy "tasks_teacher_delete_v05"
on public.namsmidjan_tasks
for delete
to authenticated
using (true);

-- PROGRESS
create policy "progress_teacher_read_v05"
on public.namsmidjan_progress
for select
to authenticated
using (true);

create policy "progress_student_insert_v05"
on public.namsmidjan_progress
for insert
to anon, authenticated
with check (true);

create policy "progress_student_update_v05"
on public.namsmidjan_progress
for update
to anon, authenticated
using (true)
with check (true);

create policy "progress_teacher_delete_v05"
on public.namsmidjan_progress
for delete
to authenticated
using (true);
