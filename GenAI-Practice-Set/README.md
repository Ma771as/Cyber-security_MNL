# CSV Driven Quiz Application for the GGC Generative AI Cert
### Table of Content
1. [Before starting](#considerations)
2. [Project Overview](#overview)
3. [Features](#features)
4. [Utility](#what-is-the-script-for)
5. [Improvements](#areas-of-opportunity)
6. [Usage](#usage)

### Considerations
- **CSV Data Structure** This small web-app requires a specific header row for the parsing function to operate correctly. The headers must be exactly: `question`, `a`, `b`, `c`, `d`, `correct`, `explanationA`, `explanationB`, `explanationC`, `explanationD`.
- **Dependencies** The application relies on the free, open-source Papa Parse library, which is loaded via CDN (Content Delivery Network) link insidet the `index.html` file, it requires no local installation.
- **Environment** This web-app runs directly in any modern web-browser and requires no server, it is enough with clicking on the `index.html` file or excuting on the CLI:
    `xdg-open index.html`


## Overview
This is a dynamic quiz application designed to load and run question sets from a standard CSV file. It automatically parses the CSV data, manages the user progress and score, and provides instant feedback and explaination for each answer.

The core success of this project resides in the possibility of leveraging Gen AI (Generative Artificial Intelligence) to condense the core knowledge of vast amounts of text in a finite amount of practice questions that may challenge and preapare the user to confront a certification exam. All of this, in a CSV file that can be uploaded and parsed with a robust data handling archived by integrating the industry-standard `Papa Parse library`, which reliably manages the complexities of real-word CSV files.

### Features
- **Customizable Content:** Loads all the questions, answers and feedbacks directly from an uploaded .csv file.
- **Progress Tracking:** Display a progress bar and question count to keep user informed.
- **Instant Feedback and Score summary:** Provides immediate notification (Correct/incorrect) and detailed explaination after each submission. Returns a final score based in performance.
- **CSV Parsing:** Utilize `Papa Parse` library to handle complex data formats and ensures the app worlks reliably with files generated from Gen AI.

### What is the script for?
- Ideal for studying large practice sets of questions like those from certification exams without needing a dedicated online quiz platform.
- Allows users to easily create and share questions banks in CSV file, using tools such as NotebookLM to generate high quality sets for a improved learning experience.
- An amazing way to practice my proficiency in HTML and JavaScript, DOM manipulation and integration of libraries.

### Areas of opportunity
- Improve the `style.css` for a more modern, responsive and polished user interface.
- Add a restart quiz button at the end of the practice set.
- Add a timer to add realism to the simulation of a certification exam.

### Usage
1. Clone this repository or Download the `index.html`, `style.css` and `pset_GenAI_NotebookLM.csv`.
2. Open your index.html file directly in your web browser.
3. Click "Choose File" and select your prepared CSV file (If you are just testing the tool or studying for the Google Cloud Generative AI Leader Certification feel free to use the provided `pset_GenAI_NotebookLM.csv`)
4. Your quiz will begin immediately, dig-in and repeat until ready for the exam.

If you do not wish to use the provided .csv file or want to use the tool for another topic:

1. Access notebooklm.google.com or any Gen AI Assistant of your choosing.
2. Ground you AI by using you notes for the exam (be careful of consulting terms of agreement, some exams may demand you not to make public the noted they provide for study purpose)
3. Copy and paste the promt provided in [PROMPT.md](PROMPT.md)
