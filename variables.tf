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

variable "DO_SPACES_ID" {
  type        = string
  description = "Identifies DigitalOcean Spaces identifier for bucket object storage API"
}

variable "DO_SPACES_KEY" {
  type        = string
  description = "Defines private key for DigitalOcean Spaces bucket object storage API"
}

variable "IMAGE_FILE" {
  type        = string
  description = "Path to image .vdi.gz for reference and upload"
}
