

all: compile

help:
	@echo "Help:"
	@echo "sdcc   > available via brew/brew cask"
	@echo "stcgal > available as python3 script, pip3 install stcgal"
	@echo ""

compile: help
	sdcc -mmcs51 --iram-size 128 --xram-size 0 --code-size 4096  --nooverlay --noinduction --verbose --debug -V --std-sdcc89 --model-small "relay.c"

upload:
	#pip3 install stcgal
	stcgal -p /dev/tty.usbserial-1440 -b 1200 -D -t 11059 relay.ihx
