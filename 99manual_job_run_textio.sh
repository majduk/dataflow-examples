#!/usr/bin/env bash
set -x

source "$(dirname $0)/cicd_config.sh"

# Run the Flex Template.
gcloud dataflow jobs run \
     ${TEXTIO_JOB_NAME} \
    --gcs-location ${TEXTIO_TEMPLATE_FILE_GCS_PATH} \
    --project ${PROJECT_ID} \
    --region ${REGION} \
    --impersonate-service-account ${DF_CONTROLLER_SA} \
    --network=${DF_NETWORK} \
    --subnetwork=${DF_SUBNETWORK} \
    --disable-public-ips \
    --service-account-email=${DF_DATAFLOW_SA} \
    --staging-location=${DF_TEMP_LOCATION} \
    --worker-region=${REGION} \
    --worker-machine-type=${DF_WORKER_MACHINE_TYPE} \
    --parameters "inputFilePattern=${TEXTIO_inputFilePattern}" \
    --parameters "JSONPath=${TEXTIO_JSONPath}" \
    --parameters "outputTable=${TEXTIO_outputTable}" \
    --parameters "bigQueryLoadingTemporaryDirectory=${TEXTIO_bigQueryLoadingTemporaryDirectory}" \
    --parameters "javascriptTextTransformGcsPath=${TEXTIO_javascriptTextTransformGcsPath}" \
    --parameters "javascriptTextTransformFunctionName=${TEXTIO_javascriptTextTransformFunctionName}" 
