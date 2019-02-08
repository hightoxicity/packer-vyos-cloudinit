SHELL := /bin/bash

all: clean build

all-ovf: clean-ovf build-ovf

build: build-ovf build-qcow2

build-ovf:
	cd ${CURDIR}; \
	packer build -on-error=abort -only=vyos-ovf -parallel=false vyos-1.1.8-amd64-ovf.json;

build-qcow2:
	cd ${CURDIR}; \
	packer build -on-error=abort -only=qemu-qcow2 -parallel=false vyos-1.1.8-amd64-qcow2.json;

clean: clean-ovf clean-qcow2

clean-ovf:
	cd ${CURDIR}; \
	rm -rf output-ovf;

clean-qcow2:
	cd ${CURDIR}; \
	rm -rf output-qemu-qcow2;
