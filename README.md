![logo](https://raw.githubusercontent.com/unifiedstreaming/origin/master/unifiedstreaming-logo-black.png)


Caching Proxy
-------------

This image provides a generic Nginx caching proxy, to be used to avoid excess 
requests hitting origin servers.


Configuration is done using environment variables:

| Variable           | Mandatory | Usage                                    |
|--------------------|-----------|------------------------------------------|
| LOG_LEVEL          | no        | Set error log level, defaults to `warn`  |
| LOG_FORMAT         | no        | Set custom log format, defaults to `$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$upstream_cache_status\" \"$http_remix_request_id\" $request_time` |
| NAME               | yes       | Name of server, e.g. smil-proxy          |
| TARGET             | yes       | Target origin server, e.g. smil-origin   |
| CACHE_KEY          | no        | Cache key, defaults to `$request_uri`    |