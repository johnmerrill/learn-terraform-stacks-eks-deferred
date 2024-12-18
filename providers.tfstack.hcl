# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.59.0"
  }
  kubernetes = {
    source  = "hashicorp/kubernetes"
    version = "~> 2.32.0"
  }
  random = {
    source = "hashicorp/random"
    version = "~> 3.6.2"
  }
}

provider "aws" "main" {
  config {
    region = var.region

    access_key = var.access_key
    secret_key = var.secret_key
    token = var.session_token

    default_tags {
      tags = var.default_tags
    }
  }
}

provider "kubernetes" "main" {
  config {
    host                   = component.cluster.cluster_url
    cluster_ca_certificate = component.cluster.cluster_ca
    token                  = component.cluster.cluster_token
  }
}

provider "random" "main" {}
