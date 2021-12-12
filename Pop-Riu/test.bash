#!/usr/bin/env bash

dirs=$(exa -D)

for i in $dirs; do
	if [[ -d ${i}/apps ]]; then
		cp "/home/riu/Downloads/icons/Papirus-Dark/128x128/apps/minecraft.svg" "${i}/apps"
		exa ${i}/apps | grep -y terminator
	fi
done
