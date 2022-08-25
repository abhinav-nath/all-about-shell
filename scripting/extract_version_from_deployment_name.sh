#!/bin/bash

echo "Enter the deployment name like this - ordermanagement-1-13-0-q25a. Hit Enter to use hard-coded deployment name"
read deployment

if [ "$deployment" == "" ] ; then
	deployment=ordermanagement-1-13-0-q25a
fi

echo "Deployment - $deployment"

IFS='-' read -r -a deployment_parts <<< "$deployment"

echo "version - ${deployment_parts[1]}.${deployment_parts[2]}.${deployment_parts[3]}"
