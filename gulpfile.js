var gulp = require('gulp');
var htmlmin = require('gulp-htmlmin');
var uglify = require('gulp-uglify');

gulp.task('minify-html', function() {
  return gulp.src('public/**/*.html')
    .pipe(htmlmin({collapseWhitespace: true}))
    .pipe(gulp.dest('public'))
});

gulp.task('minify-js', function() {
    return gulp.src(['public/js/**/*.js'])
        .pipe(uglify())
        .pipe(gulp.dest('public/js'));
});

gulp.task('default', ['minify-html', 'minify-js'], function() {});
