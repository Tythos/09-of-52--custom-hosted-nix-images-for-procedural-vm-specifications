resource "digitalocean_spaces_bucket_object" "dobucketobject" {
  region = var.DO_REGION
  bucket = digitalocean_spaces_bucket.dobucket.name
  key    = var.IMAGE_FILE
  source = "${path.module}/${var.IMAGE_FILE}"
  acl    = "public-read"
}
