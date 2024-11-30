# gcp-container-run

I followed this vieo:
https://www.youtube.com/watch?v=sqUuofLBfFw

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

The command `gcloud auth configure-docker`  configures your Docker CLI to use Google Cloud credentials for accessing Google Artifact Registry and Google Container Registry (GCR). This allows you to push and pull Docker images stored in these registries using your Google Cloud account.

`gcloud auth configure-docker` 

This build the container in your repository

`gcloud builds submit --tag us-east1-docker.pkg.dev/todocontainer/todo-repo/todo-container:latest`

Used this to check if the image added
`gcloud artifacts docker images list us-east1-docker.pkg.dev/todocontainer/todo-repo`

Now we need to go to Cloud Run and start up a service.

`https://console.cloud.google.com/run?referrer=search&project=todocontainer`

Then you can access the container from a provided url. 

