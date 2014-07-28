#!/bin/bash
PRIORITY=10
FINAL_NAME="${project.build.finalName}"
NORIKRA_DIRNAME=${PARCEL_DIRNAME:-$FINAL_NAME}

if [[ "$1" == "activate" ]]; then
  update-alternatives --install /usr/bin/jruby jruby $PARCELS_ROOT/$NORIKRA_DIRNAME/bin/jruby $PRIORITY
  update-alternatives --install /usr/bin/norikra norikra $PARCELS_ROOT/$NORIKRA_DIRNAME/bin/norikra $PRIORITY
  update-alternatives --install /usr/bin/norikra-client norikra-client $PARCELS_ROOT/$NORIKRA_DIRNAME/bin/norikra-client $PRIORITY

elif [[ "$1" == "deactivate" ]]; then
  update-alternatives --remove jruby $PARCELS_ROOT/$NORIKRA_DIRNAME/bin/jruby
  update-alternatives --remove norikra $PARCELS_ROOT/$NORIKRA_DIRNAME/bin/norikra
  update-alternatives --remove norikra-client $PARCELS_ROOT/$NORIKRA_DIRNAME/bin/norikra-client

fi