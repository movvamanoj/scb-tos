#!/bin/bash

terraform init
terraform apply -var "bucket_name=<bucket-name>" -var "bucket_policy=<bucket-policy>" -var "function_name=<function-name>" -var "function_code=<path-to-function-code>" -var "rule_name=<rule-name>"
