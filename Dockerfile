FROM ubuntu:latest

RUN apt update && apt install -y nginx git

RUN rm -rf /var/www/html/*
RUN git clone https://github.com/josejuansanchez/2048 /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
