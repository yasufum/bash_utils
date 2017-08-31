# switch proxy env
proxy() {
  if [ ! -z ${http_proxy} ]; then
    MY_HTTP_PROXY=${http_proxy}
  fi
  if [ ! -z ${https_proxy} ]; then
    MY_HTTPS_PROXY=${https_proxy}
  fi
  if [ ! -z ${no_proxy} ]; then
    MY_NO_PROXY=${no_proxy}
  fi

  if [ $# = 0 ]; then
    echo "Usage: proxy on|off"
    echo ""
    env | grep proxy
  elif [ $1 == "on" ]; then
    export http_proxy=${MY_HTTP_PROXY}
    export https_proxy=${MY_HTTPS_PROXY}
    export no_proxy=${MY_NO_PROXY}
  elif [ $1 == "off" ]; then
    export http_proxy=
    export https_proxy=
    export no_proxy=
  fi
}
