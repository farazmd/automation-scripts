#!/bin/bash

# This script holds bash functions to help with terraform.


function get_terraform(){
    TF_VERSION=$1
    curl -fsSL -O https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
    unzip terraform_${TF_VERSION}_linux_amd64.zip
    chmod u+x ./terraform
    echo "Terraform downloaded at `pwd`"
}

function terraform_set_path(){
    TERRAFORM_PATH=$1
    export PATH="$TERRAFORM_PATH:$PATH"
}

function terraform_init(){
    terraform init
}

function terraform_s3_init() {
    bucket=$1
    key=$2
    region=$3
    terraform init \
        -backend-config="bucket=${bucket}" \
        -backend-config="key=${key}" \
        -backend-config="region=${region}"
}

function terraform_plan() {
    terraform plan "$@"
}

function terraform_apply() {
    terraform apply --auto-approve "$@"
}

function terraform_destroy() {
    terraform destroy --auto-approve
}