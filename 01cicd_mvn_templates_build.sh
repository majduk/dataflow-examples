#!/usr/bin/env bash
 
# Build all the templates using Maven without Cloud Build
set -x

source "$(dirname $0)/cicd_config.sh"

# Build the Flex Template.
mvn clean package -X -e -PtemplatesStage  \
	-DskipTests \
	-DprojectId="$PROJECT_ID" \
	-DbucketName="$TEMPLATE_BUCKET" \
	-DstagePrefix="templates" \
	-DtemplateName="$1" 


