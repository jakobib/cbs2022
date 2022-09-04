---
title: Breaking the boundaries of current metadata
subtitle: a perspective from VZG
date: 2022-09-06
author: Jakob Voß
title-slide-attributes:
  data-background-image: vzg-slides-background.png
---

## Outline {data-background=vzg-slides-background.png}

1. Current trends in metadata

2. Boundaries of metadata in CBS

3. Breaking the boundaries

# Current trends in metadata {data-background=vzg-slides-background.png}

## Obvious trends {data-background-image=light-speed-travel-into-the-stars.png}

- **Cloud infrastructure**: distributed servers

- **Big data**: continuing growth

- **Machine learning & AI**: not today

## Metadata getting fancy {data-background-image=many-colorful-flowers.png}

- **Diversity** of both metadata and actors

- **Data science** brings more tools and people than ever

## Decentralization {data-background-image=decentralized-network.png}

- **Integration** across multiple systems

- **Aggregation** in data warehouses, data lakes... *for analysis*

## Metadata Management {data-background-image=busy-clerk-in-a-library.png}

- **Governance** by quality and observation

- **Active metadata** e.g. logging, alerts...

## Challenges summarized {data-background-image=busy-clerk-in-a-library.png}

- More **diverse** metadata must be **integrated**

- Different **people and tools**:\
  *data scientist, data analyst, data enigneers...*

- Growing expectations on **quality and accessibility** for multiple purposes

## Example {data-background=flock-of-books.png}

Number of books\
by publisher *X*\
in subject area *Y*\
held by each library

# Boundaries of metadata in CBS {data-background=book-fortress.png}

## Basic problems {data-background=book-fortress.png}

- CBS is a **specialized tool** for managing\
  data in PICA and MARC

- PICA and MARC are arcane, limited data formats:\
  *record-field-subfield*

## Limitations {data-background=book-fortress.png}

- **Number of people** doing data processing in CBS/PICA/MARC...

- Little accessible **standards and tools**

## Challenges {data-background=book-fortress.png}

- Facilitate **use of CBS** data by others

- Facilitate use of **external data** with CBS

- Make metadata **workflows more transparent**

# Breaking the boundaries {data-background=rainbow.png}

## Confession {data-background-image=busy-clerk-in-a-library.png}

- It's complicated

- Two independent strategies

## 1. Standardization {data-background=rainbow.png}

- **Avram Schemas** for MARC- and PICA-formats

- **PICA Patch format** formalizes changes records

- **APIs and tools** that can be used by anyone

## Advantages {data-background=rainbow.png}

- Based on **common web standards** (JSON...)

- **Accessible** by more people with diverse needs

- Not *how* (*take field X, filter by condition Y...*)\
  but ***what*** (*records with specific condition...*)

<!-- TODO: following slides -->

## 2. Knowledge graphs {data-background-image=decentralized-network.png}

- Records in CBS
    - Hierachical Record model (record level)
    - Links between records via `$9` and PPN
    - Links via identifiers (DOI, ISSN...)

- External data
    - Author affiliation, addresses, names...

## Knowledge graph

- Create **CBS Knowledge Graph**

- **Expose** via RDF or Graph Database

- **Integrate** with external Linked Data

## Example {data-background=flock-of-books.png}

Number of books\
by publisher *X*\
in subject area *Y*\
held by each library

## Imperative script {data-background=flock-of-books.png}

1. Build index of transitive sub-subjects of `Y`

2. Get books by publisher *X*\
  `pica filter "033.n="$"` (pica-rs)

3. Reduce to books with subject in index

4. Count libraries with holding of the book

## SPARQL query {data-background=flock-of-books.png}

Established query language for RDF

~~~
SELECT ?library (COUNT(?book) as ?number) WHERE {
  ?book dct:publisher <$X> .
  ?book dct:subject/skos:broader* <$Y> .
  ?bibframe bibframe:hasItem [ bibframe:heldBy ?library ] .
} GROUP BY ?library
~~~

## Cypher query {data-background=flock-of-books.png}

Most common query language for Graph Databases, being standardized as GQL by ISO

~~~
MATCH (b:Book)-[:PUBLISHER]->$X,
      (b:Book)-[:ITEM]->()-[:HELDBY]->(library:Library)
WHERE (b:Book)-[:SUBJECT]->$Y OR
      (b:Book)-[:SUBJECT]->(s:Concept)-[:BROADER*]->$Y
RETURN library, count(*)
~~~

## Takeaways {data-background-image=many-colorful-flowers.png}

- Standardization of data languages to process PICA & MARC
    - **Avram Schema** format
    - **PICA Diff** format

- From record-field-subfield to **knowledge graphs**

## References {data-background-image=many-colorful-flowers.png}

- <https://format.gbv.de/schema/avram/specification>
- <https://format.gbv.de/pica/patch>
- <https://deutsche-nationalbibliothek.github.io/pica-rs/>
- Background images AI created with stable diffusion and midjourney
