# word find
wf () {
  WF_HELP_MSG="Usage: wf [-i] [-c] [-d path] word"

  # Backup previous OPTIND first because it must be set 1 while using getopts.
  # Without it, this command causes error if you use the command repeatedly.
  PREV_OPTIND=$OPTIND
  OPTIND=1

  WF_COLOR_OPT=""
  WF_IGNORE_CASE=""

  while getopts d:cih opts; do
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
  elif [ ! ${WF_TARGET_DIR} = '' ]; then
    find ${WF_TARGET_DIR} -type f | xargs egrep -n ${WF_IGNORE_CASE} ${WF_COLOR_OPT} "$1"
  else
    find . -type f | xargs egrep -n ${WF_IGNORE_CASE} ${WF_COLOR_OPT} "$1"
  fi

  # Finally, restore the previous OPTIND.
  OPTIND=$PREV_OPTIND
  WF_COLOR_OPT=
  WF_IGNORE_CASE=
  WF_TARGET_DIR=
}
