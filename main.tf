provider "aws" {
  region = var.aws_region
}

#Configuração do Terraform State
terraform {
  backend "s3" {
    bucket = "terraform-state-soat"
    key    = "infra-sqs/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-state-soat-locking"
    encrypt        = true
  }
}

#SQS
resource "aws_sqs_queue" "sqs_pedidos" {
  name = "sqs-pedidos"
}

resource "aws_sqs_queue" "sqs_pagamentos" {
  name = "sqs-pagamentos"
}

resource "aws_sqs_queue" "sqs_producao" {
  name = "sqs-producao"
}
