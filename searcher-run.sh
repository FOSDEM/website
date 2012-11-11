#!/bin/sh
set -e
cd ./search/searcher
rackup --env development ./dev.ru
