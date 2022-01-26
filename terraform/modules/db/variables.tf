variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable image_id {
  description = "Disk image"
}

variable subnet_id {
  description = "Subnet"
}

#variable service_account_key_file {
#  description = "path to key.json"
#}

variable "platform_id" {
  default = "standard-v1"
}

variable "preemptible" {
  default = false
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
