FROM debian

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "executable" ]

COPY hello.c /home/hello.c
COPY for_cmd.sh /home/for_cmd.sh


WORKDIR /home

RUN apt update && apt install -y \
    gcc \
    libfcgi-dev \
    spawn-fcgi \ 
    nginx \
    && chmod +x for_cmd.sh \
    && rm -rf /var/lib/apt/lists \
    && gcc hello.c -lfcgi -o hello.fcgi \
    && chmod u-s /bin/su /usr/bin/chsh \
    /usr/bin/passwd /usr/bin/chfn /bin/mount \
    /bin/umount /usr/bin/newgrp /usr/bin/gpasswd \
    && chmod g-s /usr/bin/wall /usr/bin/chage \
    /usr/bin/expiry /sbin/unix_chkpwd

RUN adduser --disabled-password --gecos '' admin && \
    mkdir /app /var/cache/nginx/ && \
    chown -R admin:admin /app && chmod -R 755 /app && \
    chown -R admin:admin /var/cache/nginx && \
    chown -R admin:admin /var/log/nginx && \
    chown -R admin:admin /etc/nginx/conf.d && \
    chown -R admin:admin /var/lib/nginx && \
    touch /var/run/nginx.pid && \
    chown -R admin:admin /var/run/nginx.pid
     
USER admin

ENTRYPOINT [ "./for_cmd.sh" ]