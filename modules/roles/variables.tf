variable "lambda_role_list" {
  description = "List of AWS Managed IAM policies to attach to LambdaRole. Note: Service Roles need to include 'service-role/`"
  type        = list(string)
  default = [
    "service-role/AWSLambdaBasicExecutionRole"
  ]
}