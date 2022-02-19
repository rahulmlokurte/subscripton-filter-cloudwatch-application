data "template_file" "lambda_assume_role_policy" {
  template = file("${path.module}/template/lambda_assume_role_policy.json")
}

data "aws_partition" "current" {}