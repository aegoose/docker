FROM fpm:5.4.26
# RUN mkdir -p /wwwroot/php/lib/php/extensions/no-debug-non-zts-20100525
# COPY ./extensions/no-debug-non-zts-20100525/*.so /wwwroot/php/lib/php/extensions/no-debug-non-zts-20100525
COPY ./php-fpm.conf ./php.ini /wwwroot/php/etc/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./supervisord.conf /etc/supervisord.conf
RUN groupadd -g 1000 www && useradd -r -m -g 1000 -u 1000 www

VOLUME [ "/logs" ]
VOLUME [ "/data" ]
EXPOSE 443 80

# CMD [ "/wwwroot/start.sh" ]
# CMD [ "/wwwroot/php/sbin/php-fpm" ]
CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf" ]