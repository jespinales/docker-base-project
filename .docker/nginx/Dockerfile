FROM nginx:1.17-alpine

RUN apk update \
    && apk add bash \
    && apk add nano

RUN rm /etc/nginx/conf.d/default.conf

COPY ./conf.d/ /etc/nginx/conf.d/

RUN rm /etc/nginx/nginx.conf

COPY ./nginx.conf /etc/nginx
