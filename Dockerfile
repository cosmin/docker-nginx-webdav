FROM ubuntu:bionic

RUN apt-get update && apt-get upgrade -y && apt-get install -yq --no-install-recommends nginx nginx-extras gosu apache2-utils && rm -rf /var/lib/apt/lists/*
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN rm /etc/nginx/sites-enabled/*
RUN rm /etc/nginx/sites-available/*

RUN chmod go+rwX -R /var /run
VOLUME /media
EXPOSE 8080

COPY entrypoint.sh /root
COPY nginx.conf /etc/nginx/
COPY webdav.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/webdav.conf /etc/nginx/sites-enabled/

RUN chmod +x /root/entrypoint.sh
CMD /root/entrypoint.sh && nginx -g "daemon off;"