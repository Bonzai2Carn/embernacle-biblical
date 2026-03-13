# Embernacle Biblical Data

> *"Let the word of Christ dwell in you richly, teaching and admonishing one another in all wisdom."* — Colossians 3:16

This is the open data repository that powers [Embernacle](https://embernacle.com/) — an interactive Bible application designed for believers who want to read, study, and experience Scripture with depth and beauty.

We believe the body of Christ works best together. **If you find an error in a verse, a speaker attribution, or a study note, your fix matters — and you can submit it right now.**

---

## How to Contribute

### Option 1 — Through the App (Easiest)

Go to [embernacle.com/support](https://embernacle.com/support) and use the **"Help us fix it"** feature. You can visually find the verse or study content that needs correction and submit your fix without ever touching a JSON file.

### Option 2 — Directly via GitHub

1. **Fork** this repository.
2. Find the file you want to fix:
   - A Bible verse: `processed_bible_{TRANSLATION}/{Book}/{chapter}.json`
   - Study content: `processed_study_mode/{Book}/{chapter}.json`
   - A theological entry: `theological_perspective.json`
3. Make your edit — keep the JSON formatting intact (watch commas and brackets).
4. Submit a **Pull Request** with a short description of what you changed.

Our team reviews all PRs. Approved fixes are batched and pushed directly to users without requiring a full app redeploy.

**Good contributions:**
- Correcting verse text against the original translation source
- Fixing punctuation, capitalization, or spacing
- Correcting a speaker attribution (`God`, `Jesus`, or a named character)
- Improving a study question, cross-reference, or theological summary

**Please do not:**
- Add new translations without opening an issue first
- Modify `version.json` manually — it is updated by the automated release workflow
- Restructure the JSON schema — open an issue to propose schema changes

---

## What's Inside

```
embernacle-biblical/
│
├── processed_bible_BSB/        # Berean Standard Bible
├── processed_bible_KJV/        # King James Version
├── processed_bible_NKJV/       # New King James Version
├── processed_bible_NIV/        # New International Version
├── processed_bible_WEB/        # World English Bible
├── processed_bible_FBV/        # Free Bible Version
├── eng_asv/                    # American Standard Version
│
├── processed_study_mode/       # Devotional, Socratic & Theological content per chapter
│
├── theological-data.json       # Seed discussion posts & comments
├── theological_perspective.json # Bible encyclopedia entries
├── version.json                # Data version + last-updated timestamp
└── README.md
```

### Translations

| Translation | Full Name | Coverage |
|-------------|-----------|----------|
| BSB | Berean Standard Bible | Full OT + NT |
| KJV | King James Version | Full OT + NT |
| NKJV | New King James Version | Full OT + NT |
| NIV | New International Version | Full OT + NT |
| WEB | World English Bible | Full OT + NT + Deuterocanon |
| FBV | Free Bible Version | Full OT + NT |
| ASV | American Standard Version | Full OT + NT |

### Study Modes

Each chapter in `processed_study_mode/` has three reading modes:

- **Devotional** — guided reflection, a short embodied practice, a creative prompt, and a closing re-evaluation question.
- **Socratic** — a three-way philosophical question with expanded answers, an open nudge question, and a moral spectrum slider.
- **Theological** — academically grounded thematic summaries with cross-references for each major theme in the chapter.

---

## Data Schemas (Reference)

### Bible Chapter File

**Path:** `processed_bible_{TRANSLATION}/{Book}/{chapter}.json`

```json
{
  "verses": [
    { "type": "heading", "text": ["The Creation"] },
    {
      "verse_num": "1",
      "segments": [
        { "type": "narrative", "text": "In the beginning God created the heavens and the earth." }
      ],
      "footnotes": [],
      "references": []
    },
    {
      "verse_num": "3",
      "segments": [
        { "type": "narrative", "text": "And God said," },
        { "type": "divine",    "text": "Let there be light,", "speaker": "God" },
        { "type": "narrative", "text": " and there was light." }
      ],
      "footnotes": [{ "text": "+ Cited in 2 Corinthians 4:6" }],
      "references": []
    }
  ]
}
```

The `verses` array interleaves **heading objects** and **verse objects** in reading order.

**Segment types — Speeches:**

| `type` | Description | Has `speaker`? |
|--------|-------------|----------------|
| `divine` | God, Jesus, Holy Spirit, or Angels speaking | Yes (`"God"`, `"Jesus"`, `"Angel"`) |
| `prayer` | Human addressing or praying to God | Yes (person praying) |
| `prophetic` | Prophet quoting God or predicting the future | Yes (prophet's name) |
| `speech` | General human dialogue | Yes (name or `"Unknown"`) |
| `sermon` | Extended discourse or teaching (e.g. Sermon on the Mount) | Yes (speaker's name) |

**Segment types — Narratives:**

| `type` | Description | Has `speaker`? |
|--------|-------------|----------------|
| `narrative` | Standard prose storytelling | No |
| `hymnal` | Praises, poetry, psalms, or songs | No |
| `law` | Covenant instructions — legal or moral codes | No |
| `letters` | Epistles or written communications | No |
| `genealogy` | Lists of lineages (e.g. Genesis 5, Matthew 1) | No |
| `census` | Lists of names, tribes, or quantities (Numbers, Ezra, Nehemiah) | No |
| `instructional` | Technical descriptions: Tabernacle architecture, ritual procedures (Exodus, Leviticus) | No |

---

### Study Mode Chapter File

**Path:** `processed_study_mode/{Book}/{chapter}.json`

```json
{
  "book": "Genesis",
  "chapter": 1,
  "modes": {
    "devotional": {
      "tiny_practice": { "action": "...", "timer": 20 },
      "two_step": {
        "reflect_question": "...",
        "options": [{ "id": 1, "text": "...", "response": "..." }]
      },
      "creative_prompt": { "instruction": "...", "type": "draw" },
      "reevaluation": { "question": "...", "options": ["..."] }
    },
    "socratic": {
      "three_choice": {
        "question": "...",
        "choices": [{ "id": 1, "text": "...", "expansion": "..." }]
      },
      "socratic_nudge": { "question": "..." },
      "moral_slider": { "question": "...", "left_label": "...", "right_label": "..." }
    },
    "theological": {
      "thematic_summaries": [
        { "title": "...", "summary": "...", "cross_references": ["John 1:1-3"] }
      ]
    }
  }
}
```

---

### Version File

**Path:** `version.json`

```json
{
  "version": "1.0.0",
  "lastUpdated": "2026-03-09T22:27:50Z"
}
```

The app compares this against its locally cached version to know when to refresh Bible data. Bump `version` on schema changes; `lastUpdated` is updated automatically on content releases.

---

## License & Terms

This data is available for **personal, non-commercial use** to support Bible study, software development, and non-profit educational purposes. Commercial redistribution requires written consent.

Individual translations may carry their own copyright restrictions (NIV, NKJV). BSB, WEB, ASV, and FBV are in the public domain or permissively licensed for broad use.

- [Terms & Conditions](https://embernacle.com/terms)
- [Privacy Policy](https://embernacle.com/privacy)

---

*Soli Deo Gloria.*
