username?=ash

debian: debian-builded.json preseed-builded.cfg
	packer build debian-builded.json

debian-builded.json:
	@sed 's/##username##\|##password##/$(username)/g' debian.json > debian-builded.json
	@sed -i 's/preseed.cfg/preseed-builded.cfg/g' debian-builded.json

preseed-builded.cfg:
	@sed 's/##username##\|##password##/$(username)/g' preseed.cfg > preseed-builded.cfg

clean:
	@rm -rf output*
	@rm -f debian-builded.json preseed-builded.cfg

.INTERMEDIATE: debian-builded.json preseed-builded.cfg
.PHONY: debian clean
