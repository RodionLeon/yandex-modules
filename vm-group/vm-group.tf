resource "yandex_compute_instance_group" "this" {
    depends_on = [ yandex_resourcemanager_folder_iam_binding.role ]
    name = "${var.env}-vm-group"
    service_account_id = yandex_iam_service_account.vm_group_sa.id

    instance_template {
        platform_id = var.platform_id

        resources {
            cores = var.cores
            memory = var.memory
        }

        boot_disk {
            initialize_params {
                image_id = var.image_id
            }
        }

        network_interface {
            network_id = var.network_id
            subnet_ids = var.subnet_ids
            nat = var.nat
        }

        metadata = {
            user-data = var.user-data
        }
    }

    scale_policy {
        fixed_scale {
            size = var.group_size
        }
    }

    allocation_policy {
        zones = var.azs
    }

    deploy_policy {
        max_unavailable = var.max_unavailable
        max_creating = var.max_creating
        max_expansion = var.max_expansion
    }

    load_balancer {
        target_group_name = "${var.env}-target-group"
    }
}