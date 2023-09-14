
variable "rule_name" {
  description = "Name of the CloudWatch Event rule"
  type        = string
  default     = "myrules"
}

variable "email_endpoint" {
  description = "Email endpoint for incident alerting"
  type        = string
  default     = "movvamanoj@gmail.com"
}
variable "slack_endpoint" {
  description = "Slack endpoint for incident alerting"
  type        = string
  default     = "https://hooks.slack.com/services/YOUR_SLACK_WEBHOOK_URL"
}