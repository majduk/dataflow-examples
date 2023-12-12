#!/usr/bin/env bash
set -x

source "$(dirname $0)/cicd_config.sh"

mvn -Pdataflow-runner compile exec:java \
    -Dexec.mainClass=${DF_MAIN_CLASS} \
    -Dexec.args="--project=${PROJECT_ID} \
    --impersonateServiceAccount=${DF_CONTROLLER_SA} \
    --serviceAccount=${DF_DATAFLOW_SA} \
    --jobName=${DF_JOB_NAME} \
    --runner=DataflowRunner \
    --region=${REGION} \
    --tempLocation=${DF_TEMP_LOCATION}\
    --network=${DF_NETWORK} \
    --subnetwork=${DF_SUBNETWORK} \
    --usePublicIps=false \
    --workerMachineType=${DF_WORKER_MACHINE_TYPE} \
    --inputFilePattern=${APP_inputFilePattern} \
    --javascriptTextTransformFunctionName=${APP_javascriptTextTransformFunctionName} \
    --javascriptTextTransformGcsPath=${APP_javascriptTextTransformGcsPath} \
    --outputTable=${APP_outputTable} \
    --bigQueryLoadingTemporaryDirectory=${APP_bigQueryLoadingTemporaryDirectory} \
    --JSONPath=${APP_JSONPath}"
