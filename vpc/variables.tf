variable "env" {
    description = "Environment name."
    type = string
}

variable "azs" {
    description = "Availability zones for subnets."
    type = list(string)
}

variable "private_subnets" {
    description = "CIDR ranges for private subnets."
    type = list(string)
}

variable "public_subnets" {
    description = "CIDR ranges for public subnets."
    type = list(string)
}

variable "private_subnet_labels" {
    description = "Private subnet labels."
    type = map(any)
    default = {}
}

variable "public_subnet_labels" {
    description = "Public subnet labels."
    type = map(any)
    default = {}
}