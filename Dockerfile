FROM gazoapp/php

RUN apt-get update && apt-get install -y libmcrypt-dev g++ libicu-dev libmcrypt4 libicu52

RUN docker-php-ext-install pdo_mysql intl mbstring mcrypt

CMD ["apache2-foreground"]
