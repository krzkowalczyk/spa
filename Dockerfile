FROM nginx:1.17.1-alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./spa/app/dist/hello-spa/ /usr/share/nginx/html/
