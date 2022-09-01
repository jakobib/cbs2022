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

## Obvious trends

- **Cloud infrastructure**: distributed servers

- **Big data**: continuing growth

- **Machine learning & AI**: not today

## Metadata getting fancy

- **Diversity** of both metadata and actors

- **Data science** has more tools and people than ever

## Decentralization

- **Integration** of metadata across multiple systems

- **Aggregation** in data warehouses, data lakes... *for analysis*

## Metadata Management

- **Governance** by quality and observation

- **Active metadata** e.g. logging, alerts...

## Challengens of current metadata trends

- More *diverse* metadata must be *integrated*

- Different people and tools (data scientist, data analyst, dara enigneers...)

- Growing expectations on quality and accessibility for multiple purposes

## Example

- Books by publisher X held by library Y grouped by subject area?

- Which conferences did members of research group Z present papers at?

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

- Just two ideas

## Standardization

- Avram Schema format for MARC- and PICA-based formats

- PICA Patch format to express changes of PICA records

- APIs and tools that can be used by anyone

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


