#!/usr/bin/env bash
set -x

source "$(dirname $0)/cicd_config.sh"

# Run the Flex Template.
gcloud dataflow jobs run \
     ${DF_JOB_NAME} \
    --gcs-location ${FLEX_TEMPLATE_FILE_GCS_PATH} \
    --project ${PROJECT_ID} \
    --region ${REGION} \
    --impersonate-service-account ${DF_CONTROLLER_SA} \
    --network=${FLEX_NETWORK} \
    --subnetwork=${FLEX_SUBNETWORK} \
    --disable-public-ips \
    --service-account-email=${DF_DATAFLOW_SA} \
    --staging-location=${FLEX_TEMP_LOCATION} \
    --worker-region=${REGION} \
    --worker-machine-type=${DF_WORKER_MACHINE_TYPE} \
    --parameters "inputFilePattern=${APP_inputFilePattern}" \
    --parameters "JSONPath=${APP_JSONPath}" \
    --parameters "outputTable=${APP_outputTable}" \
    --parameters "bigQueryLoadingTemporaryDirectory=${APP_bigQueryLoadingTemporaryDirectory}" \
    --parameters "javascriptTextTransformGcsPath=${APP_javascriptTextTransformGcsPath}" \
    --parameters "javascriptTextTransformFunctionName=${APP_javascriptTextTransformFunctionName}" 
