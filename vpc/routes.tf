resource "yandex_vpc_route_table" "private_rt" {
    count = length(var.private_subnets)

    name = "${var.env}-private-rt-${count.index}"
    network_id = yandex_vpc_network.this.id

    static_route {
        destination_prefix = "0.0.0.0/0"
        gateway_id = yandex_vpc_gateway.nat_gateway[0].id
    }
}