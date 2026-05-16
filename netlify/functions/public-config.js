// Námsmiðjan v1.1.1 — public config fyrir Supabase
// Þetta skilar eingöngu public/publishable stillingum.
// Settu þessar breytur í Netlify Environment Variables:
// SUPABASE_URL
// SUPABASE_ANON_KEY
// SUPABASE_WORKSPACE

exports.handler = async () => {
  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*"
    },
    body: JSON.stringify({
      supabaseUrl: process.env.SUPABASE_URL || "",
      supabaseAnonKey: process.env.SUPABASE_ANON_KEY || "",
      supabaseWorkspace: process.env.SUPABASE_WORKSPACE || "vallaskoli"
    })
  };
};
