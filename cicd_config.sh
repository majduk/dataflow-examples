export PROJECT_ID="erste-sandbox1"
#export GOOGLE_APPLICATION_CREDENTIALS=automation_sa.json
export REGION="us-central1"

export DF_MAIN_CLASS="org.example.beam.TextIOToBigQuery"
export DF_TEMP_LOCATION="gs://eaut-bl-df-tmp-0/temp"
export DF_NETWORK="https://www.googleapis.com/compute/v1/projects/erste-sandbox1/global/networks/dataflow-network"
export DF_SUBNETWORK="https://www.googleapis.com/compute/v1/projects/erste-sandbox1/regions/us-central1/subnetworks/dataflow-subnetwork"
export DF_JOB_NAME="eaut-bl-df-0"
export DF_WORKER_MACHINE_TYPE="n1-standard-1"
export DF_DATAFLOW_SA="dataflow-sa@erste-sandbox1.iam.gserviceaccount.com"
export DF_CONTROLLER_SA="automation-sa@erste-sandbox1.iam.gserviceaccount.com"

#Application Parameters for manual run
export APP_inputFilePattern="gs://tmp-dir-bucket-961511f4/input/person.csv"
export APP_javascriptTextTransformFunctionName="transform"
export APP_javascriptTextTransformGcsPath="gs://tmp-dir-bucket-961511f4/config/person_udf.js"
export APP_JSONPath="gs://tmp-dir-bucket-961511f4/config/person_schema.json"
export APP_bigQueryLoadingTemporaryDirectory="gs://tmp-dir-bucket-961511f4/temp"
export APP_outputTable="erste-sandbox1:eaut_bl_bq_0.person"

#Template Parameters
export FLEX_TEMPLATE_NAME="GCS_Text_to_BigQuery"
export FLEX_TEMPLATE_BUCKET="tmp-dir-bucket-961511f4"
export FLEX_TEMPLATE_FILE_GCS_PATH="gs://${FLEX_TEMPLATE_BUCKET}/templates/${FLEX_TEMPLATE_NAME}"
export FLEX_IMAGE_GCR_PATH="us.gcr.io/erste-sandbox1/flex/${FLEX_TEMPLATE_NAME}:latest"
export FLEX_TEMPLATE_BASE_IMAGE="JAVA17"
export FLEX_BUILD_LOGDIR="gs://eaut-bl-df-tmp-0/flex-logs/"
export FLEX_TEMP_LOCATION="gs://eaut-bl-df-tmp-0/temp"
export FLEX_NETWORK="https://www.googleapis.com/compute/v1/projects/erste-sandbox1/global/networks/dataflow-network"
export FLEX_SUBNETWORK="https://www.googleapis.com/compute/v1/projects/erste-sandbox1/regions/us-central1/subnetworks/dataflow-subnetwork"

#export REPOSITORY="sample"
#
#export BUCKET="dlat_sandbox"
#
#export TEMPLATE_PATH="gs://$BUCKET/samples/dataflow/templates/coad-kafka-to-bigquery.json"
#export TEMPLATE_IMAGE="eu.gcr.io/$PROJECT_ID/samples/dataflow/coad-kafka-to-bigquery:latest"
#export SUBNETWORK_NAME=dataflow

