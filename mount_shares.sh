#!/usr/bin/env bash

is_root=$(id -u)

if [[ ${is_root} -ne 0 ]]; then
	echo "script must be executed as root"
	exit 1
fi

shares=$(showmount -e nas-ciccone | awk '{print $1}' | tail -n +2)
selections=$(echo "${shares}" | wc -l)

echo "${shares}"
echo "==========="
read -p "choose one [1-${selections}]: " choice


selected=$(echo "${shares}" | sed -n "${choice} p")

read -p "mount point: " mount

mount -t nfs -o vers=4 nas-ciccone:${selected} ${mount}
