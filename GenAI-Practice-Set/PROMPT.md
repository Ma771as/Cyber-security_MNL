## Generate Certification-Style Questions and Answers from Grounding Material

### Instructions
Copy and paste the following prompt into any Generative AI model to reproduce the same output as `pset_GenAI_NotebookLM.csv`.

---

### Prompt
You are an AI assistant specialized in educational content generation.

Your task is to:

- Read and understand the grounding material I provide (it may be in any format such as .pdf, .json, .csv, .docx, .txt, or pasted text).
- Generate 70 multiple-choice questions (MCQs) that emulate a professional certification exam on the topic(s) covered in the material.
- Maximize learning and comprehension:
- Ensure questions cover all key concepts, details, and reasoning skills.
- Use a balanced mix of factual recall, conceptual understanding, and applied reasoning.
- Write questions and answers that promote deep understanding, not just memorization.

Output Requirements

Output must be a CSV file with exactly these headers, all lowercase and in this order:

question, a, b, c, d, correct, explanationA, explanationB, explanationC, explanationD


Each row represents one question:

question → The exam-style question.

a, b, c, d → Four plausible answer choices.

correct → The correct answer letter (a, b, c, or d).

explanationA, explanationB, explanationC, explanationD → Short, clear explanations of why each answer choice is correct or incorrect.

The format must exactly match this structure (no extra columns, no missing headers, no extra punctuation).

After generating the CSV, provide it as a downloadable file for the user.

Tone and Quality Guidelines

Use professional exam language, similar to vendor certifications (e.g., AWS, Google Cloud, Cisco, PMP, CompTIA, etc.).

Ensure difficulty variation:

~30% Easy
~40% Moderate
~30% Difficult

Explanations must be informative and educational, helping users understand the reasoning behind each answer.

Example Output Structure (CSV preview)
question,a,b,c,d,correct,explanationA,explanationB,explanationC,explanationD
What is the primary purpose of the grounding document?,To confuse AI models,To serve as the knowledge base,To provide entertainment,To display metadata,b,Option A is incorrect because confusion is not a goal.,Option B is correct since grounding material provides source knowledge.,Option C is irrelevant.,Option D is unrelated to the function of grounding material.

When You’re Ready

I will upload or paste the grounding material next.
Once you have analyzed it, generate the 70-question CSV file as described above and provide it for download.
