# Námsmiðjan v0.8 — AI verkefnasmiður

## Hvernig virkar v0.8?

V0.8 notar örugga browser-leið:
- enginn API lykill er settur í kóðann
- kerfið býr til verkefnapakka með innbyggðum AI-sniðmáta
- kerfið getur búið til prompt fyrir ChatGPT
- þú getur límt JSON frá ChatGPT aftur inn

## Af hverju ekki beinn OpenAI lykill í HTML?

Leynilyklar eiga ekki að vera í frontend/browser kóða.
Ef API lykill er settur í HTML getur hver sem opnar vefinn séð lykilinn.

## Næsta tækniskref

V0.9 ætti að nota:
- Netlify Function
- Render backend
- eða Supabase Edge Function

Þá geymum við API lykil server-side og vefurinn sendir bara beiðni á öruggan endpoint.
