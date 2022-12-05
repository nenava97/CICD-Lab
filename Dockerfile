FROM nginx:latest
COPY ./nginx.config /etc/nginx/conf.d/default.conf
WORKDIR /app
COPY ./index.html ./index.html
