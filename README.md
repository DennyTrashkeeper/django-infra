# Django infrastructure
 Создание инфраструктуры Django с нуля.
 Представляет из себя многоконтейнерное приложение.
## Что было сделано
 - Собрана многоконтейнерная архитектура (Django + Gunicorn + Nginx + PostgreSQL)
 - Настроен `Healthcheck` для БД, чтобы Django не запускался до готовности Postgres.
 - Настроено сетевое взаимодействие между контейнерами.
 - Настроен HTTPS (самоподписанный сертификат)через Nginx.
 - Выполнена миграция с SQLite на PostgreSQL.
## Содержание
 - [Технологии](#технологии)
 - [Установка и запуск](#установка-и-запуск)
## Технологии
 - [Docker / Docker Compose](https://www.docker.com/) - контейнеризации приложений и оркестрация.
 - [Django](https://www.djangoproject.com/) - веб-фреймворк.
 - [Gunicorn](https://gunicorn.org/) - WSGI сервер.
 - [Nginx](https://nginx.org/) - proxy сервер.
 - [Postgres](https://www.postgresql.org/) - СУБД, сохранение данных веб-приложения.
## Установка и запуск
 1. Клонируйте репозиторий
 ```bash
 git clone https://github.com/DennyTrashkeeper/django-infra.git
 cd django-infra
 ```
 2. Cоздайте `.env` в корне проекта или заполните своими данными:
 ```env
 DB_HOST=postgresql
 DB_NAME=django_db
 DB_USER=django_user
 DB_PASSWORD=your_password
 DJANGO_SECRET=django_secret_key
 ```
 3. Создайте или переместите сертификаты сайта в .nginx/certs
 ```bash
 cd ./scripts/
 ./OpenSSLSelfSign.sh
 #Сертификаты созданы в папке .output/
 #Сертификаты перемещены из output/ в ../.nginx/certs
 ```
 4. Запускайте контейнеры с корневой папки
 ```bash
 docker compose up -d --build
 ```
 Приложение будет доступно: 
 - В браузере сервера:`https://localhost`
 - По IP-адресу в локальной сети: `https://<IP_сервера>`


