#!/bin/bash

terraform init
terraform apply -target=module.rollback_plan
