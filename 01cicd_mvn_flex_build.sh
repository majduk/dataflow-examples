#!/usr/bin/env bash
set -x

source "$(dirname $0)/cicd_config.sh"

# Build the Flex Template.
mvn clean package -PtemplatesStage  \
	-DskipTests \
	-DprojectId="$PROJECT_ID" \
	-DbucketName="$FLEX_TEMPLATE_BUCKET" \
	-DstagePrefix="templates" \
	-DtemplateName="$FLEX_TEMPLATE_NAME" 


