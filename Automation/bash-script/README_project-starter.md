# New Project Starter
### Table of Content
1. [Before starting](#considerations)
2. [Project Overview](#overview)
3. [Features](#features)
4. [Utility](#what-is-the-script-for)
5. [Improvements](#areas-of-opportunity)
6. [Usage](#usage)

### Considerations
- **Operative System** The following project was realized on Ubuntu, a popular Linux distribution. But it can be replicated also on Windows or macOS (as long as we make sure to install/already have Bash)
- **Dependencies** Only Bash is required. No additional tools need to be installed.

## Overview
This is a simple bash script that bootstraps a new academic project by generating a clean and organized folder structure.
It automatically creates the following directories:

notes/ → for research notes
sources/ → for references, data, or source material
drafts/ → for early versions of documents
final/ → for polished deliverables

Additionally, the script generates a README.md with the project title and creation date, ensuring every project starts with a clear entry point.

### Features
- Automatic folder creation: Sets up notes/, sources/, drafts/, and final/ folders.
- README initialization: Includes project name and creation date by default.
- Error handling: Prevents execution if no project name is provided.
- Lightweight: Runs with no external dependencies.

### What is the script for?
- Starting academic projects (essays, research papers, group work) with a ready-to-use structure.
- Keeping project files organized from the very beginning.
- Avoiding repetitive manual setup for every new project.
- Learning basic bash scripting and automation in the context of academic workflows.

### Areas of opportunity
- Add a default .gitignore and auto-initialize a Git repository.
- Support optional templates for LaTeX, Markdown, or Word documents.
- Include automatic metadata (author, institution, course name).
- Provide interactive prompts for customized directory structures.

### Usage
1. Clone or download this repository.
2. Make the script executable:
 `chmod +x project-starter.sh`
3. Run the script with your project name:
`./project-starter.sh "My Research Project"`

4. The following structure will be created:

```
My Research Project/
├── drafts/
├── final/
├── notes/
├── sources/
└── README.md

```