#launch test
#webdriver-manager start

#pg_dump $DB_CONNECTION > ./test/be/lynk/server/frontend/sql/test.sql

export PGPASSWORD='florian';
DB_CONNECTION=" -h localhost -p 5433 -U florian -d test -w"

echo "[EXPORT CURRENT DATABASE]"
pg_dump $DB_CONNECTION  > ./test/be/lynk/server/frontend/sql/temp_export.sql

echo "[CLEAN DATABASE]"
echo "DROP SCHEMA public CASCADE;" | eval psql  $DB_CONNECTION

echo "[CREATE SCHEMA]"
echo "CREATE SCHEMA public;" | eval psql $DB_CONNECTION

echo "[IMPORT TEST SHEMA]"
psql $DB_CONNECTION  < ./test/be/lynk/server/frontend/sql/test.sql

echo "[RUN TEST]"
protractor ./test/be/lynk/server/frontend/test.js

echo "[RESTORE OLD DATA]"
echo "DROP SCHEMA public CASCADE;" | eval psql $DB_CONNECTION
echo "CREATE SCHEMA public;" | eval psql $DB_CONNECTION
psql $DB_CONNECTION  < ./test/be/lynk/server/frontend/sql/temp_export.sql