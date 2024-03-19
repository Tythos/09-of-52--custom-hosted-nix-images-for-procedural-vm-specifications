## Objectives

Our goal for this project is to verify (and streamline/automate, as much as possible) the process of creating a VM (in this case, DigitalOcean Droplet) based on a developer-defined "base" image. The eventual goal is to add to our VMs the ability to use a NixOS-based image to support procedural specification of VM configurations from Terraform to minimize our reliance on `cloud-init` run commands.

## Defining an Image

We assume we start with a Docker image of some kind. In particular, we define a Dockerfile that lets us customize a specific Alpine image to ensure compatibility with DigitalOcean's image requirements (among other things, this means installing SSH and `cloud-init` support with the appropriate configurations.)

* `docker build -t <docker_image> .` to build our image from the Dockerfile

* `docker save -o <image_name>.tar <docker_image>` to write that image out to a `.TAR` file

* `VBoxManage convertfromraw <image_name>.tar <output_filename>.vdi --format VDI` (requires VirtualBox installation) to write that `.TAR` into a virtual disk image

* `7z a -tgzip <output_filename>.vdi.gz <output_filename>.vdi` to compress that virtual disk image

## Resources

Once the `.VDI.GZ` file is defined locally, we can proceed to upload it via a Bucket Object in Spaces to reference by the Image resource via URL. This requires the following resources:

* Project, a grouping of related DigitalOcean resources (for organization's sake)

* Bucket, a storage area where our image will be uploaded to for access

* Bucket Object, a specific file in the bucket defined by the binary contents of our `.VDI.GZ`

* Image, the official definition of an OS image derived from that file URL for subsequent reference by VMs

## Testing

We have no idea if this works. So, let's create a test VM to find out. This requires the following resources:

* Private Key, using the Terraform TLS provider to generate credentials we can use to log in 

* SSH Key, the official DigitalOcean "key" resource that will be attached to that VM

* Droplet, the actual VM which will reference our Image and be authorized with our Key

* Outputs, which will help us resolve where the VM can be accessed and with what credentials

Once deployed, test by attempting to log in with our generated SSH key (replacing `1.2.3.4` by the output from the first command):

* `terraform output PUBLIC_IP`

* `terraform output -raw SSH_KEY > id_rsa`

* `ssh -i id_rsa root@1.2.3.4`
