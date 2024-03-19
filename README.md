Steps:

* `docker build -t <docker_image> .`

* `docker save -o <image_name>.tar <docker_image>`

* `VBoxManage convertfromraw <image_name>.tar <output_filename>.vdi --format VDI`

* `7z a -tgzip <output_filename>.vdi.gz <output_filename>.vdi`
