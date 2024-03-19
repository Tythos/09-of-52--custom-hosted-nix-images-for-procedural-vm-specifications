resource "digitalocean_spaces_bucket" "dobucket" {
  name   = "myawesomedigitaloceanspacesbucket"
  region = var.DO_REGION
}
