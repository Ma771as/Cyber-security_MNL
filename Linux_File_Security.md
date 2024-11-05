# Linux File Security
## Tools Featured
- SELinux
- AppArmor
- TCP Wrappers

## Overview
**Goal:** Secure file.txt using SELinux, AppArmor and TCP Wrappers and compare the tools demonstrating the strenghts and weaknesses of each tool by using them in parallel.
**Objective:** Use each tool to create a layered security approach and control file access based on different criteria.
## Treath Model
- Unauthorized local access by other users
- Unauthorized network access by untrusted IP adresses
- Accidental access by sctors that should not have the permission  to read or write file.txt
## Scenario
### Setting Up SELinux: Access Control
    #### Scope
    Using SELinux to restrict access to file.txt, ensuring only authorized application can read the file.
    #### Configuration
    #### SELinux Policy Module
    #### Test the Policy
    #### Documentation
    What-s your 1st source of documentation: WEB
    Explain commands and include a brief description of how SELinux handles file context and access controls. 
### Setting Up AppArmor: Application-level Control
    #### Scope
    Further restrict access by creating an APPArmor profile for my app, limiting it to read-only access for file.txt and blocking other applications.
    #### Configuration
    #### Documentation
    What-s your 1st source of documentation: WEB
    Document the profile creation process, with a focus on the meaning of r, and other syntax details.
### Setting Up TCP Wrappers: Network Access Control
    #### Scope
    Limit Nework access to the server to a specific set of IP addresses, preventing inauthorized IPs from even attempting to connect. 
    #### Configuration
    #### Documentation
    What-s your 1st source of documentation: WEB
    Explain how TCP Wrappers control access, the logic behind allow and deny and why these files should be thightly controlled.
    #### Testing
        -Unauthorized local user cannot r or w to file.txt
        -The authorized can access as intended.
        -Unauthorized applications or process annot access
        -Only specified IP addresses can connect to the server.
    Troubleshooting
## Documentation
- Summary of Findings : Provide a summary that compares the 3 tools and highlits which scenarios each tool handled and where overlaps or gaps exist.
- Lesson Learned : mention any unexpected challenges (like configuring SELinux policies) and what you learned about security layers.
## Reflection on Security Posture
Summarize how using SELinux, AppArmor and TCP Wrappers in combination creates a robust defense-in-depth approach. Highlight the importance of layered security 


