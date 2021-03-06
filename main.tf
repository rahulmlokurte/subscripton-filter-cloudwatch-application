terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.1"
    }
  }
}

provider "aws" {
  region                  = var.aws_region
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file
}

module "lambda" {
  source          = "./modules/lambda"
  tags            = var.tags
  lambda_role_arn = module.roles.lambda_role_arn
}

module "subscription_filter" {
  source                                        = "./modules/subscription-filter"
  odd_parity_collector_function_lambda_name     = module.lambda.odd_parity_collector_function_lambda_name
  parity_function_aws_cloudwatch_log_group_arn  = module.lambda.parity_function_aws_cloudwatch_log_group_arn
  odd_parity_collector_function_lambda_arn      = module.lambda.odd_parity_collector_function_lambda_arn
  parity_function_aws_cloudwatch_log_group_name = module.lambda.parity_function_aws_cloudwatch_log_group_name
}

module "roles" {
  source = "./modules/roles"
}