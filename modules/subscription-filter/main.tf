resource "aws_lambda_permission" "subscription_filter_aws_lambda_permission" {
  action         = "lambda:InvokeFunction"
  function_name  = var.odd_parity_collector_function_lambda_name
  principal      = "logs.${data.aws_region.current.name}.amazonaws.com"
  source_arn     = "${var.parity_function_aws_cloudwatch_log_group_arn}:*"
  source_account = data.aws_caller_identity.current.account_id
}

resource "aws_cloudwatch_log_subscription_filter" "subscription_filter_aws_cloudwatch_log_subscription_filter" {
  destination_arn = var.odd_parity_collector_function_lambda_arn
  filter_pattern  = "odd"
  log_group_name  = var.parity_function_aws_cloudwatch_log_group_name
  name            = "subscription-filter-cw-lambda"
  depends_on      = [aws_lambda_permission.subscription_filter_aws_lambda_permission]
}