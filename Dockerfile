FROM klakegg/hugo:onbuild AS hugo

FROM nginx
LABEL maintainer="jay@outfielding.net"
COPY --from=hugo /target /usr/share/nginx/html
ADD build/default.conf /etc/nginx/conf.d/default.conf
ADD build/00-jsonlog.conf /etc/nginx/conf.d/00-jsonlog.conf
