var gulp = require("gulp"),
	concat = require("gulp-concat"),
	uglify = require("gulp-uglify");
var scripts = ["static/js/jquery.js", "static/js/bootstrap.js", "static/js/processing-1.4.1.js"];

gulp.task("default", function () {
	return gulp.src(scripts)
		.pipe(uglify({mangle:false}))
		.pipe(concat("all.min.js"))
		.pipe(gulp.dest("static/js"));
});
