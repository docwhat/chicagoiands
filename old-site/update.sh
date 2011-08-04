#!/bin/bash

set -eux

cd "$(dirname "$0")"

curl -n https://zope.gerf.org/chicagoiands/stories/export_xml >| stories.xmx
curl -n https://zope.gerf.org/chicagoiands/schedule/export_xml >| schedule.xml

# EOF