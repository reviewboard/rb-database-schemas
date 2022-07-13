#!/bin/sh

set -e

SITEDIR_NAME=sitedir
SITEDIR=/tmp/$SITEDIR_NAME

if [[ -e $SITEDIR ]]; then
    echo $SITEDIR exists. Please remove it before running this script.
    exit 1
fi

while true; do
    read -p "Type of database [mysql, postgres, sqlite3]: " DATABASE_TYPE
    case $DATABASE_TYPE in
        (mysql|postgres|sqlite3) break;;
        *) echo "Invalid database type.";;
    esac
done

if [[ $DATABASE_TYPE == "sqlite3" ]]; then
    DATABASE_HOST=""
    DATABASE_USER=""
    DATABASE_PASS=""
    DATABASE_NAME="reviewboard.db"
else
    read -p "Database hostname[:port]: " DATABASE_HOST
    read -p "Database username: " DATABASE_USER
    read -p "Database password: " DATABASE_PASS
    read -p "Database name: " DATABASE_NAME
fi

rb-site --version
rb-site install \
    --noinput \
    --admin-email=admin@example.com \
    --admin-password=admin \
    --admin-user=admin \
    --allowed-host=127.0.0.1 \
    --cache-info=localhost:11211 \
    --cache-type=memcached \
    --domain-name=example.com \
    --web-server-port=80 \
    --web-server-type=apache \
    --db-type=$DATABASE_TYPE \
    --db-host=$DATABASE_HOST \
    --db-name=$DATABASE_NAME \
    --db-user=$DATABASE_USER \
    --db-pass=$DATABASE_PASS \
    $SITEDIR

if [[ $DATABASE_TYPE == "sqlite3" ]]; then
    sed -i '' \
        -e "s/['\"]NAME['\"]: ['\"].*['\"]/"
            "'NAME': '$SITEDIR/data/reviewboard.db'/g" \
        $SITEDIR/conf/settings_local.py
else
    sed -i '' \
        -e "s/['\"]NAME['\"]: ['\"].*['\"]/'NAME': 'reviewboard'/g" \
        -e "s/['\"]USER['\"]: ['\"].*['\"]/'USER': 'reviewboard'/g" \
        -e "s/['\"]PASSWORD['\"]: ['\"].*['\"]/'PASSWORD': 'reviewboard'/g" \
        -e "s/['\"]HOST['\"]: ['\"].*['\"]/'PASSWORD': 'localhost'/g" \
        -e "g/['\"]PORT['\"]: \d\{1,\}'/d" \
        $SITEDIR/conf/settings_local.py
fi

SECRET_KEY=abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMN
sed -i '' \
    -e "s/SECRET_KEY = ['\"].*['\"]/SECRET_KEY = '$SECRET_KEY'/g" \
    $SITEDIR/conf/settings_local.py \

rm $SITEDIR/conf/cron.conf
rm -f $SITEDIR/conf/*.pyc
rm -rf $SITEDIR/conf/__pycache__
rm -f $SITEDIR/data/*.db
rm -f $SITEDIR/*.db
rm $SITEDIR/htdocs/static/{admin,djblets,lib,rb}

OLD_PWD=$PWD
TARBALL=$OLD_PWD/sitedir.tar.gz

cd $SITEDIR/..
tar -czvf $TARBALL $SITEDIR_NAME
rm -rf $SITEDIR
cd $OLD_PWD

echo Outputted $TARBALL
