# Námsmiðjan v1.0 — leiðbeiningar fyrir skólastofuútgáfu

## Uppfæra á Netlify

1. Afþjappaðu v1.0 ZIP-pakkanum.
2. Farðu inn í `namsmidjan_v0_1`.
3. Afritaðu allt yfir `C:\Namsmidjan`.
4. Í CMD:

```bash
cd C:\Namsmidjan
git add .
git commit -m "Uppfaeri Namsmidjuna i v1.0 public beta"
git push
```

Netlify deployar sjálfkrafa.

## Hvað þarf að vera tengt?

### Netlify
- `OPENAI_API_KEY`
- `OPENAI_MODEL=gpt-4.1-mini`
- Function: `/.netlify/functions/generate-package`

### Supabase
- Project URL
- Publishable key
- Workspace: `vallaskoli`
- Kennarainnskráning

## Hvernig sinkar kerfið?

### Kennari býr til verkefni
AI verkefnasmiður / Verkefnasmiður → Vista sem verkefnapakka → Gagnagrunnur → Senda local gögn í Supabase.

### Kennari opnar vef á nýrri tölvu
Gagnagrunnur → Setja inn Supabase URL/key ef þarf → Innskráning → Sækja gögn úr Supabase.

### Nemendur vinna
Nemendagátt → Nafn/hópur → Verkefnakóði → Merkja stöðu → Kennari sækir nýjustu gögn.

## Fyrsta 10 mínútna prófun

1. Opnaðu `https://namsmidjan.netlify.app`
2. Skráðu þig inn sem kennari.
3. Smelltu á AI verkefnasmiður.
4. Búðu til verkefni: “Eldgos fyrir 5. bekk”.
5. Vistaðu sem verkefnapakka.
6. Sendu local gögn í Supabase.
7. Opnaðu Nemendagátt.
8. Sláðu inn kóðann, t.d. `5B-ELDGOS`.
9. Merktu verkefni sem hafið/lokið.
10. Opnaðu Bekkjayfirlit og sækja nýjustu gögn.
