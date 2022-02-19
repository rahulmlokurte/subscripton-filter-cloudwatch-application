module "parity_function_lambda" {
  source        = "registry.terraform.io/terraform-aws-modules/lambda/aws"
  version       = "2.34.0"
  function_name = "parity-function"
  description   = "Parity Function check whether number is even or odd"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  source_path   = "${path.module}/resources/parity-function"
  tags          = var.tags
}