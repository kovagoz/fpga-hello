docker_img := kovagoz/icestorm
docker_run := docker run --rm -it -v $(PWD):/host -w /host
docker_cmd := $(docker_run) $(docker_img)

hello.bin: hello.asc
	$(docker_cmd) icepack hello.asc hello.bin

hello.asc: hello.json constraints.pcf
	$(docker_cmd) nextpnr-ice40 --hx1k --package vq100 --json hello.json --pcf constraints.pcf --asc $@

hello.json: hello.v
	$(docker_cmd) yosys -p 'synth_ice40 -top hello -json $@' hello.v

constraints.pcf:
	curl https://www.nandland.com/goboard/Go_Board_Constraints.pcf > $@

.PHONY: install
install:
	$(docker_run) --device /dev/ttyUSB1 --privileged --user 0 $(docker_img) iceprog hello.bin

.PHONY: clean
clean:
	rm -f hello.json hello.asc hello.bin

.PHONY: shell
shell:
	$(docker_cmd) /bin/sh
