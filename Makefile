username?=vagrant

GREP := grep
VGREP:= $(GREP) -Ev
AWK  := awk
SORT := sort
RM_FILE := rm -f
RM_DIR := $(RM_FILE) -r

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	PR   := pr --omit-pagination --width=80 --columns=4
	SED := sed
	SED_I := sed -i
	GREPSTRING := Makefile
	REGEXP := \#\#username\#\#\|\#\#password\#\#
endif
ifeq ($(UNAME_S),Darwin)
	PR   := pr -4 -t -w 80
	SED := sed -E
	SED_I := sed -E -i ""
	GREPSTRING := 'Makefile|0x1F5:0:9'
	REGEXP := \#\#username\#\#|\#\#password\#\#
endif

help:
	@make -pq | 									\
	$(VGREP) $(GREPSTRING) |						\
	$(AWK) '/(^[^.%][-A-Za-z0-9_]*):/ 				\
		{ print substr($$1, 1, length($$1)-1) }' | 	\
	$(SORT) | $(PR)

debian: debian-builded.json preseed-builded.cfg
	packer build debian-builded.json

debian-builded.json:
	@$(SED) 's/$(REGEXP)/$(username)/g' debian.json > debian-builded.json
	@$(SED_I) 's/preseed.cfg/preseed-builded.cfg/g' debian-builded.json

preseed-builded.cfg:
	@$(SED) 's/$(REGEXP)/$(username)/g' preseed.cfg > preseed-builded.cfg

clean:
	@$(RM_DIR) output*
	@$(RM_FILE) debian-builded.json preseed-builded.cfg

.INTERMEDIATE: debian-builded.json preseed-builded.cfg
.PHONY: debian clean
