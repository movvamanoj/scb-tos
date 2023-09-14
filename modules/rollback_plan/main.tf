resource "null_resource" "rollback" {
  triggers = {
    s3_bucket_name = var.bucket_name
    function_name  = var.function_name
    rule_name      = var.rule_name
  }

  provisioner "local-exec" {
    command = <<EOF
#!/bin/bash

terraform destroy -auto-approve -target=module.s3_bucket
terraform destroy -auto-approve -target=module.lambda_function
terraform destroy -auto-approve -target=module.cloudwatch_event_rule
EOF
  }
}

