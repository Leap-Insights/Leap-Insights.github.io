#!/bin/bash

## Update MEDIA/index.html

LINE=`cat index.html | grep -n '<h2> 2012 </h2>' | cut -d: -f1`
LINE=`expr $LINE + 2`
ENTRY='            <li> <a href=\"2012/gold.html\">The Gold Tax</a>, 27 March 2012. kw- gold import duty, loan-to-value ratio, gold loans. </li>'
sed "${LINE}i\            <li> <a href=\"2012/gold.html\">The Gold Tax</a>, 27 March 2012. kw- gold import duty, loan-to-value ratio, gold loans. </li>" index.html | less

