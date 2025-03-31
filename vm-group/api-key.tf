resource "yandex_iam_service_account_key" "vm_group_sa_key" {
    service_account_id = yandex_iam_service_account.vm_group_sa.id
}