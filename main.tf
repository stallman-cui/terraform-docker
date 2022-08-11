terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = var.container_name
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name = "protal"
  ports {
    internal = 80
    external = 8080
  }
}
