#set document(
  title: "Résumé – William Morales",
  author: "William Morales",
  keywords: ("résumé", "software engineering", "NLP", "machine learning"),
)
#set page(
  paper: "us-letter",
  margin: (top: 1.0cm, bottom: 1.0cm, left: 1.6cm, right: 1.6cm),
)
#set text(size: 10pt, font: "New Computer Modern")
#set par(leading: 0.55em)
#set list(spacing: 0.45em)
#set block(spacing: 0.7em)

// ── Helpers ───────────────────────────────────────────────────────────────────

#let section(title) = {
  v(0.9em)
  text(weight: "bold", size: 10.5pt)[#upper(title)]
  v(-0.5em)
  line(length: 100%, stroke: 0.6pt)
  v(0.3em)
}

#let entry(title, right, sub: none, body: none) = {
  grid(
    columns: (1fr, auto),
    [*#title*#if sub != none [ #h(0.3em) #text(style: "italic", size: 9pt)[#sub]]],
    [#text(size: 9pt)[#right]],
  )
  v(-0.3em)
  if body != none { body }
  v(0.5em)
}

// ── Header ────────────────────────────────────────────────────────────────────

#align(center)[
  #text(size: 18pt, weight: "bold")[William Morales]
  #v(-0.6em)
  #text(size: 9.5pt)[
    wsmbuis5224\@gmail.com #h(0.4em) | #h(0.4em)
    github.com/WilliamMorales1 #h(0.4em) | #h(0.4em)
    williammorales1.github.io #h(0.4em) | #h(0.4em)
    Baton Rouge, LA
  ]
]

// ── Projects ──────────────────────────────────────────────────────────────────

#section("Projects")

#entry(
  "Multilingual Wordle",
  "multilingual-wordle.fly.dev",
  sub: "Go · TypeScript · SQLite · Fly.io",
  body: [
    - Daily Wordle in *70+ languages* built from streamed Wiktionary dumps; word length set per language from a 100k-entry sample
    - Unicode-aware engine: grapheme-cluster splitting, abugidas, tone-splitting scripts, and RTL; keyboard layout auto-detected from each word list (Latin, Cyrillic, Arabic, Devanagari, kana, Ge'ez, Cherokee, syllabics)
    - Web, PWA, and terminal clients on one HTTP API; Dockerized on Fly.io with Prometheus metrics
  ]
)

#entry(
  "Natural Syntax LSP",
  "github.com/WilliamMorales1/Natural-Syntax-LSP",
  sub: "Go · ONNX Runtime · Python · TypeScript",
  body: [
    - LSP server running local ONNX inference to color VS Code prose by part of speech, embedding, or dependency
    - Three swappable model backends from *22M to 110M parameters* (MiniLM, MPNet, BERT/MobileBERT, ELECTRA biaffine UD parser); embeddings projected to 2D and mapped to OKLCH color
  ]
)

#entry(
  "GuideOverride",
  "github.com/CSC4700-BRCC/Version-2",
  sub: "Django · React · Celery · OpenAI/Anthropic/Ollama",
  body: [
    - Course-override recommender built with Baton Rouge Community College over a catalog of *616 courses*; rule-based tier scoring with LLM catalog enrichment cached 90 days
    - LLM fallback across *3 providers* (OpenAI → Anthropic → Ollama); JWT auth, audited review queue; featured in _Business Report_
  ]
)

#entry(
  "Spanish Intensifier Corpus Pipeline",
  "github.com/WilliamMorales1/IntensifierResearch",
  sub: "Python · pandas · R",
  body: [
    - Extracts and classifies intensifier constructions from POS-tagged interviews across *6 dialect corpora*; *7,835 tokens* analyzed with Bayesian models. Published in _Proc. LSA_ 11(1)
  ]
)

// ── Research ──────────────────────────────────────────────────────────────────

#section("Research")

#entry(
  "Honors Thesis — Phonological Features in Distilled Speech Models",
  "Fall 2026 – present",
  body: [
    - Probing pipeline over *7 distilled students* of HuBERT, wav2vec2, and WavLM on 2 corpora (TIMIT, VoxAngeles): students *4× smaller* (23.5M vs 94.4M params) keep 94–109% of teacher accuracy at best layer
    - Config-driven extraction, phone-level pooling, and swappable feature backends; fixed a cross-validation leak where non-phone-disjoint folds inflated probe scores
  ]
)

#entry(
  "Speech Perception Study",
  "Spring 2024 – present",
  body: [
    - Built Qualtrics experiment and Praat batch-analysis scripts for a *108-listener* study of dialect perception; manuscript under review at _JSLHR_
  ]
)

// ── Education ─────────────────────────────────────────────────────────────────

#section("Education")

#entry(
  "Louisiana State University — B.Sc. Computer Science (Data Science)",
  "2023 – present",
  body: [
    GPA 4.10/4.0 · Ogden Honors College · Minors: Linguistics, Spanish · Coursework: AI, Databases
  ]
)

// ── Selected Talks ────────────────────────────────────────────────────────────

#section("Selected Talks")

- *LSA Annual Meeting* — Intensifiers in three Spanish-speaking communities. New Orleans, Jan 2026.
- *ALFAL XXI* — Intensificación en el español colombiano. Lima, Peru, Aug 2026.
- *Acoustical Society of America / ICA* — Dialect and fricative perception. New Orleans, May 2025.

// ── Skills ────────────────────────────────────────────────────────────────────

#section("Skills")

*Languages:* Python, Go, TypeScript/JavaScript, SQL, R, Java \
*Tools:* PyTorch, Hugging Face Transformers, ONNX Runtime, spaCy, pandas, Django, React, PostgreSQL, SQLite, Docker, Git · *Spoken:* English, Spanish, French, Japanese, Chinese
