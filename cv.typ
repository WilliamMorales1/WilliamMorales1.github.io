#set document(
  title: "CV – William Morales",
  author: "William Morales",
  keywords: ("CV", "linguistics", "data science", "NLP"),
)
#set page(
  paper: "us-letter",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 2cm),
)
#set text(size: 10.5pt, font: "New Computer Modern")
#set par(leading: 0.65em)

// ── Helpers ───────────────────────────────────────────────────────────────────

#let section(title) = {
  v(0.9em)
  text(weight: "bold", size: 11pt)[#upper(title)]
  v(0.15em)
  line(length: 100%, stroke: 0.6pt)
  v(0.35em)
}

#let cventry(title, date, sub: none, body: none) = {
  grid(
    columns: (1fr, auto),
    [*#title*],
    [#text(size: 9.5pt)[#date]],
  )
  if sub != none { text(style: "italic", size: 9.5pt)[#sub \ ] }
  if body != none { body }
  v(0.4em)
}

// Flat key: value line (skills section only)
#let field(label, value) = {
  text(weight: "bold")[#label:] + [ ] + value + linebreak()
}

// ── Header ────────────────────────────────────────────────────────────────────

#text(size: 20pt, weight: "bold")[William Morales]
#v(0.1em)
#text(size: 11pt, style: "italic")[Linguistics & NLP]
#v(0.1em)
#text(size: 10pt)[
  wsmbuis5224\@gmail.com #h(0.5em) | #h(0.5em)
  wmoral2\@lsu.edu #h(0.5em) | #h(0.5em)
  github.com/WilliamMorales1 #h(0.5em) | #h(0.5em)
  williammorales1.github.io
]
#v(0.1em)
#line(length: 100%, stroke: 0.6pt)

// ── Research Interests ────────────────────────────────────────────────────────

#v(0.5em)
#text(size: 10.5pt)[
  Variationist sociolinguistics and quantitative corpus methods, with a focus on Spanish dialects and morphosyntactic change. Phonetics and speech perception, particularly dialectal effects on listener judgments. Language documentation and revitalization for endangered languages, especially Louisiana Creole (Kouri-Vini). Computational approaches to linguistic analysis, including low-resource speech synthesis and NLP tooling for under-resourced languages.
]
#v(0.3em)

// ── Education ─────────────────────────────────────────────────────────────────

#section("Education")

#cventry(
  "Louisiana State University — B.Sc. Computer Science, Concentration in Data Science",
  "Fall 2023 – present",
  sub: "Minors: Linguistics; Spanish · College Honors (Ogden Honors College) · GPA: 4.10/4.0 · Baton Rouge, LA",
  body: [
    - *Notable coursework:* CSC 4700 Special Topics in AI; CSC 4402 Database Systems; CSC 4330 Software Systems Development; LING 3150 Phonetics; LING 4750 Independent Research in Speech Science; SPAN 4005 Structure of the Spanish Language; SPAN 4917 Independent Research in Spanish Linguistics
  ]
)

// ── Research Experience ───────────────────────────────────────────────────────

#section("Research Experience")

#cventry(
  "A Variationist Study of Spanish Intensifiers",
  "Fall 2023 – Spring 2026",
  sub: "Mentor: Dr. Rafael Orozco · Louisiana State University",
  body: [
    - Variationist analysis of 7,835 tokens across Medellín, Tunja (Colombia), and Louisiana Puerto Rican communities; examined periphrastic vs.\ morphological intensification conditioned by gender, age, education, and adjective type
    - Developed a custom Python algorithm (TagAnt + manual verification) to extract and classify intensifier tokens from dialect transcripts
    - Published in _Proceedings of the Linguistic Society of America_ 11(1). #link("https://doi.org/10.3765/plsa.v11i1.6091")[doi:10.3765/plsa.v11i1.6091]
  ]
)

#cventry(
  "Dialectal Variation and Perception of English Interdental Fricatives and Lateral Liquids",
  "Spring 2024 – present",
  sub: "Mentors: Dr. Hunju Chung; Dr. Irina Shport · Louisiana State University",
  body: [
    - Investigated whether sociophonetic stereotypes influence listener identification of ethnolect (AAE vs.\ SWE) and perception of /θ, ð/ via forced-choice and Visual Analog Scale tasks with 108 listeners
    - Categorized stimuli (stopping and labialization variants), built Qualtrics survey, and contributed to Praat acoustic analysis
    - Manuscript submitted to _Journal of Speech, Language, and Hearing Research_; currently under review
  ]
)

// ── Conference Presentations ──────────────────────────────────────────────────

#section("Conference Presentations")

#v(0.15em)
*2026*
#v(0.05em)
- *LSA Annual Meeting* — Tracking a Linguistic Innovation: A Sociolinguistic Investigation of Intensifiers in Three Spanish-speaking Communities. New Orleans, LA. January 2026.
- *Southeastern Conference on Linguistics (SECOL)* — A Variationist Study of Spanish Intensifiers. Atlanta, GA. March 2026.
- *13th Annual LSU Discover Day* — Tracking a Linguistic Innovation: A Sociolinguistic Investigation of Intensifiers in Three Spanish-speaking Communities. Baton Rouge, LA. April 2026.

#v(0.3em)
*2025*
#v(0.05em)
- *188th Meeting of the Acoustical Society of America (ASA) / 25th International Congress on Acoustics* — Effect of Dialectal Variation on Listeners' Perception of English Interdental Fricatives and Lateral Liquid Sounds. New Orleans, LA. May 2025.
- *12th Annual LSU Discover Day* — A Sociolinguistic Study of Intensification in the Spanish of Louisianian Puerto Ricans. Baton Rouge, LA. April 2025.
- *Fifth Annual Emory Undergraduate Linguistics Conference (EULC5)* — A Variationist Analysis of Intensification in Spanish. Virtual. April 2025.
- *Seventh Annual Tulane Conference on Linguistics (T-CoL)* — A Sociolinguistic Study of Spanish Intensifiers across Two Dialects. New Orleans, LA. March 2025.
- *Department of Communication Sciences and Disorders Roundtable, LSU* — Effect of Dialectal Variation on Listeners' Perception of English Interdental Fricatives and Lateral Liquid Sounds. Baton Rouge, LA. 2025.

#v(0.3em)
*2024*
#v(0.05em)
- *Summer Undergraduate Research Forum, LSU* — A Sociolinguistic Study of Intensification in the Spanish of Louisianian Puerto Ricans. Baton Rouge, LA. August 2024.

// ── Selected Projects ─────────────────────────────────────────────────────────

#section("Selected Projects")

#v(0.15em)
*Linguistics & NLP*
#v(0.1em)

#cventry(
  "Variationist Intensifier Corpus Pipeline",
  "github.com/WilliamMorales1/IntensifierResearch",
  sub: "Python · pandas · R",
  body: [
    - Processes POS-tagged sociolinguistic interview transcripts across 6 Spanish dialect corpora (Cali, Cartagena, Medellín, Tunja, Louisiana Puerto Rican, and historical) to extract intensifier tokens with adjective/adverb hosts
    - Classifies predication type (predicative vs.\ attributive), resolves apocope, handles -ísimo superlatives and archi- prefixation, detects double-intensifier constructions, and identifies proximate verb
    - Merges token-level output with speaker metadata (age, sex, dialect) for quantitative analysis; R and Python analysis layer produces rate-by-age plots, Zipf distributions, log-adjusted frequency graphs, and Bayesian models
    - Used in multiple conference presentations across national and regional venues; manuscript in preparation
  ]
)

#cventry(
  "An Online Dictionary of Louisiana Creole",
  "github.com/WilliamMorales1/louisiana-creole-online-dictionary",
  sub: "Django · Valdman Dictionary of Louisiana Creole",
  body: [
    - Web-based dictionary for a critically endangered language; built with LSU Creole Club members to support documentation and revitalization
  ]
)

#cventry(
  "Spanish Future Tense Research",
  "github.com/WilliamMorales1/SpanishFutureResearch",
  sub: "Python · pandas",
  body: [
    - Analyzes future-tense expressions in Spanish corpora; includes data cleaning, grammatical tagging, and dataframe construction for quantitative sociolinguistic analysis
  ]
)

#cventry(
  "Praat Data Analysis Scripts",
  "github.com/WilliamMorales1/PraatDataAnalysis",
  sub: "Praat scripting language",
  body: [
    - Batch WAV processing and automated acoustic measurements for a study on dialectal variation and perception of English sounds
  ]
)

#v(0.4em)
*Software & App Development*
#v(0.1em)

#cventry(
  "Multilingual Wordle",
  "multilingual-wordle.fly.dev · github.com/WilliamMorales1/Multilingual-Wordle",
  sub: "Go · TypeScript",
  body: [
    - Wiktionary-based Wordle supporting 70+ languages, including scripts with grapheme clusters, abugidas, and RTL text; word lists cached locally after first download
  ]
)

#cventry(
  "Vivan — Language Learning Platform",
  "github.com/claytakiler/Heritage-Project",
  sub: "Django · React · Tailwind · ShadCN",
  body: [
    - Language-learning platform for predefined and user-created courses; originally built for Louisiana Creole (Kouri-Vini); supports course creation, collaboration, and 2FA; built as a CSC 4330 team project
  ]
)

#cventry(
  "Natural Syntax LSP",
  "github.com/WilliamMorales1/NLSyntaxHighlighting-Go",
  sub: "Go · ONNX Runtime · TypeScript (VS Code Extension)",
  body: [
    - Parts-of-speech semantic highlighting for VS Code via a local Go LSP server running BERT inference with ONNX Runtime; hover over any word to see its POS tag and confidence score
  ]
)

#cventry(
  "GuideOverride",
  "github.com/CSC4700-BRCC/Version-2",
  sub: "Django · SQLite · React · OpenAI · Tailwind",
  body: [
    - Collaboration with Baton Rouge Community College to streamline student course-override requests using an LLM recommendation workflow
  ]
)

// ── Leadership and Organizations ──────────────────────────────────────────────

#section("Leadership and Organizations")

#cventry("President — Student Linguistics Association (SLA), LSU", "2025 – present")
#cventry(
  "Vice-President — Creole Club (Organizasyon Langaj é Lakilchi Kréyol Lalwizyàn), LSU",
  "2025 – present",
  body: [#text(size: 9pt)[Featured in #link("https://lsureveille.com/265157/entertainment/lsu-creole-club/")[LSU Reveille]]]
)
#cventry("Vice-President — Student Linguistics Association (SLA), LSU", "2024 – 2025")
#cventry("Historian — French Club (Le Cercle Français), LSU", "2024 – 2025")
#cventry("Event Coordinator — Arabic Language Club, LSU", "2024 – 2025")

// ── Other Activities ──────────────────────────────────────────────────────────

#section("Other Activities")

#v(0.1em)
#cventry("Hackathon (WICS & SASE)", "Fall 2025", body: [#text(size: 9pt)[github.com/g34rmeister/2r-in-strawberry]])
#cventry("Hackathon (SASE)", "Spring 2024")
#cventry(
  "Jill Brody's Linguistic Meetup Day — Student Linguistics Association, LSU",
  "Fall 2023",
  body: [
    - Student-organized event to introduce undergraduates to linguistics research and encourage participation in the field
  ]
)

// ── Awards and Funding ────────────────────────────────────────────────────────

#section("Awards and Funding")

#v(0.1em)
#cventry("Gulf Scholars Program, LSU", "Summer 2024")
#cventry("President's Honor Roll", "Fall 2024, Spring 2024, Fall 2025, Spring 2026")
#cventry("Honors TOPS Scholarship", "Fall 2023 – present")
#cventry("President's Student Aid", "Fall 2023 – present")

// ── Skills and Languages ──────────────────────────────────────────────────────

#section("Skills and Languages")

#field("Programming Languages", "Python; SQL; Go; Java; R; TypeScript/JavaScript")
#field("Libraries & Frameworks", "pandas; numpy; Django; React; SpaCy; SQLite; PostgreSQL; Ollama")
#field("Domain Tools", "Corpus linguistics methods; Praat scripting; acoustic analysis; IPA")
#field("Natural Languages", "English (Native); Spanish (Proficient); French (Intermediate); Japanese (Intermediate); Chinese (Intermediate)")
