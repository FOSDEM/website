---
year: 2017
speaker: peter_baumann 
event: datacubes
---

Q: Could you briefly introduce yourself?

Peter Baumann, Bavarian, Principal Architect of [rasdaman](http://www.rasdaman.org/) (which has pioneered
[Array Databases](https://en.wikipedia.org/wiki/Array_DBMS)), editor of a couple of Big Data standards, [OSGeo](http://www.osgeo.org/) Charter Member.

Q: What will your talk be about, exactly? Why this topic?

A new standard is in the making which will be a gamechanger in scientific &
engineering data & beyond: SQL/MDA ("Multi-Dimensional Arrays"). The standard
will likely be released in summer 2017, after several years of intense
preparation. This is an opportunity for the community to get a sneak preview,
and the opportunity to discuss with the standards initiator and editor.

Q: What do you hope to accomplish by giving this talk? What do you expect?

A good discussion :)

Q: Why is it so important to support multi-dimensional arrays (also called datacubes) in SQL?

  1. Declarative queries, where SQL has been and is the spearhead, are a
     promising answer to the "ship code to data" paradigm in "Big Data". They allow
     flexibility on the client side as well as scalability on the server side.

  2. More and more, n-D arrays are being recognized as being responsible for a
     large part of our "Big Data". However, arrays never come alone, they need to be
     integrated - hence, coupling of array models and others like sets - this is SQL - and hierarchies - like with [XQuery](http://www.w3.org/XML/Query/) - is an important next step (in database
     research cross-model integration today is termed "polystores").

Q: What's the history of the rasdaman project? Why was it started and how did it evolve?

1994 - As a spinoff from my PhD thesis, the first VLDB (Very Large Data Base) article has been
published on the idea of having declarative query support + a scalable
architecture specifically for n-D arrays.

1996 - "RasDaMan" as a first feasibility study.

2003 - rasdaman GmbH established.

2008 - Together with Jacobs University, rasdaman GmbH forked the open source
["rasdaman community" project](http://www.rasdaman.org).

2008 - [OGC WCPS](http://www.opengeospatial.org/standards/wcps) standard published, based on the query model of rasdaman.

2016 - ISO SQL/MDA specification finished.

... plus inbetween [a couple of innovation awards](http://kahlua.eecs.jacobs-university.de/~lsis/#awards).

Q: What does the rasdaman project's community look like? How can interested people help?

Discussion & contribution is possible (and actively pursued) through the
rasdaman-dev and rasdaman-users [mailing lists](http://www.rasdaman.org/wiki/MailingLists). Everybody is invited to
contribute (going through rigorous quality checking, though), and contributions are
acknowledged visibly in the commit logs (e.g., we refuse to submit patches on
behalf of others). We had and have external contributors, the farthest from New
Zealand.

Q: Which new features can we expect this year in rasdaman?

  * The prototypical coupling with Python and R will be ruggedized and become
    officially released.
  * Support for the new features in the OGC Coverage Implementation Schema 1.1 being
    finalized in OGC, a lot of interesting stuff.
    Being INSPIRE WCS reference implementation we will need to see how to adjust to
    the INSPIRE particularities (they have some deviations from OGC and are not
    clear yet whether to align or not).
  * We will support the SQL/MDA standard (it has some syntactic deviations from the
    rasdaman QL); currently we have a feasibility study, but we want to couple with
    arbitrary relational systems through a mediator layer. This is part of a PhD thesis.
  * Embedded in the RDA Array Database Assessment Working Group we will conduct
    comparative benchmarks (rasdaman, PostGIS Raster, Spark, SciDB, ...).
  * On longer terms, we will need to look into self-* techniques for easing
    administration.

...plus likely more, in response to data center needs expressed (such as from
planetserver.eu).

Q: Have you enjoyed previous FOSDEM editions?

Indeed, I participated in and enjoyed FOSDEM 2015 where I reported on the OGC
coverage standards.
