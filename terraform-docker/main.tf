terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>3.6.2"
    }
  }
}

provider "docker" {}

# download nodered image

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

# start the container

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.name
  ports {
    internal = 1880
    external = 1880
  }
}
