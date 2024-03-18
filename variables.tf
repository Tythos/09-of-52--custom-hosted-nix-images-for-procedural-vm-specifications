variable "DO_TOKEN" {
  type        = string
  description = "API token for deployment of DigitalOcean resources"
}

variable "DO_REGION" {
  type        = string
  description = "Region to which DigitalOcean resources will be deployed"
}

variable "DROPLET_IMAGE" {
  type        = string
  description = "Image used to create VM (droplet)"
}

variable "DROPLET_SIZE" {
  type        = string
  description = "Size of VM (droplet) created"
}
