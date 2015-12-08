#!/usr/bin/env bash
echo ""
echo "!!! THIS IS PROD VERSION !!! ARE YOU SURE TO CONTINUE ???"
read dummyVar

echo "DEPLOYMENT START AT  ""$(date +"%H:%M:%S")"

echo "Run grunt"
grunt

NOW=$(date +"%Y%m%d%H%M")
sed -i 's/project.lastVersion=".*"/project.lastVersion="'$NOW'"/g' conf/application.conf

for old in public/dist/*.final.js; do
    new=$(echo $old | sed -e 's/final./'$NOW'.final./')
    mv -v "$old" "$new"
  done

for old in public/dist/*.final.css; do
    new=$(echo $old | sed -e 's/final./'$NOW'.final./')
    mv -v "$old" "$new"
  done

echo "rename package.json"
mv ./package.json ./-package.json

git add -A
git commit -m "pre-deploy"


mv ./-package.json ./package.json

find public/dist -maxdepth 1 -type f -exec rm {} \;


echo ""
echo "Deploy"
git push heroku-prod master
echo "DEPLOYMENT FINISHED AT  ""$(date +"%H:%M:%S")"

TAGNAME="prod_deployment_""$(date +"%y-%m-%d_%H-%M-%S")"
echo "create tag $TAGNAME"

git push
git tag "$TAGNAME"
git push origin --tags




