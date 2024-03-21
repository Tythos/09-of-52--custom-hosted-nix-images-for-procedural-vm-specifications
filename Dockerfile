FROM alpine
RUN echo "Asserting root ssh state..." &&\
    mkdir -p /root/.ssh &&\
    chmod 0700 /root/.ssh
RUN echo "Installing package requirements..." &&\
    apk --no-cache add openrc e2fsprogs e2fsprogs-extra cloud-init openssh openssh-server
COPY cloud.cfg /etc/cloud/cloud.cfg
RUN echo "Setting up ssh service configuration..." &&\
    ssh-keygen -A &&\
    echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config &&\
    mkdir -p /run/openrc &&\
    touch /run/openrc/softlevel &&\
    rc-update add sshd
EXPOSE 22
