resource "null_resource" "label_key" {
  triggers = {
    tenant = var.tenant
    name   = "${var.namespace}.sentence"
    token  = volterra_api_credential.api-token.data
  }
  # create label key
  provisioner "local-exec" {
    command = <<-EOF
#!/bin/bash
echo "Apply ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label_key/create \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}"}'
EOF
  }

  #  destroy label key
  provisioner "local-exec" {
    when = destroy
    command = <<-EOF
#!/bin/bash
echo "Destroy ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label_key/delete \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}"}'
EOF 
  }
}


resource "null_resource" "label_frontend" {
  depends_on = [null_resource.label_key]
  triggers = {
    tenant = var.tenant
    name = "${var.namespace}.sentence"
    token  = volterra_api_credential.api-token.data
  }

  # create label key
  provisioner "local-exec" {
    command = <<-EOF
#!/bin/bash
echo "Apply ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/create \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "frontend"}'
EOF
  }

  #  destroy label key
  provisioner "local-exec" {
    when = destroy
    command = <<-EOF
#!/bin/bash
echo "Destroy ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/delete \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "frontend"}'
EOF
  }
}


resource "null_resource" "label_backend" {
  depends_on = [null_resource.label_key]
  triggers = {
    tenant = var.tenant
    name = "${var.namespace}.sentence"
    token  = volterra_api_credential.api-token.data
  }

  # create label key
  provisioner "local-exec" {
    command = <<-EOF
#!/bin/bash
echo "Apply ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/create \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "backend"}'
EOF
  }

  #  destroy label key
  provisioner "local-exec" {
    when = destroy
    command = <<-EOF
#!/bin/bash
echo "Destroy ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/delete \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "backend"}'
EOF
  }
}

resource "null_resource" "label_full" {
  depends_on = [null_resource.label_key]
  triggers = {
    tenant = var.tenant
    name = "${var.namespace}.sentence"
    token  = volterra_api_credential.api-token.data
  }

  # create label key
  provisioner "local-exec" {
    command = <<-EOF
#!/bin/bash
echo "Apply ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/create \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "full"}'
EOF
  }

  #  destroy label key
  provisioner "local-exec" {
    when = destroy
    command = <<-EOF
#!/bin/bash
echo "Destroy ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/delete \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "full"}'
EOF
  }
}

resource "null_resource" "label_none" {
  depends_on = [null_resource.label_key]
  triggers = {
    tenant = var.tenant
    name = "${var.namespace}.sentence"
    token  = volterra_api_credential.api-token.data
  }

  # create label key
  provisioner "local-exec" {
    command = <<-EOF
#!/bin/bash
echo "Apply ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/create \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "none"}'
EOF
  }

  #  destroy label key
  provisioner "local-exec" {
    when = destroy
    command = <<-EOF
#!/bin/bash
echo "Destroy ------------------- "
curl -k -X POST https://${self.triggers.tenant}.console.ves.volterra.io/api/config/namespaces/shared/known_label/delete \
  -H "content-type: application/json" -H "Authorization: APIToken ${self.triggers.token}" \
  -d '{"key": "${self.triggers.name}", "value": "none"}'
EOF
  }
}

