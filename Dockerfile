# nginx official image
# see https://registry.hub.docker.com/_/nginx/
# see also https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile
FROM nginx

# Maintained by Jacques L. Chereau
MAINTAINER jlchereau

# Configuration
COPY default.conf /etc/nginx/conf.d/default.conf