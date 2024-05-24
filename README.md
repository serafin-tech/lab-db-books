# lab-db-books

żródło danych: [Kaggle](https://www.kaggle.com/datasets/arashnic/book-recommendation-dataset)

## Struktura tabel

### `books`

| pole                | typ          | extra                       |
|---------------------|--------------|-----------------------------|
| id_book             | int          | primary_key, auto_increment |
| isbn                | char(16)     |                             |
| book_title          | varchar(256) |                             |
| book_author         | varchar(64)  |                             |
| year_of_publication | year         |                             |
| publisher           | varchar(64)  |                             |
| image_url_s         | varchar(128) |                             |
| image_url_m         | varchar(128) |                             |
| image_url_l         | varchar(128) |                             |

### `ratings`

| pole        | typ         | extra                       |
|-------------|-------------|-----------------------------|
| id_rating   | int         | primary_key, auto_increment |
| user_id     | varchar(45) |                             |
| isbn        | char(16)    |                             |
| book_rating | int         |                             |

## Import danych

Sugerowane narzędzie do importu: https://github.com/serafin-tech/mysql-csv-import

Polecenia:

```sh
export DBHOST=fqdn.bazy.danych
export DBUSER=user
export DBPASS=password
export DBNAME=lab-db

python ./mysql-csv-import.py -f Books.csv -D $DBNAME -t books -H $DBHOST -u $DBUSER -p $DBPASS
python ./mysql-csv-import.py -f Ratings_small.csv -D $DBNAME -t ratings -H $DBHOST -u $DBUSER -p $DBPASS
```

## Zadania

Dla książek z bazy policzyć:

1. ilość książek danego wydawcy,
2. ilość ocen,
3. średnią ocen,
4. histogram ocen.

Zadanie dodatkowe: pobrać i zaimportować cały dataset źródłowy.
