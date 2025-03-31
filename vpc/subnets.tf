resource "yandex_vpc_subnet" "private" {
    count = length(var.private_subnets)

    name = "${var.env}-private-${var.azs[count.index]}-${count.index}"
    network_id = yandex_vpc_network.this.id
    v4_cidr_blocks = [ var.private_subnets[count.index] ]
    zone = var.azs[count.index]

    labels = merge(
        { name = "${var.env}-private-${var.azs[count.index]}" },
        var.private_subnet_labels
    )

    route_table_id = yandex_vpc_route_table.private_rt[0].id
}

resource "yandex_vpc_subnet" "public" {
    count = length(var.public_subnets)

    name = "${var.env}-public-${var.azs[count.index]}-${count.index}"
    network_id = yandex_vpc_network.this.id
    v4_cidr_blocks = [ var.public_subnets[count.index] ]
    zone = var.azs[count.index]

    labels = merge(
        { name = "${var.env}-public-${var.azs[count.index]}" },
        var.public_subnet_labels
    )
}