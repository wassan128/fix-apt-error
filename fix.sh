#!/usr/bin/env bash

fix() {
    if [[ -z "$1" ]]; then
        echo "usage: ${0##/*} target"
        exit 1
    fi

    local basepath="/var/lib/dpkg/info"
    for target in "$@"
    do
        sudo rm -f "$basepath/$target.postinst" \
              "$basepath/$target.postrm" \
              "$basepath/$target.preinst" &&

        sudo dpkg --configure "$target"
    done
}

fix $@

