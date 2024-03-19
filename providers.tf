terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.36.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

provider "digitalocean" {
  token             = var.DO_TOKEN
  spaces_access_id  = var.DO_SPACES_ID
  spaces_secret_key = var.DO_SPACES_KEY
}

provider "tls" {
}
