#!/bin/sh

set -ex

terraform init -no-color
terraform "${@}"
