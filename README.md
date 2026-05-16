# Námsmiðjan v1.1.1

Námsmiðjan er fyrsti grunnur að browser-based náms- og kennsluvefja-vistkerfi.

## Hvað er inni í v0.1?

- Falleg forsíða / móðurvefur
- Flísar fyrir námsvefi
- Leit og síur eftir fagi, bekk og tegund
- Kennarasvæði til að bæta við nýjum vef
- Nemendakóði sem sýnidæmi
- JSON útflutningur og innflutningur
- LocalStorage vistun í vafra
- Enginn bakendi ennþá

## Hvernig keyri ég þetta?

### Einfaldasta leiðin

1. Opnaðu `index.html` beint í Chrome.
2. Prófaðu vefinn.
3. Smelltu á **Kennarasvæði** til að bæta við tengli á nýjan námsvef.

### Setja á GitHub

Settu skrárnar í nýtt GitHub repo.

```bash
git init
git add .
git commit -m "Set inn Namsmidjan v0.1"
git branch -M main
git remote add origin https://github.com/NOTANDI/namsmidjan.git
git push -u origin main
```

### Setja á Netlify

1. Farðu á https://app.netlify.com/
2. Veldu **Add new site**
3. Veldu **Deploy manually**
4. Dragðu möppuna inn eða zip skrána
5. Netlify birtir slóðina þína

## Hvernig bæti ég nýjum námsvef inn?

Í kennarasvæði fyllir þú inn:

- Heiti
- Fag
- Bekki
- Tegund
- Slóð
- Lýsingu
- Merki/tags

Þetta vistast í vafranum. Í næstu útgáfum tengjum við þetta við Supabase gagnagrunn.

## Næstu útgáfur

v0.2 Verkefnabanki  
v0.3 Nemendakóði og verkefni dagsins  
v0.4 Supabase gagnagrunnur  
v0.5 AI verkefnasmiður  


## v0.1.1 — Fyrsti alvöru námsvefurinn tengdur

Í þessari útgáfu er kominn inn fyrsti innbyggði námsvefurinn:

`modules/prosentur/index.html`

Flísin **Prósentureikningur** á forsíðu Námsmiðjunnar opnar nú þennan vef beint.

### Prófun

1. Opnaðu `index.html`.
2. Smelltu á flísina **Prósentureikningur**.
3. Prófaðu:
   - Læra
   - Æfa
   - Áskorun
   - Búð
4. Smelltu á **Til baka í Námsmiðjuna** til að fara aftur á móðurvefinn.

### Mikilvægt

Ef þú hafðir áður opnað v0.1 í sama vafra gæti gamli localStorage listinn enn verið virkur.
Þá skaltu smella á **Endurhlaða grunnlista** á forsíðunni, svo Prósentureikningur opnist rétt.


---

# v0.2 — Verkefnabanki kennara

Í þessari útgáfu bætist við alvöru verkefnabanki.

## Nýtt í v0.2

- Sér kafli á forsíðu: **Verkefnabanki kennara**
- Kennari getur búið til verkefnaspjöld
- Verkefni fá kóða, t.d. `5B`, `5B-PROSENTUR` eða `7A-SKAK`
- Verkefni tengjast ákveðnum bekkjum
- Verkefni geta tengst námsvef, t.d. Prósentureikningi
- Nemendur geta opnað verkefni með kóða
- Verkefni vistast í vafranum með localStorage
- Hægt að flytja verkefni út sem JSON
- Hægt að flytja inn verkefni úr JSON
- Hægt að flytja út öll gögn: námsvefi + verkefni

## Hvernig býrðu til fyrsta verkefnið?

1. Opnaðu `index.html`.
2. Smelltu á **Kennarasvæði**.
3. Veldu flipann **Verkefni**.
4. Fylltu inn:
   - Heiti verkefnis
   - Verkefnakóða, t.d. `5B-PROSENTUR`
   - Fag
   - Tegund
   - Bekk
   - Tíma
   - Tengdan námsvef
   - Fyrirmæli
   - Markmið
5. Smelltu á **Vista verkefni**.

## Hvernig opnar nemandi verkefni?

1. Smelltu á **Nemendakóði**.
2. Sláðu inn t.d. `5B` eða `5B-PROSENTUR`.
3. Verkefni sem passa við kóðann birtast.
4. Nemandi smellir á **Opna vef**.

## Mikilvægt þegar þú límir yfir gamla vefinn

Passaðu að afrita bæði:

- `index.html`
- `modules` möppuna

Ef vefurinn sýnir gamla lista, smelltu á **Endurhlaða grunnlista**.


---

# v0.3 — Nemendagátt

Í þessari útgáfu bætist við einföld nemendagátt og kennarayfirlit yfir framvindu.

## Nýtt í v0.3

- Nemandi slær inn nafn/hóp og verkefnakóða.
- Nemandi sér verkefni sem passa við kóðann.
- Nemandi getur merkt verkefni sem:
  - Hafið
  - Lokið
- Nemandi getur skrifað stutta athugasemd við verkefni.
- Kerfið gefur einfalt XP:
  - 5 XP fyrir hafið verkefni
  - 25 XP fyrir lokið verkefni
- Kennari sér yfirlit í kaflanum **Framvinda nemenda**.
- Hægt er að flytja framvindu út sem JSON.
- Öll gögn vistast enn í localStorage í þessum vafra.

## Prófa nemendagáttina

1. Opnaðu `index.html`.
2. Smelltu á **Nemendagátt**.
3. Settu inn nafn, t.d. `Hópur 1`.
4. Settu inn kóða, t.d. `5B-PROSENTUR`.
5. Smelltu á **Opna verkefni**.
6. Smelltu á **Hefja**.
7. Skrifaðu athugasemd.
8. Smelltu á **Merkja lokið**.
9. Lokaðu glugganum og skoðaðu kaflann **Framvinda nemenda** á forsíðunni.

## Mikilvægt

Þetta er enn staðbundið í vafranum. Ef nemendur vinna á öðrum tölvum sér kennarinn ekki sjálfkrafa gögnin.
Í v0.4 er rökrétt að tengja Supabase gagnagrunn svo framvinda vistist miðlægt.


---

# v0.4 — Supabase gagnagrunnur

Í þessari útgáfu bætist við Supabase tenging.

## Nýtt í v0.4

- Supabase stillingasvæði í Kennarasvæði
- Project URL + anon key + workspace ID
- Prófa tengingu
- Senda local gögn í Supabase
- Sækja gögn úr Supabase
- Sjálfvirk samstilling eftir vistun, ef þú kveikir á því
- SQL schema fylgir með: `supabase_schema.sql`
- Sér leiðbeiningaskrá: `SUPABASE_SETUP.md`

## Mikilvægt

Vefurinn virkar áfram án Supabase.
Ef Supabase er ekki stillt notar hann localStorage eins og áður.

## Fljótleg prófun

1. Opnaðu `index.html`.
2. Smelltu á **Gagnagrunnur**.
3. Settu inn Supabase URL og anon key.
4. Smelltu á **Prófa tengingu**.
5. Smelltu á **Senda local gögn í Supabase**.

## Áður en þú prófar tengingu

Þú þarft að keyra SQL-skrána:

`supabase_schema.sql`

í Supabase SQL Editor.


---

# v0.5 — Innskráning og öruggari réttindi

Í v0.5 bætist við kennarainnskráning með Supabase Auth.

## Nýtt í v0.5

- Kennarainnskráning í Námsmiðjunni
- Búa til kennaraaðgang með email/password
- Skrá inn / skrá út
- Kennari þarf að vera innskráður til að senda námsvefi og verkefni í Supabase
- Nemendur geta áfram notað Nemendagátt með verkefnakóða
- Ný SQL öryggisskrá: `supabase_v0_5_security.sql`

## Uppfærsla úr v0.4

1. Afritaðu nýju v0.5 skrárnar yfir gömlu vefmöppuna.
2. Farðu í Supabase → SQL Editor.
3. Keyrðu `supabase_v0_5_security.sql`.
4. Opnaðu Námsmiðjuna.
5. Farðu í Gagnagrunnur og staðfestu Supabase stillingar.
6. Farðu í Innskráning.
7. Búðu til kennaraaðgang eða skráðu þig inn.
8. Prófaðu að senda gögn í Supabase.

## Réttindamódel v0.5

- Gestir/nemendur mega lesa námsvefi og verkefni.
- Innskráðir kennarar mega skrifa námsvefi og verkefni.
- Nemendur/gestir mega skila framvindu með kóða.
- Kennari má lesa framvindu.


---

# v0.6 — Bekkjayfirlit og skilakerfi

Í v0.6 verður kennaramælaborðið mun nytsamlegra í kennslustund.

## Nýtt í v0.6

- Nýr kafli: **Bekkjayfirlit og skilakerfi**
- Sía eftir:
  - bekk
  - verkefnakóða
  - stöðu
  - nemanda / athugasemd
- Virkir verkefnakóðar birtast sem smellanleg spjöld
- Stöður nemenda:
  - Ekki hafið
  - Hafið
  - Þarf hjálp
  - Vill meiri áskorun
  - Lokið
- Betri framvindutafla með XP og síðustu uppfærslu
- Hnappur til að sækja nýjustu gögn úr Supabase
- Útflutningur á framvindu sem JSON

## Prófun

1. Skráðu þig inn sem kennari.
2. Opnaðu Nemendagátt.
3. Settu inn nafn/hóp og kóða, t.d. `5B-PROSENTUR`.
4. Merktu verkefni sem:
   - Hefja
   - Þarf hjálp
   - Vil meiri áskorun
   - Merkja lokið
5. Smelltu á **Senda local gögn í Supabase**.
6. Farðu í **Bekkjayfirlit**.
7. Prófaðu síur og virka kóða.


---

# v0.7 — Verkefnasmiður kennara

Í v0.7 bætist við verkefnasmiður.

## Nýtt í v0.7

- Verkefnasmiður kennara
- Verkefnapakkar með:
  - fjölvali
  - textasvörum
  - leiðbeiningum / umræðuspurningum
  - lausnum
  - vísbendingum
- Prentvæn útgáfa með lausnablaði
- Hægt að búa til verkefnaspjald úr pakka
- Útflutningur verkefnapakka sem JSON
- Supabase tafla fyrir verkefnapakka: `namsmidjan_packages`

## Uppfærsla í Supabase

Keyrðu þessa SQL-skrá í Supabase SQL Editor:

`supabase_v0_7_packages.sql`

Þetta býr til töflu fyrir verkefnapakka og setur RLS reglur.

## Prófun

1. Opnaðu Námsmiðjuna v0.7.
2. Skráðu þig inn sem kennari.
3. Farðu í **Verkefnasmiður**.
4. Búðu til verkefnapakka.
5. Bættu við fjölvalsspurningu og textasvari.
6. Vistaðu pakkann.
7. Prófaðu **Prenta verkefni**.
8. Smelltu á **Senda local gögn í Supabase**.
9. Skoðaðu `namsmidjan_packages` í Supabase.


---

# v0.8 — AI verkefnasmiður

Í v0.8 bætist við AI verkefnasmiður.

## Nýtt í v0.8

- Kennari skrifar hugmynd að verkefni.
- Kerfið býr til verkefnapakka með:
  - fjölvali
  - textasvörum
  - umræðuspurningum
  - lausnum
  - vísbendingum
- Hægt er að nota tilbúin sniðmát:
  - Eldgos
  - Prósentur
  - Skák
  - Netöryggi
  - Enska
- Hægt að búa til ChatGPT prompt.
- Hægt að líma JSON frá ChatGPT aftur inn.
- Hægt að vista AI-pakka sem verkefnapakka.
- Hægt að prenta verkefnið.

## Öryggi

v0.8 setur engan OpenAI/API lykil í browser-kóða.
Þetta er viljandi. Leynilyklar eiga ekki að vera í `index.html`.

## Prófun

1. Opnaðu Námsmiðjuna.
2. Smelltu á **AI verkefnasmiður**.
3. Veldu sniðmát, t.d. 🌋 Eldgos.
4. Smelltu á **Búa til verkefnapakka**.
5. Smelltu á **Vista sem verkefnapakka**.
6. Farðu í **Verkefnasmiður** og skoðaðu pakkann.
7. Smelltu á **Prenta verkefni**.
8. Skráðu þig inn og smelltu á **Senda local gögn í Supabase**.

## Næst

v0.9 ætti að bæta við öruggri AI-tengingu í gegnum Netlify Function eða annan server-side endpoint.


---

# v0.9 — Örugg AI-tenging með Netlify Function

Í v0.9 bætist við alvöru AI-tenging án þess að API lykill fari í browser-kóða.

## Nýtt í v0.9

- Netlify Function: `netlify/functions/generate-package.js`
- Vefurinn kallar á `/.netlify/functions/generate-package`
- `OPENAI_API_KEY` er geymdur í Netlify Environment Variables
- AI skilar verkefnapakka sem JSON
- Ef AI function virkar ekki fellur vefurinn aftur á innbyggða sniðmátið
- Engin ný Supabase SQL þörf ef v0.7 packages taflan er komin

## Skrár sem bættust við

- `netlify/functions/generate-package.js`
- `netlify.toml`
- `package.json`
- `.env.example`
- `V0_9_NETLIFY_AI_LEIDBEININGAR.md`

## Mikilvægt

Ekki setja `OPENAI_API_KEY` í `index.html`.
Settu lykilinn bara í Netlify undir Environment variables.

---

# v1.0 — Public Beta / skólastofuútgáfa

Námsmiðjan v1.0 er fyrsta útgáfan sem er hugsuð sem skólastofuprófun.

## Gullreglan

- Þegar þú býrð til/breytir verkefni: **Senda local gögn í Supabase**
- Þegar þú opnar vefinn í nýjum vafra/tölvu: **Sækja gögn úr Supabase**
- Þegar nemendur hafa unnið: **Sækja nýjustu gögn** í Bekkjayfirliti

## Fyrsta skólastofuprófun

1. Skráðu þig inn sem kennari.
2. Sæktu gögn úr Supabase.
3. Búðu til verkefni með AI.
4. Vistaðu sem verkefnapakka.
5. Sendu local gögn í Supabase.
6. Gefðu nemendum verkefnakóða.
7. Nemendur opna Nemendagátt.
8. Kennari skoðar Bekkjayfirlit.


---
# v1.1 — Vefjasafn Vallaskóla

22 námsvefir eru komnir sem flísar með lýsingum, fögum, bekkjum og verkefnakóðum.



---

# v1.1.1 — Vistaðar Supabase stillingar

Námsmiðjan getur nú sótt Supabase stillingar sjálfkrafa úr Netlify Function:

`/.netlify/functions/public-config`

Settu í Netlify Environment Variables:

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`
- `SUPABASE_WORKSPACE`

Síðan redeployarðu.
