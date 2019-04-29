#!/bin/sh

# This will modify the default schema to accommodate our data.
#
# Make sure to replace the "nameOfCore" placeholder with the name of the core
# you would like to use.

# Field types

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field-type" : {
     "name":"int",
     "class":"solr.TrieIntField",
     "precisionStep": "0",
     "positionIncrementGap":"0",
  }
}' http://localhost:8983/solr/nameOfCore/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field-type" : {
     "name":"date",
     "class":"solr.TrieDateField",
     "positionIncrementGap": "0",
     "precisionStep":"0",
  }
}' http://localhost:8983/solr/nameOfCore/schema

# Fields

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"title",
     "type":"text_general",
     "indexed":"true",
     "stored":"true",
     "multiValued":"false",
     "termVectors":"true",
     "omitNorms":"false"
  }
}' http://localhost:8983/solr/nameOfCore/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"type",
     "type":"string",
     "indexed":"true",
     "stored":"true",
     "required":"true",
     "multiValued":"true",
     "omitNorms":"false",
  }
}' http://localhost:8983/solr/nameOfCore/schema


curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"content",
     "type":"text_general",
     "indexed":"true",
     "stored":"true",
     "multiValued":"false",
     "termVectors":"true",
     "omitNorms":"false"
  }
}' http://localhost:8983/solr/nameOfCore/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"interview_year",
     "type":"int",
     "indexed":true,
     "stored":true,
     "multiValued":false

  }
}' http://localhost:8983/solr/nameOfCore/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":{
     "name":"timestamp",
     "type":"date",
     "indexed":true,
     "stored":true,
     "default":"NOW",
     "multiValued":false
  }
}' http://localhost:8983/solr/nameOfCore/schema

# Copy fields

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"content",
     "dest":"_text_"}
}' http://localhost:8983/solr/nameOfCore/schema

curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-copy-field":{
     "source":"title",
     "dest":"_text_"}
}' http://localhost:8983/solr/nameOfCore/schema
