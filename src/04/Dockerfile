FROM debian

COPY hello.c /home/hello.c
COPY for_cmd.sh /home/for_cmd.sh

WORKDIR /home

RUN apt update && apt install -y \
    gcc \
    libfcgi-dev \
    spawn-fcgi \ 
    nginx \
    && chmod +x for_cmd.sh

COPY nginx/nginx.conf /etc/nginx/nginx.conf

CMD [ "./for_cmd.sh" ]