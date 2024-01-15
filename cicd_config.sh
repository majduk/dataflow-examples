export PROJECT_ID="erste-sandbox1"
export REGION="us-central1"
export TEMPLATE_BUCKET="tmp-dir-bucket-961511f4"
export TEMP_BUCKET="eaut-bl-df-tmp-0"

export TEXTIO_MAIN_CLASS="org.example.beam.TextIOToBigQuery"
export TEXTIO_JOB_NAME="eaut-bl-df-textio-0"
export KAFKAIO_MAIN_CLASS="org.example.beam.KafkaToBigQuery"
export KAFKAIO_JOB_NAME="eaut-bl-df-kafka-0"
export DF_TEMP_LOCATION="gs://${TEMP_BUCKET}/temp"
export DF_NETWORK="https://www.googleapis.com/compute/v1/projects/${PROJECT_ID}/global/networks/dataflow-network"
export DF_SUBNETWORK="https://www.googleapis.com/compute/v1/projects/${PROJECT_ID}/regions/${REGION}/subnetworks/dataflow-subnetwork"
export DF_WORKER_MACHINE_TYPE="n1-standard-1"
export DF_DATAFLOW_SA="dataflow-sa@${PROJECT_ID}.iam.gserviceaccount.com"
export DF_CONTROLLER_SA="automation-sa@${PROJECT_ID}.iam.gserviceaccount.com"

#Application Parameters for manual run - TextIO
export TEXTIO_inputFilePattern="gs://${TEMPLATE_BUCKET}/input/person.csv"
export TEXTIO_javascriptTextTransformFunctionName="transform"
export TEXTIO_javascriptTextTransformGcsPath="gs://${TEMPLATE_BUCKET}/config/person_udf.js"
export TEXTIO_JSONPath="gs://${TEMPLATE_BUCKET}/config/person_schema.json"
export TEXTIO_bigQueryLoadingTemporaryDirectory="gs://${TEMPLATE_BUCKET}/temp"
export TEXTIO_outputTable="${PROJECT_ID}:eaut_bl_bq_0.person"

#Application Parameters for manual run - KafkaIO
export KAFKAIO_outputTableSpec="${PROJECT_ID}:eaut_bl_bq_0.person"
export KAFKAIO_inputTopics="my-topic"
export KAFKAIO_bootstrapServers="10.0.0.14:9096"

#Template Parameters
export TEXTIO_TEMPLATE_NAME="GCS_Text_to_BigQuery"
export KAFKAIO_TEMPLATE_NAME="Kafka_to_BigQuery"
export TEXTIO_TEMPLATE_FILE_GCS_PATH="gs://${TEMPLATE_BUCKET}/templates/${TEXTIO_TEMPLATE_NAME}"
export KAFKAIO_TEMPLATE_FILE_GCS_PATH="gs://${TEMPLATE_BUCKET}/templates/flex/${KAFKAIO_TEMPLATE_NAME}"
export TEXTIO_IMAGE_GCR_PATH="us.gcr.io/${PROJECT_ID}/flex/${TEXTIO_TEMPLATE_NAME}:latest"
export KAFKAIO_IMAGE_GCR_PATH="us.gcr.io/${PROJECT_ID}/flex/${KAFKAIO_TEMPLATE_NAME}:latest"
export FLEX_TEMPLATE_BASE_IMAGE="JAVA17"
export FLEX_BUILD_LOGDIR="gs://${TEMP_BUCKET}/flex-logs/"
export FLEX_TEMP_LOCATION="gs://${TEMP_BUCKET}/temp"

