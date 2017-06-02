#!/bin/bash

##############################################
#  Effectue un git pull sur tout les dépôts  #
##############################################

#Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
#Absolute path this script is in, thus /home/user/bin
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH
echo "Updating main repository..."
git pull

cd $SCRIPT_PATH/beaglebone_external/package
#on effectue un pull pour chaque package
for projectdir in */; do
	echo "Updating package $projectdir"
	cd $SCRIPT_PATH/beaglebone_external/package/$projectdir
	git pull
done

echo "Update done!"
