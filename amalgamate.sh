#!/bin/bash

set -e

mkdir -p amalgamation
OUTPUT_PREFIX=amalgamation/miniz

cat miniz.h > $OUTPUT_PREFIX.h
cat miniz.c > $OUTPUT_PREFIX.c
cat miniz_common.h >> $OUTPUT_PREFIX.h
cat miniz_tdef.c >> $OUTPUT_PREFIX.c
cat miniz_tdef.h >> $OUTPUT_PREFIX.h
cat miniz_tinfl.c >> $OUTPUT_PREFIX.c
cat miniz_tinfl.h >> $OUTPUT_PREFIX.h
cat miniz_zip.c >> $OUTPUT_PREFIX.c
cat miniz_zip.h >> $OUTPUT_PREFIX.h


sed -i '0,/#include "miniz.h"/{s/#include "miniz.h"/#include  "miniz.h"/}' $OUTPUT_PREFIX.c
for i in miniz miniz_common miniz_tdef miniz_tinfl miniz_zip
do
	sed -i "s/#include \"$i.h\"//g" $OUTPUT_PREFIX.h
	sed -i "s/#include \"$i.h\"//g" $OUTPUT_PREFIX.c
done
