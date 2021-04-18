#!/bin/bash

if [[ -z ${SPIN} ]]; then
	echo 'Must be run within a Spin environment' >&2
	exit 1
fi

installProjectorPrereqs() {
	sudo apt-get install -qq --no-install-recommends \
		libfreetype6 \
		libxext6 \
		libxi6 \
		libxrender1 \
		libxtst6 \
		python3-dev \
		python3-pip

	pip3 install --quiet --user projector-installer

	# Run this to install locally
	# ~/.local/bin/projector ide autoinstall --config-name RubyMine --ide-name "RubyMine 2020.3.2"
}

installRubyMine() {
	~/.local/bin/projector ide autoinstall --config-name RubyMine --ide-name "RubyMine 2020.3.2" --accept-licence=true
	copyRubyMineConfig
}

copyRubyMineConfig() {
	if [ -d "rubymine_config" ]
	then
		echo "Could copy rubymine_config but idk where yet"
		echo "License info could be copied too!"
	else
		echo "Not copying RubyMine config"
	fi
}

runRubyMine() {
	~/.local/bin/projector run RubyMine
}

installProjectorPrereqs

# installRubyMine
# runRubyMine
