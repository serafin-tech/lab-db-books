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

Polecenia (należy podać właściwe wartości zmiennych):

```sh
cat > .env <<EOT
DB_HOST=fqdn.bazy.danych
DB_USER=user
DB_PASS=password
DB_NAME=books-db
EOT

mysql-csv-import -f Books_small.csv -D books-db -t books
mysql-csv-import -f Ratings_small.csv -D books-db -t ratings
```

ewentualnie można użyć skryptu: [import-books-db.sh](import-books-db.sh)

```sh
curl -s https://raw.githubusercontent.com/serafin-tech/lab-db-books/main/import-books-db.sh | bash
```

## Zadania

Dla książek z bazy policzyć:

1. ilość książek danego wydawcy,
2. ilość ocen,
3. średnią ocen dla książki,
4. histogram ocen dla książki.

Zadanie dodatkowe: pobrać i zaimportować cały dataset źródłowy.
