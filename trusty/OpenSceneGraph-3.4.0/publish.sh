#!/usr/bin/env bash
curl -T openscenegraph_3.4.0_amd64.deb -u$BINTRAY_CRED "https://api.bintray.com/content/jasonbeverage/pelicanmapping/openscenegraph/3.4.0/pool/main/m/openscenegraph/openscenegraph_3.4.0_amd64.deb;deb_distribution=trusty;deb_component=main;deb_architecture=amd64;publish=1"