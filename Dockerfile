FROM alpine:3.6
MAINTAINER Mario Inga <mario@yarkan.pe>

RUN apk update && apk add wget ca-certificates \
  py-pip build-base python-dev py-boto \
  gcc openssl-dev libffi-dev &&\
  pip install ansible &&\
  pip install awscli &&\
  wget -O /tmp/terraform.zip "https://releases.hashicorp.com/terraform/0.11.0/terraform_0.11.0_linux_amd64.zip" &&\
  unzip /tmp/terraform.zip && cp terraform /usr/bin/terraform && rm -rf /tmp/terraform.zip &&\
  wget -O /tmp/packer.zip "https://releases.hashicorp.com/packer/1.1.2/packer_1.1.2_linux_amd64.zip" &&\
  unzip /tmp/packer.zip && cp packer /usr/bin/packer && rm -rf /tmp/packer.zip &&\
  mkdir /app

WORKDIR /app
