#!/usr/bin/env bash

set -eux
set -o pipefail

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'

function finish {
  echo -e "${RED}finished with some issue.${NOCOLOR}"
}

function echo_green {
  echo -e "${GREEN}$1${NOCOLOR}"
}

trap finish SIGINT SIGABRT SIGTERM

echo_green "======================================="
echo_green "=== PRZYGOTOWANIE DANYCH I NARZEDZI ==="
echo_green "======================================="

git clone https://github.com/serafin-tech/lab-db-books

git clone https://github.com/serafin-tech/mysql-csv-import

mysql-csv-import/buildme.sh

pip install mysql-csv-import/dist/mysql_csv_import-*.whl

echo_green "==========================================="
echo_green "=== PRZYGOTOWANIE DOCELOWEJ BAZY DANYCH ==="
echo_green "==========================================="

mysql-csv-import -f lab-db-books/Books_small.csv -D books-db -t books
mysql-csv-import -f lab-db-books/Ratings_small.csv -D books-db -t ratings
