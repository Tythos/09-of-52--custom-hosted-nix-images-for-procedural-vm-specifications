resource "digitalocean_ssh_key" "dosshkey" {
  name       = "Terraform-defined SSH key"
  public_key = tls_private_key.privatekey.public_key_openssh
}
