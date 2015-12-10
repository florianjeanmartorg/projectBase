#launch test
#webdriver-manager start

#pg_dump $DB_CONNECTION > ./test/be/lynk/server/frontend/sql/test.sql

export PGPASSWORD='florian';
DB_CONNECTION=" -h localhost -p 5433 -U florian -d test -w"

echo "[CLEAN DATABASE]"
echo "DROP SCHEMA public CASCADE;" | eval psql  $DB_CONNECTION

echo "[CREATE SCHEMA]"
echo "CREATE SCHEMA public;" | eval psql $DB_CONNECTION

echo "[IMPORT TEST SHEMA]"
psql $DB_CONNECTION  < ./test/be/lynk/server/frontend/sql/test.sql