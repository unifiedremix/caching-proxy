#!/bin/sh

# set env vars or defaults
if [ -z "$LOG_LEVEL" ]
  then
  export LOG_LEVEL=warn
fi

if [ -z "$LOG_FORMAT" ]
  then
  export LOG_FORMAT="\$remote_addr - \$remote_user [\$time_local] \"\$request\" \$status \$body_bytes_sent \"\$http_referer\" \"\$http_user_agent\" \"\$upstream_cache_status\" \"\$http_remix_request_id\" \$request_time"
fi


if [ -z "$CACHE_KEY" ]
  then
  export CACHE_KEY="\$request_uri\$slice_range"
fi


# validate required variables are set
if [ -z "$NAME" ]
  then
  echo >&2 "Error: NAME environment variable is required but not set."
  exit 1
fi

if [ -z "$TARGET" ]
  then
  echo >&2 "Error: TARGET environment variable is required but not set."
  exit 1
fi


# update configuration based on env vars
/bin/sed "s/{{LOG_LEVEL}}/${LOG_LEVEL}/g; s/{{LOG_FORMAT}}/${LOG_FORMAT}/g; s/{{NAME}}/${NAME}/g; s/{{TARGET}}/${TARGET}/g; s/{{CACHE_KEY}}/${CACHE_KEY}/g" /etc/nginx/nginx.conf.in > /etc/nginx/nginx.conf

rm -f /run/nginx/nginx.pid

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- nginx "$@"
fi

exec "$@"