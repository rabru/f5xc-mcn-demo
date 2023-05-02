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

variable "aws_cred" {
  type = string
}

variable "azure_cred" {
  type = string
}


