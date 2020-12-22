# php-docker-action
Use docker image to setup php environment mainly for laravel

[![Build](https://github.com/rust17/php-docker-action/workflows/.github/workflows/action.yml/badge.svg)](https://github.com/rust17/php-docker-action/actions)
[![Pull](https://img.shields.io/docker/pulls/rust17/php-docker-action.svg)](https://img.shields.io/docker/pulls/rust17/php-docker-action.svg)
[![LICENSE](https://img.shields.io/github/license/rust17/php-docker-action)](https://github.com/rust17/php-docker-action/blob/master/LICENSE)

### Support php version

* 7.3
* 7.4
* 8.0

### How to use

Add follow line in your workflows/actions.yml
```
container:
	image: rust17/php-docker-action:${{ php_version }}
```

### Extensions

* cron
* unzip
* bcmath
* curl
* xml
* gd
* zip
* intl
* pdo_mysql
* pcntl
* redis
* composer

### Reference

[php-ci-image](https://github.com/nauxliu/php-ci-image)