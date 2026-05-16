# Námsmiðjan v1.3 — Eyða flísum og autosync

## Uppfærsla

```bash
cd C:\Namsmidjan
git add .
git commit -m "Baeti vid eyda flisum og autosync v1.3"
git push
```

## Hvernig eyði ég flís?

1. Opnaðu Námsmiðjuna.
2. Sæktu gögn úr Supabase.
3. Skráðu þig inn sem kennari.
4. Finndu flísina.
5. Smelltu á **Eyða**.
6. Staðfestu.

Ef Supabase er tengt og kennari er innskráður reynir kerfið að eyða flísinni úr Supabase líka.

## Autosync

Farðu í:

Gagnagrunnur → Samstilling → Sjálfvirk eftir vistun

Þá reynir kerfið að senda breytingar í Supabase eftir vistun, breytingu eða eyðingu.

## Athugið

Autosync virkar aðeins ef:
- Supabase stillingar eru komnar inn
- kennari er innskráður
- RLS réttindi leyfa skrif/eyðingu
