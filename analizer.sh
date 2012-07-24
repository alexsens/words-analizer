#!/bin/bash
#English Words Analizer

TMP_FILE_1="$RANDOM".tmp
TMP_FILE_2="$RANDOM".tmp

##debug
#touch $TMP_FILE_1
#touch $TMP_FILE_2

SOURCE_FILE="../words/work/StarTrek-all-in-one"
INFO_FILE="$SOURCE_FILE".info;
FINAL_FILE="$SOURCE_FILE".final;

echo "$TMP_FILE_1"
echo "$TMP_FILE_2"
echo "$SOURCE_FILE"
echo "$INFO_FILE"
echo "$FINAL_FILE"
#wc $SOURCE_FILE > $INFO_FILE;
#echo -n "	newline, word, and byte counts in source file(wc output)";
#echo "\n" >> $INFO_FILE;
#
cat $SOURCE_FILE | tr -d "\'" > $TMP_FILE_1;				# Don't > Dont
cat $TMP_FILE_1 | tr -s '[:upper:]' '[:lower:]' > $TMP_FILE_2;	# Word > word
cat $TMP_FILE_2 | tr -s '[:punct:]' "\ " > $TMP_FILE_1;		# First sentense. Second sentence. > First sentense Second sentence
cat $TMP_FILE_1 | tr -s '[:space:]' "\n" > $TMP_FILE_2	;	# Word1 word2 > Word1
									#		word2

wc -l $TMP_FILE_2 >> $INFO_FILE;
echo -n "newline in final tmp file";
echo "\n"

cat "$TMP_FILE_2" | sort | uniq -c > "$FINAL_FILE";

exit 0;
