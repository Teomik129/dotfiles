#!/usr/bin/env bash

# default to base-devel and base
if [[ -z "$@" ]]; then
    groups="base-devel base"
else
    groups="$@"
fi

# Print out the explicitly installed packages, with the
# groups filtered out.
pacman -Qe | grep -v "$(pacman -Qqeg ${groups})"