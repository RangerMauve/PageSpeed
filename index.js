var express = require("express"),
	path = require("path"),
	fs = require("fs"),
	app = express(),
	server = require("http").createServer(app),
	fileroot = path.join(__dirname, "static");

app.use(express.logger("short"));
app.use(express.static(fileroot));
app.use("/compressed", express.compress());
app.use("/compressed", express.static(fileroot));

server.listen(8080);

function sendFile(name, res) {
	fs.createReadStream(path.join(__dirname, "/static", name)).pipe(res);
}
