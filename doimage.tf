resource "digitalocean_custom_image" "doimage" {
  name    = "alpine-cloud"
  url     = "https://${digitalocean_spaces_bucket.dobucket.name}.${var.DO_REGION}.digitaloceanspaces.com/${var.IMAGE_FILE}"
  regions = [var.DO_REGION]
}
