# Design Document

By MATIAS NOTARANGELO

Video overview: <https://youtu.be/MnS5jb7aplc>

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
- The purpose of this database is to collect, classify, and analyze a wide range of information from various sources. This includes both structured and unstructured data, which will be systematically organized and processed to generate comprehensive intelligence reports. These reports will help identify trends, make predictions, and support decision-making.

* Which people, places, things, etc. are you including in the scope of your database?

- The database functions as a structured log of unrefined and refined intelligence. The information provided, entities, relationship between entities, analysis, and predictions may result useful to map future events.

* Which people, places, things, etc. are *outside* the scope of your database?
    - PII and SPII (like credit card numbers or personal ID documents or biometric data)
    - Economic transactions
    - Real time communications or informations related to the entities

## Functional Requirements

In this section you should answer the following questions:
* What should a user be able to do with your database?
    - Extracting insights, insert, consult, filter and query by source, classification or Trustworthiness
    - Mapping entities and their interactions

* What's beyond the scope of what a user should be able to do with your database?
    - Collaborative workflows or AI-related activities
    - GUI facilitating the data visualization
    - Automated recollection of information

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
    - Sources - Where does Intel come from?
    - Events - What has happened? Classify and document
    - Authors - Who is publishing this info?
    - Entities - Who is involved in the events?
    - Relationships - What happened between 2 entities?
    - Raw-data - What has emerged from an event?
    - Analysis - What Insights have emerged from raw-data?
    - Previsions - What is expected in the future based on the analysis?

* What attributes will those entities have?
COMMON: All entities share a common attribute unique for each table 'id' wich identifies the entry or row.
Sources
    - name: Name of the Source (ex. 'New York Times', 'X', 'UN report')
    - type: Source classification
    - trust: Reliability level of the source
    - last_check: Date and time the source was last verified

Events
    - source_id: Links to the source that reported it
    - title: Short title for the event
    - description: Summary of what happened
    - event_date: When the event occurred
    - place: Where it happened
    - category: type of event

Authors
    - name: Full name of the Analyst
    - role: Their role

Entities
    - name: Name of the entitie
    - type: Type of entitie reported (Ex. 'OCG', 'Business', 'Government')
    - description: Overview or profile
    - place: Location of activity or origin
    - importance: Strategic relevance

Relationships
    - prime_entity_id: First entity involved
    - second_entity_id: Second entity involved
    - relation_type: Nature of the relationship (Ex, 'Ally', 'Rival', 'Conflict')
    - start_date/end_date: Time-frame of the interaction

Raw_Data
    - source_id: Source of the information
    - content_format: Format type (Ex. 'Text', 'Image')
    - retrieval_date: When it was collected

Analysis
    - event_id: The event it is based on
    - author_id: The author that created it
    - title: Title of the analysis
    - creation_date: When it was produced

Previsions
    - analysis_id: Which analysis is it based on
    - description: Predicted event or insight
    - probability: Likelihood score in percentiles
    - creation_date: When the forecast was made
    - status: Current status (Ex, 'Pending', 'Verified', 'Rejected')


* Why did you choose the types you did?
    - VARCHAR, for concise and structured strings that serves the purpose of identifying the concept of the column or row
    - TEXT, for more detailed, descriptive and overall long text
    - DATETIME, to keep a log of detailed time records (it is extremely important in this line of work)
    - ENUM, to limit the categories assignable to a specific piece of data

* Why did you choose the constraints you did?
    - FOREIGN KEYS, to link the tables and enforce a proper structure in the database
    - NOT NULL, to make sure that essential fields are never stored as 'empty'
    - AUTO_INCREMENT, to assign unique ID to each new entry

### Relationships

![ERD_Intel.png](img/ERD_Intel.png)

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

* One-to-Many Relationships
- SOURCES ||--o{ EVENTS : places
    One source can have multiple events. The 'places' label indicates that events are derived from sources.

- SOURCES ||--o{ RAW-DATA : "provides"
    One source can 'provide' multiple raw-data entries. Indicates the data is gathered from the source.

- EVENTS ||--o{ ANALYSIS : "liable for"
    One event can have multiple analyses. The 'liable for' label suggests that an event is associated with analyses.

- AUTHORS ||--o{ ANALYSIS : "produces"
    One author can 'produce' multiple analyses. Shows the relationship between authors and the analysis they contribute to.

- ANALYSIS ||--o{ PREVISIONS : "leads to"
    One analysis can 'lead' to multiple previsions.
    Answers, how previsions are based on analysis?

* Many-to-Many Relationship (via Relationship table):
- ENTITIES ||--o{ RELATIONSHIPS : "involved in"
    One entity can be 'involved' in multiple relationships. It shows the connection between entities and their relationships.

- RELATIONSHIPS }|..|{ ENTITIES : "connected to"
    A a many-to-many relationship that connects two entities



## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?
In order to speed-up the research of information in the most used filters two indexes were created:
    - idx_event_DataCategory to optimize searches of events by date and category
    - idx_previsions_PerStatus to improve the queries that filters previsions by probability and status
 As for the complexity of repetitive queries, were implemented two views:
 - view_EventSource, to retrieve details on the Source of a specific event in a single query.
 - view_LivePrevisions to analyze active and significative previsions (with a probability of 80% or more)


## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
    - The system does not support real-time data entries nor automatic updates.
    - The information inserted into the database is not automatically verified; 'trust' is defined manually, which could cause flaws in the analysis or security if not corrected in future versions.
* What might your database not be able to represent very well?
The structure of the database is static, dynamic changes must be generated manually. In a data-driven world where information changes all the time, this could constitute a problem since the depiction portrayed is too rigid. This could be addressed by adding more tables and perhaps machine learning to improve the allocation of information, security controls, and depiction of reality.
