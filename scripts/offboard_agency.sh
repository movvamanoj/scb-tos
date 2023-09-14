#!/bin/bash

terraform init
terraform destroy -auto-approve -target=module.s3_bucket -target=module.lambda_function -target=module.cloudwatch_event_rule
