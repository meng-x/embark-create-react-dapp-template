name=$1
mkdir app
embark scaffold $name devicename:string sensor1:uint256 sensor2:string currentStream:ipfsImage
mv app/*.js src/
echo -e "import $name from './$name';\n$(cat src/index.js)" > src/index.js 

sed -e "/<ul>/a\\
<li><Link to=\"/$name\">$name</Link></li>" < src/index.js > tmp_index.js

sed -e "/<Switch>/a\\
<Route exact path=\"/$name\"><$name /></Route>" < tmp_index.js > src/index.js

rm tmp_index.js
rm -rf app/


embark run --nodashboard &

npm start
