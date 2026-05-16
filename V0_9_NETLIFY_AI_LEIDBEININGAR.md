# Námsmiðjan v0.9 — Netlify AI uppsetning

## Markmið

V0.9 tengir AI verkefnasmiðinn við OpenAI í gegnum Netlify Function.

Rétta flæðið er:

Námsmiðjan → Netlify Function → OpenAI API → Netlify Function → Námsmiðjan

API lykillinn fer aldrei í `index.html`.

---

## 1. Afþjappa og setja upp

Afþjappaðu ZIP-pakkanum og opnaðu möppuna sem inniheldur:

- `index.html`
- `netlify.toml`
- `package.json`
- `netlify/functions/generate-package.js`

Þetta þarf allt að fara saman á Netlify.

---

## 2. Setja á GitHub

Í möppunni skaltu keyra:

```bash
git init
git add .
git commit -m "Set inn Namsmidjan v0.9"
git branch -M main
git remote add origin https://github.com/NOTANDI/namsmidjan.git
git push -u origin main
```

Ef repo er þegar til:

```bash
git add .
git commit -m "Uppfaeri Namsmidjuna i v0.9"
git push
```

---

## 3. Tengja við Netlify

1. Farðu á Netlify.
2. Veldu **Add new site**.
3. Veldu **Import an existing project**.
4. Veldu GitHub repo.
5. Build command má vera tómt eða:
   `npm run build`
6. Publish directory:
   `.`
7. Deploy.

---

## 4. Setja OPENAI_API_KEY í Netlify

Í Netlify site:

1. Farðu í **Site configuration**
2. Farðu í **Environment variables**
3. Smelltu á **Add variable**
4. Settu:
   - Key: `OPENAI_API_KEY`
   - Value: OpenAI API lykillinn þinn
5. Bættu líka við valfrjálst:
   - Key: `OPENAI_MODEL`
   - Value: `gpt-4.1-mini`

Vistaðu og redeployaðu síðuna.

---

## 5. Prófa AI

1. Opnaðu Netlify slóðina.
2. Farðu í **AI verkefnasmiður**.
3. Settu inn t.d.:
   `Búðu til verkefni um eldgos fyrir 5. bekk`
4. Smelltu á **Búa til með alvöru AI**.
5. Ef allt er rétt færðu JSON verkefnapakka.
6. Smelltu á **Vista sem verkefnapakka**.
7. Sendu gögn í Supabase ef þú vilt vista pakkann miðlægt.

---

## 6. Ef það virkar ekki

### Villa: OPENAI_API_KEY vantar

Þá er API lykillinn ekki kominn í Netlify Environment variables, eða þú þarft að redeploya.

### Villa: AI function svaraði ekki

Prófaðu að opna:

`https://þín-slóð.netlify.app/.netlify/functions/generate-package`

Það á að svara að aðeins POST sé leyft.

### Local prófun

Settu `.env` skrá í möppuna:

```env
OPENAI_API_KEY=sk-...
OPENAI_MODEL=gpt-4.1-mini
```

Keyrðu síðan:

```bash
npm install
npx netlify dev
```

Opnaðu slóðina sem Netlify Dev sýnir.

---

## Öryggi

Aldrei setja OpenAI lykil í:
- `index.html`
- JavaScript sem fer í browser
- GitHub repo
- Supabase töflu

Lykillinn á bara að vera í Netlify Environment Variables.
