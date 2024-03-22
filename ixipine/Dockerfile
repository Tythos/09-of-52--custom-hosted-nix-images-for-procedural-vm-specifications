FROM amd64/alpine:3.13.5
RUN apk update
RUN apk add openrc linux-virt
RUN echo "root:root" | chpasswd
RUN rc-update add root
