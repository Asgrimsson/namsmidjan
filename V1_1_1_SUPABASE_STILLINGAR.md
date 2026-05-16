# Námsmiðjan v1.1.1 — vistaðar Supabase stillingar

Þessi útgáfa getur sótt Supabase stillingar sjálfkrafa úr Netlify Environment Variables.

## Settu þessar breytur í Netlify

Farðu í Netlify → Project configuration → Environment variables og bættu við:

```text
SUPABASE_URL
```

Value:

```text
https://mmppnifbxlbuurcdmrpz.supabase.co
```

Bættu svo við:

```text
SUPABASE_ANON_KEY
```

Value = Supabase publishable key sem byrjar á `sb_publishable_...`

Bættu svo við:

```text
SUPABASE_WORKSPACE
```

Value:

```text
vallaskoli
```

## Mikilvægt

Ekki setja `sb_secret_...` eða service_role lykil hér.

Notaðu bara publishable key:

```text
sb_publishable_...
```

## Eftir að breyturnar eru komnar inn

Farðu í Netlify:

```text
Deploys → Trigger deploy → Deploy site
```

## Prófa

Opnaðu:

```text
https://namsmidjan.netlify.app/.netlify/functions/public-config
```

Þar ætti að birtast JSON með Supabase URL, publishable key og workspace.

## Í Námsmiðjunni

Námsmiðjan reynir sjálfkrafa að sækja stillingarnar ef þær eru ekki til í vafranum.

Þú getur líka farið í:

```text
Gagnagrunnur → Sækja vistaðar Netlify stillingar
```
