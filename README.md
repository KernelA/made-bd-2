# HW02 Hive

[Описание заданий](https://github.com/netcitizenrus/MADE_BigData_2021/blob/fe2e1a0143a8a175e2b42a756fd433aea7db4dc1/HW2%20-%20Hive.pdf)

## Блок 1 Развёртывание Hive

[Скриншоты Hive с Hue](images/README.md)

## Бок 2 Работа с Hive

### Создание таблицы и загрузка данных

[SQL DDL](queries/create_and_load.sql)

### Запросы

Максимальное число скробблов:
* [Запрос](queries/max_scrobbles.sql)
* [Результат](output/query1.txt)

Самый популярный тег:
* [Запрос](queries/most_pop_tag.sql)
* [Результат](output/query2.txt)

Самый популярные исполнители 10 самых популярных тегов:
* [Запрос](queries/most_pop_art_by_tags.sql)
* [Результат](output/query3.txt)

Инсайт. Поиск наиболее похожих K пар исполнителей на основании числа совпадающих тегов среди top N исполнителей. На основании такого запроса можно построить граф наиболее похожих исполнителей по тегам и дальше его анализировать.
* [Запрос](queries/most_sim_artists_by_tag.sql)
* [Результат (представлена только часть результат)](output/query4.txt)


## Как запустить

[Скачать данные](https://www.kaggle.com/pieca111/music-artists-popularity), распаковать и добавить в директорию `data`.

Выполнить команду:
```
docker-compose up --build
```

Дождаться завершение инициализации СУБД и остальных сервисов. Зайти по адресу [http://localhost:8888/](http://localhost:8888/)
