# Create CloudWatch event rule
resource "aws_cloudwatch_event_rule" "main" {
  name        = var.rule_name
  description = "Rule to detect S3 upload failures"
  schedule_expression = "rate(1 day)"  

  event_pattern = jsonencode({
    "source": ["aws.s3"],
    "detail-type": ["AWS API Call via CloudTrail"],
    "detail": {
      "eventSource": ["s3.amazonaws.com"],
      "eventName": ["PutObject"],
      "errorCode": ["NoSuchKey"]
       "requestParameters": {
        "key": [
          "*.csv",
          "*.xlsx",
          "*.json"
        ]
      }
    }
  })
}

# Create CloudWatch event target
resource "aws_cloudwatch_event_target" "s3_upload_failure_target" {
  rule = aws_cloudwatch_event_rule.main.name
  arn  = aws_sns_topic.file_upload_failure_topic.arn

}

# Create SNS topic for file upload failure notifications
resource "aws_sns_topic" "file_upload_failure_topic" {
  name = "file-upload-failure-topic"
}

# Create SNS topic subscription for incident alerts (email)
resource "aws_sns_topic_subscription" "file_upload_failure_email_subscription" {
  topic_arn = aws_sns_topic.file_upload_failure_topic.arn
  protocol  = "email"
  endpoint  = var.email_endpoint
}
# Create SNS topic subscription for incident alerts (Slack)
#resource "aws_sns_topic_subscription" "incident_alert_slack_subscription" {
#  topic_arn = aws_sns_topic.incident_alert_topic.arn
#  protocol  = "https"
#  endpoint  = var.slack_endpoint
#}