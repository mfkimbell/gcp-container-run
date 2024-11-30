# gcp-container-run

Google Cloud CLI

`https://cloud.google.com/sdk/docs/install`

I had to run the `.tar` file and then move that into the Home directory.

For a permanent setup, you should edit your shell configuration file and add the export line manually.

run `nano ~/.zshrc`

Add the following line

`export PATH=$PATH:~/google-cloud-sdk/bin`

The /bin folder in most software installations traditionally holds executables or scripts meant to be run directly from the command line.

You then run `gcloud init`

`gcloud projects list` shows the available projects

`gcloud config set project <PROJECT_ID>` to activate a project

`gcloud config get-value project` this will check if it's active

You need to have cloud build and cloud run enabled. You can use the CLI, but I recommend using the GUI. 

You need to go to `Google Artifact Registry`: `https://console.cloud.google.com/artifacts?referrer=search&folder=&hl=en&inv=1&invt=Abi1Ug&organizationId=&project=todocontainer`



