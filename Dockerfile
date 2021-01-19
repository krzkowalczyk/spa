FROM nginx:1.17.1-alpine
COPY ./app/configuration/nginx.conf /etc/nginx/nginx.conf
COPY ./app/dist/hello-spa/ /usr/share/nginx/html/
