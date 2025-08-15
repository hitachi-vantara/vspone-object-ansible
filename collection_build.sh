#!/bin/bash

#ANSIBLE_VSP_ONE_OBJECT_VERSION="1.0.0"
#ANSIBLE_VSP_ONE_OBJECT_NAME="hitachivantara-vspone_object-ansible"
#ANSIBLE_MODULES_FOLDER_NAME="HV_Object_Ansible_Modules"
#SCRIPT_PATH="${BASH_SOURCE}"
#while [ -L "${SCRIPT_PATH}" ]; do
#  SCRIPT_DIR="$(cd -P "$(dirname "${SCRIPT_PATH}")" >/dev/null 2>&1 && pwd)"
#  SCRIPT_PATH="$(readlink "${SCRIPT_PATH}")"
#  [[ ${SCRIPT_PATH} != /* ]] && SCRIPT_PATH="${SCRIPT_DIR}/${SCRIPT_PATH}"
#done
#SCRIPT_PATH="$(readlink -f "${SCRIPT_PATH}")"
#SCRIPT_DIR="$(cd -P "$(dirname -- "${SCRIPT_PATH}")" >/dev/null 2>&1 && pwd)"
#ROOT_DIR=${SCRIPT_DIR}/..

rm -rf /$HOME/.ansible/collections/ansible_collections/hitachivantara/vspone_object

set -x

# Get the directory containing the galaxy.yml file
COLLECTION_DIR=$(dirname galaxy.yml)

rm -rf "$COLLECTION_DIR"/*.tar.gz

# Create a directory and CHECK if all the files including generated the below files exists or not before copying into tar.gz file
#mkdir -p ${ANSIBLE_MODULES_FOLDER_NAME}
#cd ${ANSIBLE_MODULES_FOLDER_NAME}
#echo "CHECK if all the files including generated the below files exists or not before copying into tar.gz file"
#ls -lrtha 
#cp -rf ${SCRIPT_DIR}/install.sh .
#cp -rf ${SCRIPT_DIR}/uninstall.sh .
#cp -rf ${ROOT_DIR}/version.txt .

# Build the collection
ansible-galaxy collection build "$COLLECTION_DIR" --force


# Get the name of the tar.gz file
COLLECTION_FILE=$(ls -t "$COLLECTION_DIR"/*.tar.gz | head -1)

# Output the name of the tar.gz file
echo "Collection file created: $COLLECTION_FILE"

# Install the collection on test bed
ansible-galaxy collection install "$COLLECTION_FILE" --force
# rm -f "$COLLECTION_FILE"

# Uninstall the collection from test bed because "ansible-galaxy [core 2.16.3]" does not have command "ansible-galaxy collection remove "
# rm -rf /$HOME/.ansible/collections/ansible_collections/hitachivantara/vspone_object


