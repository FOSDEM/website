#!/bin/sh

DATATABLES=2.3.4
FIXEDHEADER=4.0.4
JQUERY=3.7.0

rm *.js *.css

wget  \
     https://cdn.datatables.net/${DATATABLES}/css/dataTables.dataTables.min.css \
     https://cdn.datatables.net/${DATATABLES}/js/dataTables.min.js \
     https://cdn.datatables.net/fixedheader/${FIXEDHEADER}/css/fixedHeader.dataTables.min.css \
     https://cdn.datatables.net/fixedheader/${FIXEDHEADER}/js/dataTables.fixedHeader.min.js \
     https://code.jquery.com/jquery-${JQUERY}.min.js \
     https://cdn.datatables.net/plug-ins/${DATATABLES}/features/mark.js/datatables.mark.min.css \
     https://cdn.datatables.net/plug-ins/${DATATABLES}/features/mark.js/datatables.mark.js \
     "https://cdn.jsdelivr.net/g/mark.js(jquery.mark.min.js)"
