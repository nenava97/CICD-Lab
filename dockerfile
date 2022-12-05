FROM nginx:latest

COPY ./app/nginx.config /etc/nginx/conf.d/default.conf

WORKDIR /app

COPY ./app/index.html ./index.html
