---
title: Breaking the boundaries of current metadata
subtitle: a perspective from VZG
date: 2022-09-06
author: Jakob Voß
---

## Outline

- Current trends in metadata

- Boundaries of metadata in CBS

- Breaking the boundaries

# Current trends in metadata

## Obvious trends

- **Cloud infrastructure**: distributed servers

- **Big data**: continuing growth

- **Machine learning & AI**: not today

## Metadata getting fancy

- **Diversity**: both metadata and actors

- **Data science**: more tools and people than ever

## Decentralization

- **Non-monolithic** data management solutions

- **Integration** of diverse metadata

- **Aggregation** in data warehouses, data lakes... for analysis only

## Metadata Management

- **Governance** by quality and observation

- **Active metadata** e.g. logging, alerts...

## Challengens of current metadata trends

- More diverse metadata must be integrated

- Different kind of people and tools (data scientist, data analyst, dara enigneers...)

...

## Examples

- books by publisher X held by library Y grouped by subject area

- Select 
# Boundaries of metadata in CBS

## Basic problem

- CBS is a dinosaur (image: asteroid impact)

- PICA and MARC are arcane data formats

Training people does not scale
(how many actual users of CBS exist at all?): I'd guess ~100

## More specific...

- No standard tools (e.g. query language, schema language
- Not accessible 

## Challenges

- make it easier to use CBS data by others (self service is a must)
- make it easier to use other data together with CBS data
- make metadata workflows more transparent

# Breaking the boundaries

## Confession

- It's complicated

- Just two ideas

## Standardization

- Avram Schema format for MARC- and PICA-based formats

- PICA Patch format to express changes of PICA records

- APIs and tools that can be used by anyone

## Beyond record-based data

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


