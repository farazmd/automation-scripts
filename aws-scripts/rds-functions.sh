#!/bin/bash

# Bash scripts that contains functions related to AWS RDS

function rds_create_snapshot() {
    db_instance=$1
    db_snapshot=$2
    tags="${@:3}"

    aws rds create-db-snapshot \
        --db-snapshot-identifier $db_instance \
        --db-instance-identifier $db_snapshot \
        --tags $tags
}

function rds_wait_for_snapshot_available(){
    db_snapshot=$1
    aws rds wait db-snapshot-available \
        ----db-snapshot-identifier $db_snapshot
}

function echo_this() {
    echo $1 \
        $2 \
        $3
}