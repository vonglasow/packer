debian:
	packer build debian.json

clean:
	rm -rf output*

.PHONY: debian clean
