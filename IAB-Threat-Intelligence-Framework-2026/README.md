# IAB Hybrid Threat: Strategic Analysis 2026 (RTE) - ESP/ENG

### Table of Content
1. [Executive Summary](#-executive-summary)
2. [Methodology and Analytical Rigor](#-methodology-and-analytical-rigor)
3. [TECHINT collection Tools](#-techint-collection-tools)
    * [Python Engine (`fetch-iocs.py`)](#python-engine-fetch-iocspy)
    * [Automation Scripts (`.sh`)](#automation-scripts-sh)
4. [Project Structure](#-project-structure)
5. [Usage](#usage)
6. [Security considerations](#-security-considerations)

---

### Executive Summary
Análisis Estratégico de Inteligencia desarrollado para mi Trabajo de Fin de Máster, centrado en la evaluación de riesgos de Initial Access Brokers (IAB) y la amenaza de Escalada Híbrida (IT/OT) en infraestructuras críticas energéticas (RTE).

---

This repository contains the Strategic Intelligence Analysis developed for my Master's Thesis, focused on evaluating risks from Initial Access Brokers (IAB) and the threat of Hybrid Escalation (IT/OT) in critical energy infrastructures (RTE).

---

### Methodology and Analytical Rigor
Para asegurar la validez de las conclusiones, se aplicaron marcos de trabajo estándar en la industria:
- **Código Admiralty:** Clasificación sistemática de la fiabilidad y credibilidad de las fuentes de inteligencia. Adjunto se incluye un archivo JSON con la trazabilidad de las fuentes utilizadas (CISA, ENISA, MITRE, etc.).
- **Análisis de Hipótesis en Competencia (ACH):** Utilizado para refutar vectores de entrada secundarios y confirmar el Phishing/Ingeniería Social como el método más probable para el acceso inicial de Actores de Riesgo.
- **Modelo Diamante:** Aplicado para caracterizar la infraestructura y capacidades de los IABs, facilitando la transicion de una probabilidad a un riesgo sistemico basado en el riesgo sistemico basado en el pivot IT/OT.
- **Análisis DAFO y CAME:** Utilizado para dotar el análisis de un resultado Estimativo-Prospectivo y tomar la
información de riesgo y dotarla de un marco estratégico, encaminado a sostener las actividades de refuerzo y recuperación.

---

To ensure the validity of the conclusions, industry-standard frameworks were applied:
- **Admiralty Code:** A systematic classification of the reliability and credibility of intelligence sources. The attached JSON file provides traceability for the sources used (CISA, ENISA, MITRE, etc.).
- **Analysis of Competing Hypotheses (ACH):** Utilized to refute secondary entry vectors and confirm Phishing/Social Engineering as the most probable method for initial access by Threat Actors.
- **Diamond Model:** Applied to characterize the infrastructure and capabilities of Initial Access Brokers (IABs), facilitating the transition from a simple probability to a systemic risk based on the IT/OT pivot.
- **SWOT and CAME Analysis:** Used to provide the analysis with an Estimative-Prospective outcome, placing risk information within a strategic framework aimed at supporting reinforcement and recovery activities.

---

### TECHINT collection Tools
El proyecto incluye un ecosistema de herramientas en Python y Bash para automatizar la recolección de Indicadores de Compromiso (IOCs) y telemetría de amenazas:
- **fetch-iocs.py:** Script de Python que interactúa con la API de AlienVault OTX para extraer, filtrar y normalizar indicadores en un formato CSV estructurado.

Para priorizar la economia de tiempo y poder realizar otras tareas, a la vez que se efectua la busqueda por palabra clave en fetch-iocs.py, se implementaron:
- **priority_bulk_ioc_fetch.sh:** Automatización de búsqueda masiva centrada en términos críticos como "SCADA", "Critical Infrastructure" y "Valid Accounts". 3 veces por día.
- **bulk_ioc_fetch.sh:** Ejecución secuencial para la monitorización de familias de malware comunes utilizadas por IABs (como Vidar Stealer o SmokeLoader). 2 vez por día

---

The project includes an ecosystem of Python and Bash tools to automate the collection of Indicators of Compromise (IOCs) and threat telemetry:
- **fetch-iocs.py:** A Python script that interacts with the AlienVault OTX API to extract, filter, and normalize indicators into a structured CSV format.

To optimize time efficiency and allow for multitasking, the following were implemented to run alongside keyword searches in fetch-iocs.py:
- **priority_bulk_ioc_fetch.sh:** A bulk search automation focused on critical terms such as "SCADA," "Critical Infrastructure," and "Valid Accounts." Executed 3 times daily.
- **bulk_ioc_fetch.sh:** Sequential execution for monitoring common malware families used by IABs (such as Vidar Stealer or SmokeLoader). Executed 2 times daily.

---

### Usage
Informe Estratégico: Consulte el archivo PDF en la carpeta /analysis para revisar la Estrategia de Supervivencia CAME y las recomendaciones de micro-segmentación.

Configuración Técnica:
- Obtenga una API Key en AlienVault OTX.
- Renombre el archivo key.env.example a key.env e introduzca su clave.
- Ejecute el script de prioridad: bash priority_bulk_ioc_fetch.sh.

---

Strategic Report: Refer to the PDF file in the /analysis folder to review the CAME Survival Strategy and micro-segmentation recommendations.

Technical Setup:
- Obtain an API Key from AlienVault OTX.
- Rename the key.env.example file to key.env and enter your key.
- Run the priority script: bash priority_bulk_ioc_fetch.sh.

---

### Security considerations
Este repositorio cumple con las mejores prácticas de seguridad:
- Gestión de Secretos: Las llaves de API reales están excluidas mediante un archivo .gitignore.

--- 

This repository follows industry best practices:
- Secret Management: Real API keys are excluded via a .gitignore file.
