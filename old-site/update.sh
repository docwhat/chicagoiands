#!/bin/bash

set -eu

cd "$(dirname "$0")"

for i in stories schedule; do
    echo "Updating ${i}..."
    curl -s -n https://zope.gerf.org/chicagoiands/${i}/export_xml | xml fo -C | perl -p -e 's/\s+$/\n/g' >| ${i}.xml
done

# EOF