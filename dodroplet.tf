resource "digitalocean_droplet" "dodroplet" {
  name     = "dodroplet"
  image    = digitalocean_custom_image.doimage.id
  region   = var.DO_REGION
  size     = var.DROPLET_SIZE
  ssh_keys = [digitalocean_ssh_key.dosshkey.id]
}
