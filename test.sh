#launch test
#webdriver-manager start

#pg_dump lynk  > ./test/be/lynk/server/frontend/sql/test.sql

export PGPASSWORD='florian';
DB_CONNECTION="psql -h 127.0.0.1 -U florian -d lynk -w"

echo "[EXPORT CURRENT DATABASE]"
pg_dump lynk  > ./test/be/lynk/server/frontend/sql/temp_export.sql

echo "[CLEAN DATABASE]"
echo "DROP SCHEMA public CASCADE;" | eval $DB_CONNECTION

echo "[CREATE SCHEMA]"
echo "CREATE SCHEMA public;" | eval $DB_CONNECTION

echo "[IMPORT TEST SHEMA]"
psql -h 127.0.0.1 -U florian -d lynk  < ./test/be/lynk/server/frontend/sql/test.sql

echo "[RUN TEST]"
protractor ./test/be/lynk/server/frontend/test.js

echo "[RESTORE OLD DATA]"
echo "DROP SCHEMA public CASCADE;" | eval $DB_CONNECTION
echo "CREATE SCHEMA public;" | eval $DB_CONNECTION
psql -h 127.0.0.1 -U florian -d lynk  < ./test/be/lynk/server/frontend/sql/temp_export.sql