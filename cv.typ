#set document(
  title: "CV – William Morales",
  author: "William Morales",
  keywords: ("CV", "linguistics", "data science", "NLP"),
)
#set page(
  paper: "us-letter",
  margin: (top: 1.5cm, bottom: 1.5cm, left: 2cm, right: 2cm),
)

#let section(title) = {
  v(1em)
  text(weight: "bold", size: 12pt)[#upper(title)]
  v(0.1em)
  line(length: 100%, stroke: 0.75pt)
  v(0.4em)
}

#let field(label, value) = {
  text(weight: "bold")[#label:] + [ ] + value + linebreak()
}

#text(size: 18pt, weight: "bold")[William Morales]
#linebreak()
Linguistics and Data Science
#v(0.5em)

#field("Email", "wsmbuis5224@gmail.com | wmoral2@lsu.edu")
#field("GitHub", "https://github.com/WilliamMorales1")
#field("Website", "https://williammorales1.github.io")

#section("Education")

#field("Institution", "Louisiana State University")
#field("Location", "Baton Rouge, LA")
#field("Dates", "Fall 2023 – present")
#field("Degree", "B.Sc. in Computer Science, Concentration in Data Science")
#field("Minors", "Linguistics; Spanish")
#field("Honors", "College Honors (Ogden Honors College)")
#field("Coursework", "CSC 4700 Special Topics in AI; CSC 4402 Database Systems; LING 3150 Phonetics; SPAN 4917 Independent Research in Spanish Linguistics")

#section("Research Experience")

#field("Project", "A Variationist Study of Spanish Intensifiers")
#field("Mentor", "Dr. Rafael Orozco")
#field("Dates", "Fall 2023 – present")
#field("Description", "Researching intensifiers in Spanish across multiple dialects and comparing findings to other sociolinguistic phenomena. Developed a custom Python algorithm to collect and analyze intensifier data from dialect transcripts. Manuscript in preparation for publication.")

#v(0.6em)

#field("Project", "Effect of Dialectal Variation on Listeners' Perception of English Interdental Fricatives and Lateral Liquid Sounds")
#field("Mentors", "Dr. Hunju Chung; Dr. Irina Shport")
#field("Dates", "Spring 2024 – present")
#field("Description", "Tested perception of sounds across English dialects. Categorized stimuli, built Qualtrics survey, maintained Praat scripts, and contributed to acoustic analysis. Manuscript in preparation.")

#section("Conference Presentations")

#field("Conference", "Southeastern Conference on Linguistics (SECOL)")
#field("Year", "2026")
#field("Title", "A Variationist Study of Spanish Intensifiers")

#v(0.5em)
#field("Conference", "Linguistic Society of America (LSA) Annual Meeting")
#field("Year", "2026")
#field("Title", "Tracking a Linguistic Innovation: A Sociolinguistic Investigation of Intensifiers in Three Spanish-speaking Communities")

#v(0.5em)
#field("Conference", "13th Annual LSU Discover Day Undergraduate Research and Creativity Conference")
#field("Year", "2026")
#field("Title", "Tracking a Linguistic Innovation: A Sociolinguistic Investigation of Intensifiers in Three Spanish-speaking Communities")

#v(0.5em)
#field("Conference", "188th Meeting of the Acoustical Society of America (ASA)")
#field("Year", "2025")
#field("Title", "Effect of Dialectal Variation on Listeners' Perception of English Interdental Fricatives and Lateral Liquid Sounds")

#v(0.5em)
#field("Conference", "12th Annual LSU Discover Day Undergraduate Research and Creativity Conference")
#field("Year", "2025")
#field("Title", "A Sociolinguistic Study of Intensification in the Spanish of Louisianian Puerto Ricans")

#v(0.5em)
#field("Conference", "Fifth Annual Emory Undergraduate Linguistics Conference")
#field("Year", "2025")
#field("Title", "A Variationist Analysis of Intensification in Spanish")

#v(0.5em)
#field("Conference", "Seventh Annual Tulane Conference on Linguistics (T-CoL)")
#field("Year", "2025")
#field("Title", "A Sociolinguistic Study of Spanish Intensifiers across Two Dialects")

#v(0.5em)
#field("Conference", "Department of Communication Sciences and Disorders Roundtable, LSU")
#field("Year", "2025")
#field("Title", "Effect of Dialectal Variation on Listeners' Perception of English Interdental Fricatives and Lateral Liquid Sounds")

#v(0.5em)
#field("Conference", "Summer Undergraduate Research Forum, LSU")
#field("Year", "2024")
#field("Title", "A Sociolinguistic Study of Intensification in the Spanish of Louisianian Puerto Ricans")

#v(0.5em)
#field("Conference", "Jill Brody's Linguistic Meetup Day (hosted by Student Linguistics Association)")
#field("Year", "Spring 2023")

#section("Selected Projects")

#v(0.5em)
#field("Project", "Praat Data Analysis Scripts")
#field("URL", "https://github.com/WilliamMorales1/PraatDataAnalysis")
#field("Tools", "Praat scripting language")
#field("Description", "Praat scripts for batch WAV processing and automated acoustic measurements in a study on dialectal variation and sound perception.")

#v(0.5em)
#field("Project", "An App for Language Preservation")
#field("URL", "https://github.com/claytakiler/Heritage-Project")
#field("Tools", "Django; SQLite; React; Tailwind")
#field("Description", "Collaborative application for heritage language learners and endangered language communities to document and learn their languages; accessibility-focused.")

#v(0.5em)
#field("Project", "Multilingual Wordle")
#field("URL", "https://github.com/WilliamMorales1/Multilingual-Wordle")
#field("Tools", "Go; SQLite")
#field("Description", "Command-line Wordle supporting any language with Wiktionary entries. Word lists pulled dynamically; configurable word length and guess count.")

#v(0.5em)
#field("Project", "Swadesh Word-A-Day")
#field("URL", "https://github.com/WilliamMorales1/Swadesh-Word-A-Day")
#field("Tools", "Python; BeautifulSoup4; ntfy.sh")
#field("Description", "Scrapes Wiktionary Swadesh list appendices across 200+ languages; sends daily word-of-the-day push notifications via ntfy.sh on a cron schedule.")

#v(0.5em)
#field("Project", "GuideOverride")
#field("URL", "https://github.com/CSC4700-BRCC/Version-2")
#field("Tools", "Django; SQLite; React; OpenAI; Tailwind")
#field("Description", "Improve efficiency of processing student override requests for classes by using an AI Agent for recommendations.")

#section("Leadership and Organizations")

#field("Role", "President")
#field("Organization", "Student Linguistics Association (SLA), LSU")
#field("Dates", "2025 – present")

#v(0.5em)
#field("Role", "Vice-President")
#field("Organization", "Creole Club (Organizasyon Langaj e Lakilchi Kreyol Lalwizyàn), LSU")
#field("Dates", "2025 – present")
#field("Note", "Featured in LSU Reveille: https://lsureveille.com/265157/entertainment/lsu-creole-club/")

#v(0.5em)
#field("Role", "Vice-President")
#field("Organization", "Student Linguistics Association (SLA), LSU")
#field("Dates", "2024 – 2025")

#v(0.5em)
#field("Role", "Historian")
#field("Organization", "French Club (Le Cercle Francais), LSU")
#field("Dates", "2024 – 2025")

#v(0.5em)
#field("Role", "Event Coordinator")
#field("Organization", "Arabic Language Club, LSU")
#field("Dates", "2024 – 2025")

#section("Awards and Funding")

#field("Award", "Gulf Scholars Program, LSU")
#field("Date", "Summer 2024")

#v(0.5em)
#field("Award", "Honors TOPS Scholarship")
#field("Date", "Every semester enrolled")

#v(0.5em)
#field("Award", "President's Student Aid")
#field("Date", "Every semester enrolled")

#section("Skills and Languages")

#field("Programming Languages", "Python; SQL; Go; Java; R")
#field("Libraries and Frameworks", "pandas; numpy; BeautifulSoup4; Django; React; SpaCy; SQLite; PostgreSQL")
#field("Domain Tools", "Praat scripting; corpus linguistics methods; acoustic analysis")
#field("Human Languages", "English (Native); Spanish (Proficient); French (Intermediate); Japanese (Intermediate)")