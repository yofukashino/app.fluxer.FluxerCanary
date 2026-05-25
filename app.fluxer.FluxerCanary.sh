#!/bin/sh

FLAGS_PATH="${XDG_CONFIG_HOME}/fluxer-flags.conf"

if [ -f "${FLAGS_PATH}" ]; then
    mapfile -t FLAGS <<< "$(grep -Ev '^\s*$|^#' "${FLAGS_PATH}")"
fi


export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export FLUXER_DISABLE_DESKTOP_FILE=1

exec zypak-wrapper /app/fluxer-canary/fluxer-canary "${FLAGS[@]}" "$@"
