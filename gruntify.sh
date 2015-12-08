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



