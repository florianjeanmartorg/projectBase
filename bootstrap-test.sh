# DEV
    export PGPASSWORD='florian';
    DB_CONNECTION="heroku pg:psql --app lynk-test DATABASE"

echo "[DROP SCHEMA]"
echo "DROP SCHEMA public CASCADE;" | eval $DB_CONNECTION

echo "[CREATE SCHEMA]"
echo "CREATE SCHEMA public;" | eval $DB_CONNECTION


echo ""
echo "Deploy"
./deploy.sh

echo "open in navigator"
xdg-open http://lynk-test.herokuapp.com/

echo "wait 1 minute to be sure the database is created"
sleep 60

# insert DB
echo "[CREATE LANGUAGE]"
eval $DB_CONNECTION < script/basic_data.sql

#import
curl -H "Content-Type: application/json" -X POST -d  '{"email":"florian.jeanmart@gmail.com","password":"password"}' https://lynk-test.herokuapp.com/rest/import_category
curl -H "Content-Type: application/json" -X POST -d  '{"email":"florian.jeanmart@gmail.com","password":"password"}' https://lynk-test.herokuapp.com/rest/import_demo

echo "Done !"
