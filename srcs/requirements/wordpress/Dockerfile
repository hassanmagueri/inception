# FROM debian:bullseye-slim

# # Prevent interactive prompts during package installation
# ENV DEBIAN_FRONTEND=noninteractive

# # Install required packages
# RUN apt-get update && apt-get install -y \
#     php7.4-fpm \
#     php7.4-mysql \
#     php7.4-curl \
#     php7.4-gd \
#     php7.4-intl \
#     php7.4-mbstring \
#     php7.4-soap \
#     php7.4-xml \
#     php7.4-zip \
#     curl \
#     unzip \
#     && rm -rf /var/lib/apt/lists/*

# # Download and install WordPress
# WORKDIR /var/www
# RUN curl -O https://wordpress.org/latest.tar.gz \
#     && tar -xzf latest.tar.gz \
#     && rm latest.tar.gz \
#     && chown -R www-data:www-data wordpress

# # Configure PHP-FPM
# RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf \
#     && mkdir -p /run/php \
#     && chown www-data:www-data /run/php

# # Set working directory
# WORKDIR /var/www/wordpress

# # Create wp-config.php from sample
# RUN cp wp-config-sample.php wp-config.php

# # Expose port 9000 for PHP-FPM
# EXPOSE 9000

# # Start PHP-FPM
# CMD ["php-fpm7.4", "-F"]


FROM debian:11.11

RUN apt update && apt install -y curl zip unzip

RUN apt update && apt install -y php7.4-fpm php7.4-mysql

RUN curl -O https://wordpress.org/latest.zip
COPY  ./conf/init.sh /usr/bin/
RUN chmod +x /usr/bin/init.sh
RUN unzip latest.zip && rm latest.zip
RUN mkdir -p /var/www/wordpress && mv wordpress /var/www/

RUN chown -R www-data:www-data /var/www/wordpress &&  chmod -R 755 /var/www/wordpress
WORKDIR /var/www/wordpress
EXPOSE 9000
CMD ["init.sh"]