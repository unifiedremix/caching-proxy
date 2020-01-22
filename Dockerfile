FROM nginx:1.13.7-alpine

# install nginx
# RUN apk --update add nginx \
#  && rm -f /var/cache/apk/* \
#  && mkdir -p /run/nginx \
#  && mkdir -p /var/cache/nginx/ 

COPY nginx.conf.in /etc/nginx/nginx.conf.in
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["-g", "daemon off;"]