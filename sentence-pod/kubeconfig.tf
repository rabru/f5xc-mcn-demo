resource "volterra_api_credential" "vk8s" {
  name                  = "${var.namespace}-kubeconfig"
  api_credential_type   = "KUBE_CONFIG"
  virtual_k8s_namespace = var.namespace
  virtual_k8s_name      = "vk8s"
  expiry_days           = 2
}

resource "local_file" "kubeconfig" {
  content  = base64decode(volterra_api_credential.vk8s.data)
  filename = pathexpand("~/.kube/config")
}

resource "local_file" "frontend" {
  content  = templatefile("frontend.tpl", { namespace = var.namespace })
  filename = "frontend.yaml"
}

resource "local_file" "backend" {
  content  = templatefile("backend.tpl", { namespace = var.namespace })
  filename = "backend.yaml"
}

