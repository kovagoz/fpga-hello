# My first FPGA code

It's doing nothing more than turn on a pair of LEDs and off the other two when you push the button.

Makefile is written for [Go Board](https://www.nandland.com).

## Deployment

Just as with other programs, run these two commands:

```sh
make
make install
```

The first one will produce the bitstream, the second one send it to the FPGA board.
Both of these commands run in Docker container. It's important to note that _install_ uses
USB to transfer bitstream, and currently this feature available only in
[docker-machine](https://docs.docker.com/machine/) not in Docker for Mac.
