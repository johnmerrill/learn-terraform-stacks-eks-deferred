# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

store "varset" "tokens" {
  id       = "varset-Afp1DkmyYfYMkHiR"
  category = "env"
}

deployment "development" {
  inputs = {
    access_key = store.varset.tokens.AWS_ACCESS_KEY_ID    
    secret_key = store.varset.tokens.AWS_SECRET_ACCESS_KEY
    session_token = store.varset.tokens.AWS_SESSION_TOKEN
    cluster_name        = "stacks-demo"
    kubernetes_version  = "1.30"
    region              = "us-east-2"
    default_tags        = { stacks-preview-example = "eks-deferred-stack" }
  }
}
