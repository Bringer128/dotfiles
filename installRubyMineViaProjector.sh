#!/bin/bash

if [[ -z ${SPIN} ]]; then
	echo 'Must be run within a Spin environment' >&2
	exit 1
fi

installRubyMineViaProjector() {
	sudo apt-get install -qq --no-install-recommends \
		libfreetype6 \
		libxext6 \
		libxi6 \
		libxrender1 \
		libxtst6 \
		python3-dev \
		python3-pip

	pip3 install --quiet --user projector-installer

	# Use this after 1.1.3 (or higher) is released. You can see with 
	# ~/.local/bin/projector ide autoinstall --config-name RubyMine --ide-name "RubyMine 2020.3.2" --accept-licence=true

	# Run this to install locally
	# ~/.local/bin/projector ide autoinstall --config-name RubyMine --ide-name "RubyMine 2020.3.2"
}


installRubyMineViaProjector
