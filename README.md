This is a helper made for filthy Windows operators.

You will need to supply these environment variables:

`KOPS_STATE_STORE` - This will look something like `s3://my-bucket-name-with-configs`

`AWS_ACCESS_KEY_ID` - Hopefully self explanatory

`AWS_SECRET_ACCESS_KEY` - Hopefully self explanatory

`KUBE_NAME` - This is the name of the cluster made by kops, or more specifically the first level "folder" of your config storage bucket.

You'll want to mount a local volume so that kops will modify/create a kube config. This is done with `-v localfolder:/kube`

An example command would look like:

`docker run -e KOPS_STATE_STORE=s3://mybucket-name-with-configs -e AWS_ACCESS_KEY_ID=WAAAAGH -e AWS_SECRET_ACCESS_KEY=WAAAAAGHARDER -e KUBE_NAME=mykube.domain.com -v c:\Users\filthyops\.kube:/kube ccpgames/kops-kubecfg`

For China you will need to add the region with `-e AWS_REGION=cn-north-1`