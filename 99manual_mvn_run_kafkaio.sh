#!/usr/bin/env bash
set -x

source "$(dirname $0)/cicd_config.sh"

mvn -Pdataflow-runner compile exec:java \
    -Dexec.mainClass=${KAFKAIO_MAIN_CLASS} \
    -Dexec.args="--project=${PROJECT_ID} \
    --impersonateServiceAccount=${DF_CONTROLLER_SA} \
    --serviceAccount=${DF_DATAFLOW_SA} \
    --jobName=${KAFKAIO_JOB_NAME} \
    --runner=DataflowRunner \
    --region=${REGION} \
    --tempLocation=${DF_TEMP_LOCATION}\
    --network=${DF_NETWORK} \
    --subnetwork=${DF_SUBNETWORK} \
    --usePublicIps=false \
    --workerMachineType=${DF_WORKER_MACHINE_TYPE} \
    --outputTableSpec=${KAFKAIO_outputTableSpec} \
    --inputTopics=${KAFKAIO_inputTopics} \
    --bootstrapServers=${KAFKAIO_bootstrapServers}"
