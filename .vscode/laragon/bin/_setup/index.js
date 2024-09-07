const path = require("path");
const fs = require("fs");

const rootPath = path.join(__dirname,'../../');

var data = fs.readFileSync(path.join(rootPath,'usr','laragon.ini'), "utf8").toString().split("\r\n");

var ressult = data.map(str => {
	if(str.startsWith("DataDir=")){
		return "DataDir="+path.join(rootPath, 'data');
	}
	else{
		return str;
	}
});

fs.writeFileSync(path.join(rootPath,'usr','laragon.ini'), ressult.join('\r\n'), {encoding: "utf8"});