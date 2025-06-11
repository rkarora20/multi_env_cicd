terraform {
  backend "s3" {
    bucket         = "multi-env-tfstate-bucket"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "multi-env-tfstate-table"
    encrypt        = true
  }
}
