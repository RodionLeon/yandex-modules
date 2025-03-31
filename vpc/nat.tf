resource "yandex_vpc_gateway" "nat_gateway" {
    count = length(var.private_subnets) > 0 ? 1 : 0
    name = "${var.env}-nat"
    shared_egress_gateway {}
}