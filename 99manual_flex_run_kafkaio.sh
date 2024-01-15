#!/usr/bin/env bash
set -x

source "$(dirname $0)/cicd_config.sh"

# Run the Flex Template.
gcloud dataflow flex-template run \
     ${KAFKAIO_JOB_NAME} \
    --template-file-gcs-location ${KAFKAIO_TEMPLATE_FILE_GCS_PATH} \
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
    --parameters "outputTableSpec=${KAFKAIO_outputTableSpec}" \
    --parameters "inputTopics=${KAFKAIO_inputTopics}" \
    --parameters "bootstrapServers=${KAFKAIO_bootstrapServers}"
