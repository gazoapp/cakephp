FROM gazoapp/php

RUN apt-get update && apt-get install -y libicu-dev

RUN docker-php-ext-install pdo_mysql intl mbstring mcrypt

CMD ["apache2-foreground"]
