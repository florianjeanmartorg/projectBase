
export dep_instance=gling-prod

export NOW=$(date '+%Y%m%d_%H%M%S')


db_url="$(heroku config:get DATABASE_URL -a $dep_instance)"

proto="$(echo $db_url | grep :// | sed -e's,^\(.*://\).*,\1,g')"
url="$(echo ${db_url/$proto/})"
user_with_pass="$(echo $url | grep @ | cut -d@ -f1)"
host_with_port="$(echo ${url/$user_with_pass@/} | cut -d/ -f1)"
path="$(echo $url | grep / | cut -d/ -f2-)"
user="$(echo $user_with_pass | cut -d: -f1)"
pass="$(echo $user_with_pass | cut -d: -f2)"
host="$(echo $host_with_port | cut -d: -f1)"
port="$(echo $host_with_port | cut -d: -f2)"

dump_file="./dump_${dep_instance}_${NOW}.secret.sql"

info -n "Dumping database of instance [$dep_instance] into [$dump_file]... "

export PGPASSWORD=$pass
pg_dump \
--no-privileges \
--no-owner \
--no-reconnect \
-h $host \
-p $port \
-d $path \
-U $user \
-w \
> $dump_file

DB_CONNECTION="psql -U florian -d lynk -w"

echo "[DROP SCHEMA]"
echo "DROP SCHEMA public CASCADE;" | eval $DB_CONNECTION

echo "[CREATE SCHEMA]"
echo "CREATE SCHEMA public;" | eval $DB_CONNECTION


echo "[IMPORT TEST SHEMA]"
$DB_CONNECTION  < $dump_file
