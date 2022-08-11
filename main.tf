terraform {
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.0.1"
    }
  }

  required_version = ">= 1.1.0"
}

variable "name_length" {
    description = "The number of words in the pet name"
    default = "3"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "random_pet" "pet_name" {
  length = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}