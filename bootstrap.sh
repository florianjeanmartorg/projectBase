# DEV
export PGPASSWORD='florian';
DB_CONNECTION="psql -h localhost -p 5433 -U florian -d lynk -w"

echo "[DROP SCHEMA]"
echo "DROP SCHEMA public CASCADE;" | eval $DB_CONNECTION

echo "[CREATE SCHEMA]"
echo "CREATE SCHEMA public;" | eval $DB_CONNECTION

echo ""
echo "Run the app"
read dummyVar

# insert DB
echo "[CREATE LANGUAGE]"
eval $DB_CONNECTION < script/basic_data.sql

#import
curl -H "Content-Type: application/json" -X POST -d  '{"email":"florian.jeanmart@gmail.com","password":"password"}' http://localhost:9000/rest/import_category
curl -H "Content-Type: application/json" -X POST -d  '{"email":"florian.jeanmart@gmail.com","password":"password"}' http://localhost:9000/rest/import_demo
# curl -H "Content-Type: application/json" -X POST -d  '{"email":"florian.jeanmart@gmail.com","password":"password"}' http://localhost:9000/rest/generate_publication

echo "Done !"
