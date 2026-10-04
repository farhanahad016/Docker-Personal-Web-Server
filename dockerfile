FROM ubuntu:latest
RUN apt update && apt install nginx -y
ADD index.html /var/www/html/index.html
CMD ["nginx","-g","daemon off;"]
