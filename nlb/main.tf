resource "yandex_lb_network_load_balancer" "main" {
  description = var.description
  labels      = var.labels
  name      = var.name
  folder_id = var.folder_id
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
