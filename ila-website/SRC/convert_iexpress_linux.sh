#!/bin/bash

# Check for arguments
if [ $# -eq 0 ] ; then
	echo -e "Usage: `basename $0` -i URL -o OUTPUT_FILE -d \"DATE\""
    echo -e "Example: `basename $0` -i http://www.indianexpress.com/news/towards-climate-change/976239/0 -o output.html -d \"27th July 2012\"\n"
    exit
fi

while getopts "i:o:d:" Option
do
	case $Option in
		i	) INPUT_URL=${OPTARG} ;
				;;
		o	) OUTPUT=${OPTARG} ;
				;;
		d	) DATEARG=${OPTARG} ;
				;;
		*	) echo -e "Incorrect arguments, exiting..." ;
				exit
				;;
	esac
done

pushd /tmp
wget -q -O article.html $INPUT_URL || exit

INPUT="article.html"

# Fetch the raw text
echo "== Reading raw HTML"
echo "== Finding title"
TITLE=`grep -i '[<]h1' $INPUT | sed 's/<[/]\?[A-Z|a-z|0-9]*[^>]*>//g'`
START_LINE=`grep -n "contentLeftbigstory" $INPUT | cut -d: -f1`
END_LINE=`grep -n "paginationNew" $INPUT | cut -d: -f1`
RAW_TEXT=`sed -n "${START_LINE},${END_LINE}p" $INPUT`

# Process the text
echo "== Filtering text"
FILTERED_TEXT=`echo -e "$RAW_TEXT" | sed 's/<p>/\n<p>/g'`
TOTAL_LINES=`echo -e "$FILTERED_TEXT" | wc -l`
LINES_TO_KEEP=`expr $TOTAL_LINES - 3`
echo "== Keeping content"
CONTENT=`echo -e "$FILTERED_TEXT" | head -n ${LINES_TO_KEEP}`

echo "== Removing temporary files"
rm -f article.html
popd

echo "== Generating output"

cat << EOF > ${OUTPUT}

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
  <title>
    `echo "$TITLE"`
  </title>
  <link rev="made" href="mailto:ilapatnaik@gmail.com">
</head>

<body><blockquote>

<h1>
  `echo "$TITLE"`
</h1>

<hr>
<p><i>Indian Express</i>, `echo "$DATEARG"`</p>
<hr>

`echo -e "$CONTENT"`

<hr>
<p>Back up to <a href="../index.html">Ila Patnaik's media page</a><br>
Back up to <a href="http://openlib.org/home/ila">Ila Patnaik's home page</a></p>

</blockquote></body>
</html>

EOF

echo "== Output is saved inside ${OUTPUT}."

