#!/bin/bash

# This script holds bash functions to help with terraform.



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