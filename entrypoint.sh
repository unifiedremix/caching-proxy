#!/bin/sh

# set env vars or defaults
if [ ! $LOG_LEVEL ]
  then
  export LOG_LEVEL=warn
fi

if [ ! $LOG_FORMAT ]
  then
  export LOG_FORMAT="%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\" \"%{cache-status}e\" \"%{REMIX_REQUEST_ID}i\" %D"
fi

# validate required variables are set
if [ ! $NAME ]
  then
  echo >&2 "Error: NAME environment variable is required but not set."
  exit 1
fi

if [ ! $TARGET ]
  then
  echo >&2 "Error: TARGET environment variable is required but not set."
  exit 1
fi

if [ ! $CACHE_MAX_FILESIZE ]
  then
  echo >&2 "Error: CACHE_MAX_FILESIZE environment variable is required but not set."
  exit 1
fi

# update configuration based on env vars
/bin/sed "s/{{LOG_LEVEL}}/${LOG_LEVEL}/g; s/{{LOG_FORMAT}}/'${LOG_FORMAT}'/g; s/{{NAME}}/${NAME}/g; s/{{TARGET}}/${TARGET}/g; s/{{CACHE_MAX_FILESIZE}}/${CACHE_MAX_FILESIZE}/g" /etc/apache2/conf.d/proxy.conf.in > /etc/apache2/conf.d/proxy.conf

rm -f /run/apache2/httpd.pid

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- httpd "$@"
fi

exec "$@"