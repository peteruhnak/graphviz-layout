#!/bin/bash
set -o nounset
set -o errexit

LIB_DIR=usr/lib
readonly PROGDIR=$(readlink -m $(dirname $0))

link_libs() {
	local dir=$1
	for f in $dir/*.so.*.0.0; do
		f=$(readlink -f $f)
		target="${f%.so.*}.so"
		cmd="ln -s $f $target"
		if [[ ! -e "$target" ]]; then
			echo "$cmd"
			$($cmd)
		fi
	done
}

link_libs $LIB_DIR
