= README
== Как запустить проект?

Проект написан на языке Ruby с использованием Ruby On Rails.

Для корректной работы нужно иметь установленную ruby

В текущий момент используется версия 2.2.1

Для начала нужно подтянуть зависимости командой `bundle install`

Затем нужно скопировать config/database.yml.dist в config/database.yml и подредактировать его

Создаем таблицу командой `rake db:create`

Запускаем миграции `rake db:migrate`

Добавляем данные `rake db:seed`

Для запуска используем команду `rails server`

для входа в админ панель используются следующие данные admin@example.com, пароль: password
(если в базе данных никого нет, просто делаем еще раз `rake db:seed`)

== Зависимости

* ...

== Как запускать тесты

* ...



== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.