#! /usr/bin/env bash

# unofficial strict mode
set -eo pipefail
IFS=$'\n\t'

# Magic variables
__PROGRAME__=$(basename $0)
__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"
__ARGS__="$@"

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ;  }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $@" | tee -a "$LOG_FILE" >&2 ;  }
warning() { echo "[WARNING] $@" | tee -a "$LOG_FILE" >&2 ;  }
error()   { echo "[ERROR]   $@" | tee -a "$LOG_FILE" >&2 ;  }
fatal()   { echo "[FATAL]   $@" | tee -a "$LOG_FILE" >&2 ; exit 1 ;  }

cleanup() {
  # Remove temporary files
  # Restart services
  # ...
}

if [[ "${BASH_SOURCE[0]}" = "$0"  ]]; then
  trap cleanup EXIT

  %HERE%
fi
