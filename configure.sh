#!/bin/bash

help="See https://github.com/ccpgames/kops-kubecfg"

: ${KOPS_STATE_STORE?"State store URL must be set. $help"}
: ${AWS_ACCESS_KEY_ID?"AWS Access Key must be set. $help"}
: ${AWS_SECRET_ACCESS_KEY?"AWS Secret Key must be set. $help"}
: ${KUBE_NAME?"Kube name must be set. $help"}

kops export kubecfg $KUBE_NAME