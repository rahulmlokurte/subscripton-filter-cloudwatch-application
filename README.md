# Cloudwatch logs to lambda function using subscription filter with Terraform

This repository consist of a parity lambda function which check weather the number is odd or even. 
Odd-parity lambda function is used to consume the logs where number is odd. Subscription filter will be used 
to consume the logs from parity lambda function to trigger odd-parity lambda function.

![subscription-filter](https://github.com/rahulmlokurte/subscripton-filter-cloudwatch-application/blob/main/images/subscription-filter-cw-lambda-1.png?raw=true)

## Run the application

- Clone the [subscription-filter-cloudwatch-application](https://github.com/rahulmlokurte/subscripton-filter-cloudwatch-application)
- Run the following commands in sequence to deploy the application using Terraform.
  - `terraform init`
  - `terraform plan -out output.plan`
  - `terraform apply "output.plan"`

## Resources Deployed:

- It will deploy two lambda functions `parity-function` and `odd-parity-collector`
- It will create the IAM role `lambda-role`
- It will create a subscription-filter `subscription-filter-cw-lambda`