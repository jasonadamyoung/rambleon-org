FROM klakegg/hugo:onbuild AS hugo

FROM nginx
LABEL maintainer="jay@outfielding.net"
COPY atomredirect.conf /etc/nginx/conf.d/
COPY --from=hugo /target /usr/share/nginx/html
