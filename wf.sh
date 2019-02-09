# word find

wf () {
  # set -x

  WF_HELP_MSG="Usage: wf [-i] [-c] [-d path] [-e ext] [b] word"

  # Backup previous OPTIND first because it must be set 1 while using getopts.
  # Without it, this command causes error if you use the command repeatedly.
  PREV_OPTIND=$OPTIND
  OPTIND=1

  WF_TARGET_DIR="."
  WF_COLOR_OPT=""
  WF_IGNORE_CASE=""
  WF_INCLUDE_BIN="-I"
  WF_EXCLUDE_EXT=""

  while getopts d:cie:bh opts; do
    case $opts in
      d)
        WF_TARGET_DIR=$OPTARG;
        ;;
      c)
        WF_COLOR_OPT="--color=always";
        ;;
      i)
        WF_IGNORE_CASE="-i";
        ;;
      e)
        WF_EXCLUDE_EXT="-not -name *.$OPTARG";
        ;;
      b)
        WF_INCLUDE_BIN=;
        ;;
      h)
        HELP_OPT=1;
        ;;
    esac
  done
  
  # Remove options from argments
  shift $(($OPTIND -1)) 
  WF_ARGNUM=$#  # WF_ARGNUM should be 1

  if [ ${WF_ARGNUM} -eq 0 ]; then
    echo ${WF_HELP_MSG}
  else
    find ${WF_TARGET_DIR} -type f ${WF_EXCLUDE_EXT} | \
        xargs egrep -n \
        ${WF_COLOR_OPT} ${WF_IGNORE_CASE} ${WF_INCLUDE_BIN} "$1"
  fi

  # Finally, restore the previous OPTIND.
  OPTIND=$PREV_OPTIND
  WF_TARGET_DIR=
  WF_COLOR_OPT=
  WF_IGNORE_CASE=
  WF_INCLUDE_BIN=
  WF_EXCLUDE_EXT=

  # set +x
}
