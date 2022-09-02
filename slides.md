---
title: Breaking the boundaries of current metadata
subtitle: a perspective from VZG
date: 2022-09-06
author: Jakob Voß
---

## Outline

1. Current trends in metadata

2. Boundaries of metadata in CBS

3. Breaking the boundaries

# Current trends in metadata

# Obvious trends {data-background-image=light-speed-travel-into-the-stars.png}

- **Cloud infrastructure**: distributed servers

- **Big data**: continuing growth

- **Machine learning & AI**: not today

## Metadata getting fancy {data-background-image=many-colorful-flowers.png}

- **Diversity** of both metadata and actors

- **Data science** brings more tools and people than ever

## Decentralization {data-background-image=decentralized-network.png}

- **Integration** across multiple systems

- **Aggregation** in data warehouses, data lakes... *for analysis*

## Metadata Management

- **Governance** by quality and observation

- **Active metadata** e.g. logging, alerts...

## Main challengens of current metadata trends

- More **diverse** metadata must be **integrated**

- Different **people and tools** (data scientist, data analyst, dara enigneers...)

- Growing expectations on **quality and accessibility** for multiple purposes

## Example

Number of books by publisher X in subject area Y held by each library?

# Boundaries of metadata in CBS

## Basic problems

- CBS is a specialized tool for managing data in PICA and MARC

- PICA and MARC are arcane and limited data formats

Limitation to record-field-subfield data.

## Limitations

- Number of people doing data processing in CBS/PICA/MARC...

- Number of accessible standards and tools

## Challenges

- Make it easier to use CBS data by others (self service is a must)

- Make it easier to use other data together with CBS data

- Make metadata workflows more transparent

# Breaking the boundaries

## Confession

- It's complicated

- Two independent strategies

## Standardization

- Avram Schema format for MARC- and PICA-based formats

- PICA Patch format to express changes of PICA records

- APIs and tools that can be used by anyone

- Data languages *how* but *what*

## Beyond record-field-subfield data

- CBS knowledge graph

- Expose via (RDF, Graph Database...)

## CBS knowledge graph

From records in CBS:

- Hierachical Record model
- Links between records via `$9`
- Links via identifiers (DOI, ISSN...)

From external data:

- Links between authors, organizations, libraries, topics...
- Additional information: names, current data...

## Example

Number of books by publisher X in subject area Y held by each library

## Imperative solution (script)

1. Build index of transitive sub-subjects of `Y`

2. Get books by publisher `X`:
  `pica filter "033.n="$"` (pica-rs)

3. Reduce to books with subject in index

4. Count libraries with holding of the book

## SPARQL query

Established query language for RDF

~~~sparql
SELECT ?library (COUNT(?book) as ?number) WHERE {
  ?book dct:publisher <$X> .
  ?book dct:subject/skos:broader* <$Y> .
  ?bibframe bibframe:hasItem [ bibframe:heldBy ?library ] .
} GROUP BY ?library
~~~

## Cypher query

Most common query language for Graph Databases, being standardized as GQL by ISO

~~~
MATCH (b:Book)-[:PUBLISHER]->$X,
      (b:Book)-[:ITEM]->()-[:HELDBY]->(library:Library)
WHERE (b:Book)-[:SUBJECT]->$Y OR
      (b:Book)-[:SUBJECT]->(s:Concept)-[:BROADER*]->$Y
RETURN library, count(*)
~~~

## Takeaways

- Standardization of data languages to process PICA & MARC:
    - Avram
    - PICA Path
    - PICA Diff

- From record-field-subfield to knowledge graphs

## References

- Avram
- PICA Path
- PICA Diff
- pica-rs

