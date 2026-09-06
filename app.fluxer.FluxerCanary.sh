#!/bin/sh

FLAGS_PATH="${XDG_CONFIG_HOME}/fluxer-flags.conf"

if [ -f "${FLAGS_PATH}" ]; then
    mapfile -t FLAGS <<< "$(grep -Ev '^\s*$|^#' "${FLAGS_PATH}")"
fi

# String Flux retruns 114138 with letter to number base26 conversion
export FAKE_PID="${FAKE_PID:-114138}"
export ZYPAK_LD_PRELOAD="/app/lib/libfakepid.so${ZYPAK_LD_PRELOAD:+:$ZYPAK_LD_PRELOAD}"

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export FLUXER_DISABLE_DESKTOP_FILE=1

exec zypak-wrapper /app/fluxer-canary/fluxer-canary "${FLAGS[@]}" "$@"
