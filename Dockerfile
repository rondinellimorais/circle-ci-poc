# syntax=docker/dockerfile:1
FROM nginx:1.21.6-alpine

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY build /usr/share/nginx/html/

ENV PORT=${PORT:-80}
CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'