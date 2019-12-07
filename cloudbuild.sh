PROJECT_ID="htmrt-260621" 
TRIGGER_ID_BKEDEV="dd59cc3b-94cd-49f6-8ef3-0d719f82a668"; 
TRIGGER_ID_FENDEV="4da0566b-abf2-42bc-a37c-99093309c336"; 
TRIGGER_ID_BKEPRD="1233e2e8-d691-4ed4-8f12-4847efbc3022"; 
TRIGGER_ID_FENPRD="cddba766-7d68-4196-8f25-8e2754bcc9ab"; 

curl -X POST -T terraform/key/htmrt-terraform-sa.json -H "Authorization: Bearer $(gcloud config config-helper \
    --format='value(credential.access_token)')" \
    https://cloudbuild.googleapis.com/v1/projects/"$PROJECT_ID"/triggers/"$TRIGGER_ID_BKEDEV":run

curl -X POST -T terraform/key/htmrt-terraform-sa.json -H "Authorization: Bearer $(gcloud config config-helper \
    --format='value(credential.access_token)')" \
    https://cloudbuild.googleapis.com/v1/projects/"$PROJECT_ID"/triggers/"$TRIGGER_ID_FENDEV":run

curl -X POST -T terraform/key/htmrt-terraform-sa.json -H "Authorization: Bearer $(gcloud config config-helper \
    --format='value(credential.access_token)')" \
    https://cloudbuild.googleapis.com/v1/projects/"$PROJECT_ID"/triggers/"$TRIGGER_ID_BKEPRD":run

curl -X POST -T terraform/key/htmrt-terraform-sa.json -H "Authorization: Bearer $(gcloud config config-helper \
    --format='value(credential.access_token)')" \
    https://cloudbuild.googleapis.com/v1/projects/"$PROJECT_ID"/triggers/"$TRIGGER_ID_FENPRD":run