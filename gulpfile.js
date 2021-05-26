var gulp = require('gulp');
var postcss = require('gulp-postcss');
var autoprefixer = require('autoprefixer');
var cssnano = require('gulp-cssnano');

function defaultTask(cb) {
    cb();
}

const { series } = require('gulp');

function printText(cb) {

    console.log("ciao sono la stampante");
    cb();
}

gulp.task('css', function () {
    const postcss = require('gulp-postcss')

    return gulp.src('web/styles/*.css')
        .pipe(postcss([
            require('tailwindcss'),
            require('autoprefixer'),
        ]))
        .pipe(cssnano())
        .pipe(gulp.dest('web/styles/output'))
})

gulp.task('watch', function() {
    gulp.watch('web/styles/*.css', gulp.series('css'));
});

exports.printText = printText;
exports.default = series(defaultTask, printText);