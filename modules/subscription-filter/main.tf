resource "aws_lambda_permission" "subscription_filter_aws_lambda_permission" {
  action        = "lambda:InvokeFunction"
  function_name = var.odd_parity_collector_function_lambda_name
  principal     = "logs.${data.aws_region.current.name}.amazonaws.com"
  source_arn    = var.parity_function_aws_cloudwatch_log_group_arn
}