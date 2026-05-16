// Námsmiðjan v0.9 — örugg AI-tenging með Netlify Function
// API lykillinn á að vera í Netlify Environment Variables sem OPENAI_API_KEY.
// Ekki setja lykilinn í index.html.

const PACKAGE_SCHEMA = {
  name: "namsmidjan_package",
  schema: {
    type: "object",
    additionalProperties: false,
    required: ["title", "code", "subject", "grades", "time", "description", "goal", "questions"],
    properties: {
      title: { type: "string" },
      code: { type: "string" },
      subject: { type: "string" },
      grades: {
        type: "array",
        items: { type: "string" }
      },
      time: { type: "string" },
      description: { type: "string" },
      goal: { type: "string" },
      questions: {
        type: "array",
        minItems: 3,
        maxItems: 20,
        items: {
          type: "object",
          additionalProperties: false,
          required: ["type", "level", "text", "options", "answer", "hint"],
          properties: {
            type: { type: "string", enum: ["multiple", "text", "instruction"] },
            level: { type: "string", enum: ["Létt", "Miðlungs", "Krefjandi"] },
            text: { type: "string" },
            options: {
              type: "array",
              items: { type: "string" }
            },
            answer: { type: "string" },
            hint: { type: "string" }
          }
        }
      }
    }
  },
  strict: true
};

function json(statusCode, body) {
  return {
    statusCode,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Content-Type",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    body: JSON.stringify(body)
  };
}

function cleanString(value, fallback = "") {
  return String(value || fallback).slice(0, 1200).trim();
}

exports.handler = async (event) => {
  if (event.httpMethod === "OPTIONS") {
    return json(200, { ok: true });
  }

  if (event.httpMethod !== "POST") {
    return json(405, { error: "Only POST is allowed" });
  }

  const apiKey = process.env.OPENAI_API_KEY;
  if (!apiKey) {
    return json(500, {
      error: "OPENAI_API_KEY vantar í Netlify Environment Variables."
    });
  }

  let input;
  try {
    input = JSON.parse(event.body || "{}");
  } catch {
    return json(400, { error: "Ógilt JSON í beiðni." });
  }

  const topic = cleanString(input.topic, "verkefni fyrir nemendur");
  const subject = cleanString(input.subject, "Þverfaglegt");
  const gradesRaw = cleanString(input.grades, "5");
  const code = cleanString(input.code, "").toUpperCase();
  const count = Math.max(3, Math.min(Number(input.count || 8), 15));
  const difficulty = cleanString(input.difficulty, "Miðlungs");
  const notes = cleanString(input.notes, "");

  const prompt = `
Þú ert íslenskur grunnskólakennari og námsvefjahönnuður.
Búðu til verkefnapakka fyrir Námsmiðjuna.

Viðfangsefni: ${topic}
Fag: ${subject}
Bekkur/bekkir: ${gradesRaw}
Verkefnakóði: ${code || "búðu til viðeigandi kóða"}
Fjöldi spurninga: ${count}
Erfiðleikastig: ${difficulty}
Séróskir: ${notes || "Engar"}

Kröfur:
- Skilaðu verkefnapakka á íslensku, nema fagið sé enska.
- Henta íslenskum grunnskóla.
- Hafa blöndu af fjölvali, textasvörum og leiðbeiningum/umræðu.
- Fjölvalsspurningar þurfa 4 valkosti.
- Textaspurningar eiga að hafa fyrirmyndarsvar eða matsviðmið í answer.
- Allar spurningar þurfa vísbendingu.
- Ekki setja persónugreinanleg gögn.
`;

  try {
    const response = await fetch("https://api.openai.com/v1/responses", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${apiKey}`,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        model: process.env.OPENAI_MODEL || "gpt-4.1-mini",
        input: [
          {
            role: "system",
            content: "Þú skilar aðeins JSON samkvæmt schema. Enginn markdown texti."
          },
          {
            role: "user",
            content: prompt
          }
        ],
        text: {
          format: {
            type: "json_schema",
            name: PACKAGE_SCHEMA.name,
            schema: PACKAGE_SCHEMA.schema,
            strict: true
          }
        }
      })
    });

    const data = await response.json();

    if (!response.ok) {
      return json(response.status, {
        error: data.error?.message || "OpenAI API villa.",
        details: data.error || data
      });
    }

    const outputText =
      data.output_text ||
      data.output?.flatMap((item) => item.content || [])
        ?.find((content) => content.type === "output_text")?.text;

    if (!outputText) {
      return json(502, { error: "AI svaraði ekki með texta.", raw: data });
    }

    let pkg;
    try {
      pkg = JSON.parse(outputText);
    } catch (err) {
      return json(502, { error: "AI skilaði ekki gildu JSON.", raw: outputText });
    }

    pkg.code = (pkg.code || code || "AI-VERKEFNI").toUpperCase();
    pkg.grades = pkg.grades || gradesRaw.split(",").map((x) => x.trim()).filter(Boolean);
    pkg.subject = pkg.subject || subject;
    pkg.createdAt = new Date().toISOString();

    return json(200, { package: pkg });
  } catch (err) {
    return json(500, {
      error: "Villa í Netlify Function.",
      details: err.message
    });
  }
};
