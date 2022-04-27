# A generic data pipeline for learning data engineering

## Purpose:

The ultimate purpose of this project is to serve as a test bed project for data engineering tools.

It is composed of a set of producer services (or maybe a monolith or just a script that produces JSON, not sure yet)
that will ultimately make its way to a data warehouse of some kind.

I want to be able to play with service design (e.g microservice vs monolith), messaging, streaming and batch (e.g spark, etc), different datawarehouses (e.g clickhouse, vitess, duckdb -- olap sqlite), alternatives to airflow, dbt, etc

### Goals

1. Diagram a hypothetical business usecase

a. A book seller -- flows:
  i. order -> add book to cart -> checkout -> determine shipping & taxes -> payment -> shipping # this is the happy flow for now
 
b. determine requirements (i.e realtime-reporting, SLAs for queries, etc)
 
c. model inventories - some vendors will have the same books at different prices
 
d. only support orders for these countries: USA (California, Oregon, New York, Montana), Germany (Berlin), Japan (Tokyo), Ethiopia (Addis Ababa).

2. Micro-Service vs. Monolith

a. If this were a startup I'd go monolith all day long but in order to play around with event-driven-design and such
  we'll go with microservices

b. services emit events

c. other services listen for and then act on those events

3. Services use Dependency Injection

a. I want to create flat, simple, composable pieces of code that take on dependencies
  that are generic enough to compose with
  e.g class StreamFromDb(..., logging=Logger(dest=...),...):
  where logging could take a Logger that logs to a file, to a s3 bucket, to anything else
  but has interfaces that define what compliant objects must implement to be able to use
  e.g a save method that abstracts away the complexity of the location or the destination
  so the caller can just call save.

b. this idea is subject to change

4. Tests

a. This repo will have Tests

5. Locally testable

a. Where possible, the whole end to end pipeline should be locally runnable on a laptop and be simple to do so
