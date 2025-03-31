output "target_id" {
  value       = yandex_compute_instance_group.this.load_balancer[0].target_group_id
}


