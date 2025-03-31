output "network_id" {
    value = yandex_vpc_network.this.id
}

output "private_subnet_ids" {
    value = yandex_vpc_subnet.private[*].id
}

output "public_subnet_ids" {
    value = yandex_vpc_subnet.public[*].id
}