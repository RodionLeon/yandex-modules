resource "yandex_resourcemanager_folder_iam_binding" "role" {
    folder_id = var.folder_id
    role = "editor"

    members = [
        "serviceAccount:${yandex_iam_service_account.vm_group_sa.id}"
    ]
}