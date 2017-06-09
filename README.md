![logo](https://raw.githubusercontent.com/unifiedstreaming/origin/master/unifiedstreaming-logo-black.png)


Caching Proxy
-------------

This image provides a generic Apache caching proxy using mod_cache and 
mod_proxy_http, to be used to avoid excess requests hitting origin servers.

It is designed for use in a Rancher (or similar) stack.

Configuration is done using environment variables:

| Variable           | Mandatory | Usage                                    |
|--------------------|-----------|------------------------------------------|
| LOG_LEVEL          | no        | Set Apache log level, defaults to "warn" |
| LOG_FORMAT         | no        | Set custom log format                    |
| NAME               | yes       | Name of server, e.g. smil-proxy          |
| TARGET             | yes       | Target origin server, e.g. smil-origin   |
| CACHE_MAX_FILESIZE | yes       | Cache maximum file size                  |