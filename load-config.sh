#!/bin/bash

B2G_DIR=$(cd `dirname $0`; pwd)

. "$B2G_DIR/.config"
if [ $? -ne 0 ]; then
	echo Could not load .config. Did you run config.sh?
	exit -1
fi

if [ -f "$B2G_DIR/.userconfig" ]; then
	. "$B2G_DIR/.userconfig"
fi

# Use default Gecko location if it's not provided in .config / .userconfig
if [ -z $GECKO_PATH ]; then
	GECKO_PATH=$B2G_DIR/gecko
fi

# Use default build directory if not provided in .config / .userconfig
if [ -z $GECKO_OBJDIR ]; then
	GECKO_OBJDIR=$B2G_DIR/out/gecko/$DEVICE
	if [ ! -d $GECKO_OBJDIR ]; then
		mkdir -p "$GECKO_OBJDIR"
	fi
fi
