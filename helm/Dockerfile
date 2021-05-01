ADD file:c855b3c65f5ba94d548d7d2659094eeb63fbf7f8419ac8e07712c3320c38b62c in /
CMD ["bash"]
RUN set -eux; { echo 'Package: php*'; echo 'Pin: release *'; echo 'Pin-Priority: -1'; } > /etc/apt/preferences.d/no-debian-php
ENV PHPIZE_DEPS=autoconf dpkg-dev file g++ gcc libc-dev make pkg-config re2c
RUN set -eux; apt-get update; apt-get install -y --no-install-recommends $PHPIZE_DEPS ca-certificates curl xz-utils ; rm -rf /var/lib/apt/lists/*
ENV PHP_INI_DIR=/usr/local/etc/php
RUN set -eux; mkdir -p "$PHP_INI_DIR/conf.d"; [ ! -d /var/www/html ]; mkdir -p /var/www/html; chown www-data:www-data /var/www/html; chmod 777 /var/www/html
ENV APACHE_CONFDIR=/etc/apache2
ENV APACHE_ENVVARS=/etc/apache2/envvars
RUN set -eux; apt-get update; apt-get install -y --no-install-recommends apache2; rm -rf /var/lib/apt/lists/*; sed -ri 's/^export ([^=]+)=(.*)$/: ${\1:=\2}\nexport \1/' "$APACHE_ENVVARS"; . "$APACHE_ENVVARS"; for dir in "$APACHE_LOCK_DIR" "$APACHE_RUN_DIR" "$APACHE_LOG_DIR" ; do rm -rvf "$dir"; mkdir -p "$dir"; chown "$APACHE_RUN_USER:$APACHE_RUN_GROUP" "$dir"; chmod 777 "$dir"; done; rm -rvf /var/www/html/*; ln -sfT /dev/stderr "$APACHE_LOG_DIR/error.log"; ln -sfT /dev/stdout "$APACHE_LOG_DIR/access.log"; ln -sfT /dev/stdout "$APACHE_LOG_DIR/other_vhosts_access.log"; chown -R --no-dereference "$APACHE_RUN_USER:$APACHE_RUN_GROUP" "$APACHE_LOG_DIR"
RUN a2dismod mpm_event
   &&  a2enmod mpm_prefork
RUN { echo '<FilesMatch \.php$>'; echo '\tSetHandler application/x-httpd-php'; echo '</FilesMatch>'; echo; echo 'DirectoryIndex disabled'; echo 'DirectoryIndex index.php index.html'; echo; echo '<Directory /var/www/>'; echo '\tOptions -Indexes'; echo '\tAllowOverride All'; echo '</Directory>'; } | tee "$APACHE_CONFDIR/conf-available/docker-php.conf"
   &&  a2enconf docker-php
ENV PHP_EXTRA_BUILD_DEPS=apache2-dev
ENV PHP_EXTRA_CONFIGURE_ARGS=--with-apxs2 --disable-cgi
ENV PHP_CFLAGS=-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
ENV PHP_CPPFLAGS=-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
ENV PHP_LDFLAGS=-Wl,-O1 -pie
ENV GPG_KEYS=42670A7FE4D0441C8E4632349E4FDC074A4EF02D 5A52880781F755608BF815FC910DEB46F53EA312
ENV PHP_VERSION=7.4.16
ENV PHP_URL=https://www.php.net/distributions/php-7.4.16.tar.xz PHP_ASC_URL=https://www.php.net/distributions/php-7.4.16.tar.xz.asc
ENV PHP_SHA256=1c16cefaf88ded4c92eed6a8a41eb682bb2ef42429deb55f1c4ba159053fb98b
RUN set -eux; savedAptMark="$(apt-mark showmanual)"; apt-get update; apt-get install -y --no-install-recommends gnupg dirmngr; rm -rf /var/lib/apt/lists/*; mkdir -p /usr/src; cd /usr/src; curl -fsSL -o php.tar.xz "$PHP_URL"; if [ -n "$PHP_SHA256" ]; then echo "$PHP_SHA256 *php.tar.xz" | sha256sum -c -; fi; if [ -n "$PHP_ASC_URL" ]; then curl -fsSL -o php.tar.xz.asc "$PHP_ASC_URL"; export GNUPGHOME="$(mktemp -d)"; for key in $GPG_KEYS; do gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; done; gpg --batch --verify php.tar.xz.asc php.tar.xz; gpgconf --kill all; rm -rf "$GNUPGHOME"; fi; apt-mark auto '.*' > /dev/null; apt-mark manual $savedAptMark > /dev/null; apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
COPY file:ce57c04b70896f77cc11eb2766417d8a1240fcffe5bba92179ec78c458844110 in /usr/local/bin/
RUN set -eux; savedAptMark="$(apt-mark showmanual)"; apt-get update; apt-get install -y --no-install-recommends libargon2-dev libcurl4-openssl-dev libedit-dev libonig-dev libsodium-dev libsqlite3-dev libssl-dev libxml2-dev zlib1g-dev ${PHP_EXTRA_BUILD_DEPS:-} ; rm -rf /var/lib/apt/lists/*; export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" ; docker-php-source extract; cd /usr/src/php; gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"; debMultiarch="$(dpkg-architecture --query DEB_BUILD_MULTIARCH)"; if [ ! -d /usr/include/curl ]; then ln -sT "/usr/include/$debMultiarch/curl" /usr/local/include/curl; fi; ./configure --build="$gnuArch" --with-config-file-path="$PHP_INI_DIR" --with-config-file-scan-dir="$PHP_INI_DIR/conf.d" --enable-option-checking=fatal --with-mhash --with-pic --enable-ftp --enable-mbstring --enable-mysqlnd --with-password-argon2 --with-sodium=shared --with-pdo-sqlite=/usr --with-sqlite3=/usr --with-curl --with-libedit --with-openssl --with-zlib --with-pear $(test "$gnuArch" = 's390x-linux-gnu'
   &&  echo '--without-pcre-jit') --with-libdir="lib/$debMultiarch" ${PHP_EXTRA_CONFIGURE_ARGS:-} ; make -j "$(nproc)"; find -type f -name '*.a' -delete; make install; find /usr/local/bin /usr/local/sbin -type f -executable -exec strip --strip-all '{}' + || true; make clean; cp -v php.ini-* "$PHP_INI_DIR/"; cd /; docker-php-source delete; apt-mark auto '.*' > /dev/null; [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; find /usr/local -type f -executable -exec ldd '{}' ';' | awk '/=>/ { print $(NF-1) }' | sort -u | xargs -r dpkg-query --search | cut -d: -f1 | sort -u | xargs -r apt-mark manual ; apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; pecl update-channels; rm -rf /tmp/pear ~/.pearrc; php --version
COPY multi:e4407f0002276f00cc93b01e48696c1f677a5f7d3d194b3a84bec1cc5e733bcb in /usr/local/bin/
RUN docker-php-ext-enable sodium
ENTRYPOINT ["docker-php-entrypoint"]
STOPSIGNAL SIGWINCH
COPY file:e3123fcb6566efa979f945bfac1c94c854a559d7b82723e42118882a8ac4de66 in /usr/local/bin/
WORKDIR /var/www/html
EXPOSE 80
CMD ["apache2-foreground"]
RUN set -eux; apt-get update; apt-get install -y --no-install-recommends ghostscript ; rm -rf /var/lib/apt/lists/*
RUN set -ex; savedAptMark="$(apt-mark showmanual)"; apt-get update; apt-get install -y --no-install-recommends libfreetype6-dev libjpeg-dev libmagickwand-dev libpng-dev libzip-dev ; docker-php-ext-configure gd --with-freetype --with-jpeg ; docker-php-ext-install -j "$(nproc)" bcmath exif gd mysqli zip ; pecl install imagick-3.4.4; docker-php-ext-enable imagick; rm -r /tmp/pear; apt-mark auto '.*' > /dev/null; apt-mark manual $savedAptMark; ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so | awk '/=>/ { print $3 }' | sort -u | xargs -r dpkg-query -S | cut -d: -f1 | sort -u | xargs -rt apt-mark manual; apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; rm -rf /var/lib/apt/lists/*
RUN set -eux; docker-php-ext-enable opcache; { echo 'opcache.memory_consumption=128'; echo 'opcache.interned_strings_buffer=8'; echo 'opcache.max_accelerated_files=4000'; echo 'opcache.revalidate_freq=2'; echo 'opcache.fast_shutdown=1'; } > /usr/local/etc/php/conf.d/opcache-recommended.ini
RUN { echo 'error_reporting = E_ERROR | E_WARNING | E_PARSE | E_CORE_ERROR | E_CORE_WARNING | E_COMPILE_ERROR | E_COMPILE_WARNING | E_RECOVERABLE_ERROR'; echo 'display_errors = Off'; echo 'display_startup_errors = Off'; echo 'log_errors = On'; echo 'error_log = /dev/stderr'; echo 'log_errors_max_len = 1024'; echo 'ignore_repeated_errors = On'; echo 'ignore_repeated_source = Off'; echo 'html_errors = Off'; } > /usr/local/etc/php/conf.d/error-logging.ini
RUN set -eux; a2enmod rewrite expires; a2enmod remoteip; { echo 'RemoteIPHeader X-Forwarded-For'; echo 'RemoteIPTrustedProxy 10.0.0.0/8'; echo 'RemoteIPTrustedProxy 172.16.0.0/12'; echo 'RemoteIPTrustedProxy 192.168.0.0/16'; echo 'RemoteIPTrustedProxy 169.254.0.0/16'; echo 'RemoteIPTrustedProxy 127.0.0.0/8'; } > /etc/apache2/conf-available/remoteip.conf; a2enconf remoteip; find /etc/apache2 -type f -name '*.conf' -exec sed -ri 's/([[:space:]]*LogFormat[[:space:]]+"[^"]*)%h([^"]*")/\1%a\2/g' '{}' +
RUN set -eux; version='5.7.1'; sha1='296bc228c4f4d67d7da8814079f86516f6c2337d'; curl -o wordpress.tar.gz -fL "https://wordpress.org/wordpress-$version.tar.gz"; echo "$sha1 *wordpress.tar.gz" | sha1sum -c -; tar -xzf wordpress.tar.gz -C /usr/src/; rm wordpress.tar.gz; [ ! -e /usr/src/wordpress/.htaccess ]; { echo '# BEGIN WordPress'; echo ''; echo 'RewriteEngine On'; echo 'RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]'; echo 'RewriteBase /'; echo 'RewriteRule ^index\.php$ - [L]'; echo 'RewriteCond %{REQUEST_FILENAME} !-f'; echo 'RewriteCond %{REQUEST_FILENAME} !-d'; echo 'RewriteRule . /index.php [L]'; echo ''; echo '# END WordPress'; } > /usr/src/wordpress/.htaccess; chown -R www-data:www-data /usr/src/wordpress; mkdir wp-content; for dir in /usr/src/wordpress/wp-content/*/ cache; do dir="$(basename "${dir%/}")"; mkdir "wp-content/$dir"; done; chown -R www-data:www-data wp-content; chmod -R 777 wp-content
VOLUME [/var/www/html]
COPY --chown=www-data:www-datafile:4bf3e33874fc7286d57546f67c8371a0c4b9a02171c1d835cc588fc3cee4aa07 in /usr/src/wordpress/
COPY file:5be6bcc31206cb827f037769d89fd092037ed61a1e10d6cae7939a37055beb4c in /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
