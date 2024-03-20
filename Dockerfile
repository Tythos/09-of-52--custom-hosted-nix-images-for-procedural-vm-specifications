FROM alpine
RUN apk --no-cache add e2fsprogs e2fsprogs-extra cloud-init openssh openssh-server
RUN sed -i 's/^disable_root: true$/disable_root: false/' /etc/cloud/cloud.cfg
RUN sed -i 's/^datasource_list:\(.*\)/datasource_list: [ ConfigDrive, OpenNebula, DigitalOcean, Azure, AltCloud, OVF, MAAS, GCE, OpenStack, CloudSigma, SmartOS, None, NoCloud ]/' /etc/cloud/cloud.cfg
RUN ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
