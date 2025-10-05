#!/usr/bin/env bash
# TODO: CHANGE TERRIBLE NAME
#  = find good analogy
# "Linux gp5 to 'phone-score'

## Construct Tg-2-Gp5_Scheme (i.e. editing and saving gp5-files on Linux Desktop)  ____ ____
##   open .gp5-score/scores in phone-scores dir (to be updated) with Tuxguitar
##   - make changes/additions to the score(s)
##   - save open file(s) (as .tg-file) to processdir (in the phone-scores directory)
##   - batch-convert the .tg-file(s) (in process-dir) to .gp5 with Tuxguitar
##   ====
##   - run update-latest-phonescore.sh
##   ----
##   for each .tg-file in process-dir
##     - get base-name of file (.tg and/or .gp5)
##     ## - rename .gp5-file with the same base-name (in phone-score dir) to 'base-name + .orig + .gp5
##     - remove file with the same name in phone-scores dir
##     - move file up to phone-scores dir
##   - delete files in process-dir
