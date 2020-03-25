FROM klakegg/hugo:0.68.1-onbuild AS hugo

FROM nginx
LABEL maintainer="jay@outfielding.net"
COPY --from=hugo /target /usr/share/nginx/html
