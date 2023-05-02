variable "email" {
  type = string
}

variable "tenant" {
  type = string
}

variable "namespace" {
  type = string
}

variable "delegated_domain" {
  type = string
}

variable "api_cert" {
  type = string
  default = "~/.f5xc/volterra.cert"
}
        
variable "api_key" {
  type = string
  default = "~/.f5xc/volterra.key"
}
        
variable "api_url" {
  type = string
  default = "https://YOUR_TENANT.console.ves.volterra.io/api"
}

variable "site_type" {
  type = string
}

variable "location" {
  type = string
}

variable "regions" {
  type = map
  default = {
  "aws-eu" = "eu-central-1"
  "aws-us" = "us-east-1"
  "aws-ap" = "ap-northeast-1"
  "az-eu"  = "francecentral"
  "az-us"  = "westus3"
  "az-ap"  = "southeastasia"
  }
}

# AWS
variable "aws_instance_type" {
  type = string
  default = "t3.xlarge"
}

variable "aws_cred" {
  type = string
}

# Azure
variable "azure_instance_type" {
  type = string
  default = "Standard_D3_v2"
}

variable "azure_cred" {
  type = string
}


