FROM ubuntu:23.04

ENV timezone=America/Sao_Paulo

RUN apt-get update && \
	apt-get -y upgrade && \
	ln -snf /usr/share/zoneinfo/${timezone} /etc/localtime && echo ${timezone} > /etc/timezone && \
	apt-get install -y apache2 && \
	apt-get install -y software-properties-common && \
	apt-get install -y php && \
	apt-get install -y php-cli php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-bcmath && \
	apt-get install -y php-xdebug && \
	apt-get install -y php-mysql && \
	apt-get install -y git && \
	apt-get install -y nano && \
	apt-get install -y curl && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && rm composer-setup.php && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer
	
EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT /etc/init.d/apache2 start && /bin/bash

CMD ["true"]
