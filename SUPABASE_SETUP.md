# Supabase uppsetning fyrir Námsmiðjuna v0.4

## 1. Búa til Supabase project

1. Farðu á supabase.com.
2. Veldu **New project**.
3. Gefðu verkefninu nafn, t.d. `namsmidjan`.
4. Veldu sterkt database password og geymdu það.
5. Bíddu þar til verkefnið er tilbúið.

## 2. Keyra SQL-skrána

1. Opnaðu Supabase project.
2. Farðu í **SQL Editor**.
3. Búðu til nýja query.
4. Afritaðu allt úr skránni `supabase_schema.sql`.
5. Keyrðu SQL.

Þetta býr til töflurnar:

- `namsmidjan_modules`
- `namsmidjan_tasks`
- `namsmidjan_progress`

## 3. Finna URL og anon key

1. Farðu í **Project Settings**.
2. Farðu í **Data API** eða **API keys**.
3. Afritaðu:
   - Project URL
   - anon/public key

## 4. Tengja vefinn

1. Opnaðu `index.html`.
2. Smelltu á **Gagnagrunnur**.
3. Settu inn:
   - Supabase Project URL
   - Supabase anon key
   - Workspace ID, t.d. `vallaskoli`
4. Smelltu á **Vista tengingu**.
5. Smelltu á **Prófa tengingu**.
6. Smelltu á **Senda local gögn í Supabase**.

## 5. Sækja gögn á annarri tölvu

1. Opnaðu sama vef á annarri tölvu.
2. Settu inn sömu Supabase stillingar.
3. Smelltu á **Sækja gögn úr Supabase**.

## Öryggisathugasemd

v0.4 notar einfaldar RLS reglur sem leyfa anon notendum að lesa/skrifa.
Þetta er gott til prófana og lokaðs skólatóls, en v0.5 ætti að bæta við innskráningu kennara/nemenda og strangari reglum.


---

# Uppfærsla í v0.5 — Auth og öryggi

Eftir að `supabase_schema.sql` hefur verið keyrt skaltu keyra:

`supabase_v0_5_security.sql`

Þessi skrá breytir réttindum þannig að:

- anon/gestir mega lesa námsvefi og verkefni
- authenticated/innskráðir kennarar mega skrifa námsvefi og verkefni
- nemendur geta skilað framvindu með kóða
- kennari getur lesið framvindu

## Supabase Auth

Farðu í Supabase:

1. Authentication
2. Sign In / Providers
3. Email
4. Hafðu Email provider virkan

Fyrir fyrstu prófun geturðu búið til kennaraaðgang beint í Námsmiðjunni undir **Innskráning**.
Ef Supabase krefst email confirmation þarftu að staðfesta tölvupóst eða breyta Auth stillingum tímabundið fyrir prófun.
