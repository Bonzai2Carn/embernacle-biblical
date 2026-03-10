# Embernacle Biblical Data

Welcome to the Embernacle Biblical data repository! This repository serves as the central data source for [Embernacle](https://embernacle.com/), an interactive and beautifully designed Bible web application.

## 📖 About the Product & Purpose
Our goal at Embernacle is to provide believers with an accessible, immersive, and highly interactive way to read and study the Holy Bible. As our application grows, so does the underlying data. 

This repository was created to decouple the raw data (processed Bible translations, study modes, quizzes, theological concepts, and more) from the primary application logic. By isolating this data into its own submodule, we achieve:
- **Faster Application Builds:** Deploying UI updates no longer requires re-processing gigabytes of JSON files.
- **Community Collaboration:** Anyone can submit corrections to typos or improve study material straight through GitHub.
- **Better Versioning:** We can independently track versions of the Bible data and push updates directly to users via cache invalidation, without a full app redeploy.

## 🗂️ What's Inside?
- **Processed Bible Translations**: Structured JSON format for different Bible versions (e.g., KJV, BSB, ASV, WEB, FBV).
- **Study Mode Content**: Commentary, theological concepts, dictionary data, and cross-references.
- **Interactive Data**: Data for Bible quizzes, character journeys, doctrinal compass, and Socratic questions.

## 🤝 How to Contribute
We believe that the body of Christ works best together! If you spot a typo in a verse, an incorrect speaker attribution, or a mistake in our study data, you can easily suggest a fix.

1. **Through the App (Recommended):** Use the "Help us fix it" feature directly on the [Embernacle Support Page](https://embernacle.com/support) to visually find and submit your fix without interacting with raw JSON!
2. **Directly via GitHub:**
   - Fork this repository.
   - Navigate to the specific JSON file containing the error (e.g., `processed_bible_BSB/Genesis/1.json`).
   - Make your edit (please ensure the JSON formatting and commas remain perfectly intact).
   - Submit a Pull Request (PR) describing the change. Our team will review and approve it!

By contributing, you are helping believers all around the world experience an accurate and typo-free study experience!

## ⚖️ License and Terms
This data is made available to the public for **personal, non-commercial use** to aid in Bible study, software development, and non-profit educational purposes. Users can use it but cannot use it for commercial purposes.

**Important Legal Links:**
- [Terms & Conditions](https://embernacle.com/terms)
- [Privacy Policy](https://embernacle.com/privacy)

*Let the word of Christ dwell in you richly... (Colossians 3:16)*
