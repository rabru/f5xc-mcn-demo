#    frontend     #     
###################
resource "volterra_origin_pool" "sentence-frontend-full-pool" {
  name                   = "sentence-frontend-full-pool"
  namespace              = var.namespace
 
  origin_servers {
    k8s_service {
      // One of the arguments from this list "inside_network outside_network vk8s_networks" must be set
      service_name   = "sentence-frontend-nginx.${var.namespace}"
      vk8s_networks = true

      site_locator {
        // One of the arguments from this list "site virtual_site" must be set

        virtual_site {
          name      = "sentence-full-vs"
          namespace = var.namespace
        }
      }
    }
    labels = {
    }
  }

  no_tls = false
  //port = "80"
  automatic_port = true
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"

}


resource "volterra_origin_pool" "sentence-frontend-only-pool" {
  name                   = "sentence-frontend-only-pool"
  namespace              = var.namespace

  origin_servers {
    k8s_service {
      // One of the arguments from this list "inside_network outside_network vk8s_networks" must be set
      service_name   = "sentence-frontend-nginx.${var.namespace}"
      vk8s_networks = true

      site_locator {
        // One of the arguments from this list "site virtual_site" must be set

        virtual_site {
          name      = "sentence-frontend-vs"
          namespace = var.namespace
        }
      }
    }
    labels = {
    }
  }

  no_tls = false
  //port = "80"
  automatic_port = true
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"

}

resource "volterra_http_loadbalancer" "sentence-full-lb" {
  name      = "sentence-full-lb"
  namespace = var.namespace

  domains = ["sentence-full.${var.namespace}.${var.delegated_domain}"]
  http {
    dns_volterra_managed = true
    port                 = 80
  }

  advertise_on_public_default_vip = true

  default_route_pools {
    pool {
      name = volterra_origin_pool.sentence-frontend-full-pool.name
      namespace = var.namespace
    }
    weight   = 1
    priority = 1
  }

  //End of mandatory "VIP configuration"
  //Mandatory "Security configuration"
  no_service_policies = true
  no_challenge = true
  disable_rate_limit = true
  disable_waf = true
  //End of mandatory "Security configuration"
  //Mandatory "Load Balancing Control"
  round_robin = true
  //End of mandatory "Load Balancing Control"
  add_location           = true
}


resource "volterra_http_loadbalancer" "sentence-fo-lb" {
  name      = "sentence-fo-lb"
  namespace = var.namespace

  domains = ["sentence-fo.${var.namespace}.${var.delegated_domain}"]
  http {
    dns_volterra_managed = true
    port                 = 80
  }

  advertise_on_public_default_vip = true

  default_route_pools {
    pool {
      name = volterra_origin_pool.sentence-frontend-only-pool.name
      namespace = var.namespace
    }
    weight   = 1
    priority = 1
  }

  //End of mandatory "VIP configuration"
  //Mandatory "Security configuration"
  no_service_policies = true
  no_challenge = true
  disable_rate_limit = true
  disable_waf = true
  //End of mandatory "Security configuration"
  //Mandatory "Load Balancing Control"
  round_robin = true
  //End of mandatory "Load Balancing Control"
  add_location           = true
}

resource "volterra_http_loadbalancer" "sentence-all-lb" {
  name      = "sentence-all-lb"
  namespace = var.namespace

  domains = ["sentence-all.${var.namespace}.${var.delegated_domain}"]
  http {
    dns_volterra_managed = true
    port                 = 80
  }

  advertise_on_public_default_vip = true

  default_route_pools {
    pool {
      name = volterra_origin_pool.sentence-frontend-full-pool.name
      namespace = var.namespace
    }
    weight   = 1
    priority = 1
  }

  default_route_pools {
    pool {
      name = volterra_origin_pool.sentence-frontend-only-pool.name
      namespace = var.namespace
    }
    weight   = 1
    priority = 1
  }

  //End of mandatory "VIP configuration"
  //Mandatory "Security configuration"
  no_service_policies = true
  no_challenge = true
  disable_rate_limit = true
  disable_waf = true
  //End of mandatory "Security configuration"
  //Mandatory "Load Balancing Control"
  round_robin = true
  //End of mandatory "Load Balancing Control"
  add_location           = true
}

