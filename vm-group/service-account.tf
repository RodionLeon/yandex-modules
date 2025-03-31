resource "yandex_iam_service_account" "vm_group_sa" {
    name = "${var.env}-vmg-sa"
}