#!/usr/bin/env bash
#
# Build Flex Template Manually using Cloud Build.
#
set -x

source "$(dirname $0)/cicd_config.sh"

# Build the Flex Template.
gcloud dataflow flex-template build \
    ${FLEX_TEMPLATE_FILE_GCS_PATH} \
    --project ${PROJECT_ID} \
    --impersonate-service-account ${DF_CONTROLLER_SA} \
    --image-gcr-path ${FLEX_IMAGE_GCR_PATH} \
    --sdk-language "JAVA" \
    --flex-template-base-image ${FLEX_TEMPLATE_BASE_IMAGE} \
    --metadata-file "manual_metadata.json" \
    --jar "target/text-io-to-bigquery-bundled-0.1.jar" \
    --env FLEX_TEMPLATE_JAVA_MAIN_CLASS=${DF_MAIN_CLASS} \
    --gcs-log-dir ${FLEX_BUILD_LOGDIR} \
    --temp-location=${FLEX_TEMP_LOCATION} \
    --network=${FLEX_NETWORK} \
    --subnetwork=${FLEX_SUBNETWORK} \
    --disable-public-ips \
    --service-account-email=${DF_DATAFLOW_SA} \
    --staging-location=${FLEX_TEMP_LOCATION} \
    --worker-region=${REGION}



