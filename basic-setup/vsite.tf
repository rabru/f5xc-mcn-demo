resource "volterra_virtual_site" "sentence-frontend" {
  name      = "sentence-frontend-vs"
  namespace = var.namespace

  site_selector {
    expressions = ["${null_resource.label_frontend.triggers.name} = frontend"]
  }
  site_type = "CUSTOMER_EDGE"
}

resource "volterra_virtual_site" "sentence-backend" {
  name      = "sentence-backend-vs"
  namespace = var.namespace

  site_selector {
    expressions = ["${null_resource.label_backend.triggers.name} = backend"]
  }
  site_type = "CUSTOMER_EDGE"
}

resource "volterra_virtual_site" "sentence-full" {
  name      = "sentence-full-vs"
  namespace = var.namespace

  site_selector {
    expressions = ["${null_resource.label_full.triggers.name} = full"]
  }
  site_type = "CUSTOMER_EDGE"
}

resource "volterra_virtual_k8s" "kubernetes" {
  name      = "vk8s"
  namespace = var.namespace

  vsite_refs {
    name = volterra_virtual_site.sentence-frontend.name
  }
  vsite_refs {
    name = volterra_virtual_site.sentence-backend.name
  }
  vsite_refs {
    name = volterra_virtual_site.sentence-full.name
  }
}

