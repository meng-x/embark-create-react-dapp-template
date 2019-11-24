name=$1
mkdir app
embark scaffold $@ 
mv app/*.js src/
echo "import $name from './$name';$(cat src/index.js)" > src/index.js 

sed -e "/<ul>/a\\
<li><Link to=\"/$name\">$name</Link></li>" < src/index.js > tmp_index.js

sed -e "/<Switch>/a\\
<Route exact path=\"/$name\"><$name /></Route>" < tmp_index.js > src/index.js

rm tmp_index.js
rm -rf app/


#embark run --nodashboard &

#npm start
