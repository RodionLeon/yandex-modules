resource "yandex_vpc_network" "this" {
    name = "${var.env}-network"
}