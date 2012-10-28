#!/bin/sh
set -e
SOLR_URI="http://127.0.0.1:8983/solr"

tty >/dev/null && {
    echo "ERROR: you must pipe documents into this script" >&2
    exit 1
}

echo -e "\033[31;4;1mDelete everything\033[0m"
curl -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>' "${SOLR_URI}/update"
echo

echo -e "\033[32;4;1mAdd documents from stdin\033[0m"
curl -H "Content-Type: text/xml" --data-binary @- "${SOLR_URI}/update?commit=true&optimize=true&waitFlush=true"
echo
