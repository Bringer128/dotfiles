#!/bin/bash

if [[ -z ${SPIN} ]]; then
	echo 'Must be run within a Spin environment' >&2
	exit 1
fi

startProjector() {
	local idePattern=${1}
	sudo apt-get install -qq --no-install-recommends \
		libfreetype6 \
		libext6 \
		libxi6 \
		libxrender1 \
		libxtst6 \
		python3-dev \
		python3-pip

	pip3 install --quiert --user projector-installer
	mkdir -p ~/.projector/configs
	projector ~/.local/bin/projector ide install "${idePattern}" &
}


startProjector 'RubyMine'

cp gitconfig ~/.gitconfig
