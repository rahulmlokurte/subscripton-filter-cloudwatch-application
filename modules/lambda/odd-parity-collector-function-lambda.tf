module "odd_parity_collector_function_lambda" {
  source        = "registry.terraform.io/terraform-aws-modules/lambda/aws"
  version       = "2.34.0"
  function_name = "odd-parity-collector"
  description   = "Collects logs sent by subscription filter for odd values"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  source_path   = "${path.module}/resources/odd-parity-collector-function"
  tags          = var.tags
}