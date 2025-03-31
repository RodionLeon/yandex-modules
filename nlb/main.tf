resource "yandex_lb_network_load_balancer" "main" {
  description = var.description
  labels      = var.labels
  name = "${var.env}-nlb"
  folder_id = var.folder_id
  region_id = var.region_id
  type      = var.type

  dynamic "listener" {
    for_each = var.listeners
    content {
      name        = listener.value["name"]
      port        = listener.value["port"]
      target_port = listener.value["target_port"]
      protocol    = listener.value["protocol"]

    }
  }

  attached_target_group {
    target_group_id = var.target_id

    healthcheck {
      name = "http"
      http_options {
        port = 80
      }
    }
  }
  
}

resource "yandex_lb_target_group" "main" {
  count = var.create_target_group ? 1 : 0

  name        = var.name
  description = var.description
  labels      = var.labels

  region_id = var.region_id

  dynamic "target" {
    for_each = var.targets
    content {
      subnet_id = target.value["subnet_id"]
      address   = target.value["address"]
    }
  }
}
