# docker-yeoman
Ubuntu 14.04 image with node.js (nvm), Grunt, Gulp, &amp; Compass and a selection of yeoman generators

## Description

**This image currently contains the following Yeoman packages:**
* [fountain.js](https://github.com/FountainJS/generator-fountain-webapp)
* [generator-gulp-angular](https://github.com/Swiip/generator-gulp-angular)
* [generator-angular](https://github.com/yeoman/generator-angular)
* [generator-webapp](https://github.com/yeoman/generator-webapp)

**Includes:**

* Node.js (nvm)
* Compass/Sass
* Ruby
* Gulp
* Grunt
* Bower

**Usage:**

This command: "$ docker run -it -p 9000:9000 -p 35729:35729 -p 3000:3000 --rm -v $(pwd):/app ejahn/yeoman"
* Starts the container
* Maps the exposed server- and livereload ports
* Mounts the working directory to your current local directory

You may set the server-ip in your Grunt-/Gulpfile to '0.0.0.0' to access it from outside.
