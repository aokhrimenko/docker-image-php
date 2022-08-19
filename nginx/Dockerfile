FROM nginx
COPY --chown=www-data:www-data nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /app/public
RUN touch /app/public/index.php
