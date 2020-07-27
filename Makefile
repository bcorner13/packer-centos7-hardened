
all: build

build:
	packer build -only=amazon-chroot packer-centos7-hardened.json

build-vbox:
	packer build -only=virtualbox-iso packer-centos7-hardened.json

build-ebs:
	packer build -only=amazon-ebs packer-centos7-hardened.json

build-hyperv:
	packer build -only=hyperv-iso packer-centos7-hardened.json
