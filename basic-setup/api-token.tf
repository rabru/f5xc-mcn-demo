resource "volterra_api_credential" "api-token" {
  name                  = "${var.namespace}-api-token"
  api_credential_type   = "API_TOKEN"
  expiry_days           = 2
}

