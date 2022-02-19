resource "aws_iam_role" "lambda_role" {
  name                  = "lambda-role"
  assume_role_policy    = data.template_file.lambda_assume_role_policy.rendered
  force_detach_policies = true
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy_attachment" {
  count      = length(var.lambda_role_list)
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/${var.lambda_role_list[count.index]}"
  role       = aws_iam_role.lambda_role.name
}