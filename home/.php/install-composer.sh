# Script to install composer.phar

COMPOSER_PHAR=composer.phar
VIM_PATH=$HOME/.vim 
VIM_BIN_PATH=$VIM_PATH/bin
PHP_PATH=$HOME/.php
PHP_BIN_PATH=$PHP_PATH/vendor/bin

echo "Checking composer.phar ... "
[ -f $COMPOSER_PHAR ] || {
    curl -sS https://getcomposer.org/installer | php
}

echo "Installing php tools ... "
php composer.phar install && {
    echo "Linking php tools ... "
    [ -d ${VIM_BIN_PATH} ] || mkdir ${VIM_BIN_PATH}

    ln -s ${PHP_BIN_PATH}/pdepend ${VIM_BIN_PATH}
    ln -s ${PHP_BIN_PATH}/phpcfb ${VIM_BIN_PATH}
    ln -s ${PHP_BIN_PATH}/phpcs ${VIM_BIN_PATH}
    ln -s ${PHP_BIN_PATH}/phpmd ${VIM_BIN_PATH}
} || {
    echo "Error when installing php tools, aborting"
}
