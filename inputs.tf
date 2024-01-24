variable "az_rg" {
    type         = object({
        name     = string
        location = string
    })
    default      = {
        name     = "fromtf"
        location = "centralindia"
    }
}

variable "vnet_details" {
    type         = object({
        name     = string
        address_space = list(string)
    })
    default      = {
        name     = "vpc"
        address_space = [ "10.10.0.0/16" ]
    }
}

variable "subnet_prefixes" {
    type        = list(string)
}

variable "subnet_names" {
    type        = list(string)
    default     = [ "web", "app", "db" ]
}