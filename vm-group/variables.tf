variable "env" {
    description = "Environment name."
    type = string
}

variable "azs" {
    description = "Availability zones for subnets."
    type = list(string)
}

variable "folder_id" {
    description = "Yandex Cloud folder id"
    type = string
}

variable "cores" {
    description = "Number of CPU cores per compute instance."
    type = number
}

variable "memory" {
    description = "Amount of RAM per compute instance."
    type = number
}

variable "platform_id" {
    description = "Platform ID for compute instances."
    type = string
    default = "standard-v1"
}

variable "image_id" {
    description = "Image ID for compute instances."
    type = string
}

variable "network_id" {
    description = "Network ID."
    type = string
}

variable "subnet_ids" {
    description = "List of subnets ID's."
    type = list(string)
}

variable "nat" {
    description = "Assign Public IP address."
    type = bool
}

variable "group_size" {
    description = "Number of compute instances."
    type = number
}

variable "max_unavailable" {
    description = "Maxium value of compute instances in unavailable state."
    type = number
}

variable "max_creating" {
    description = "Maximum value of compute instances in creating state."
    type = number
}

variable "max_expansion" {
    description = "Maximum value to exceed normal group size."
    type = number
}

variable "user-data" {
    description = "userdata for compute instances."
    type = string
}