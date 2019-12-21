#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for ariad"

  set -- ariad "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "ariad" ]; then
  mkdir -p "$ARIA_DATA"
  chmod 700 "$ARIA_DATA"
  chown -R aria "$ARIA_DATA"

  echo "$0: setting data directory to $ARIA_DATA"

  set -- "$@" -datadir="$ARIA_DATA"
fi

if [ "$1" = "ariad" ] || [ "$1" = "aria-cli" ] || [ "$1" = "aria-tx" ]; then
  echo
  exec gosu aria "$@"
fi

echo
exec "$@"