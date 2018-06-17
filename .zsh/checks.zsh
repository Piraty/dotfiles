# detect OS
case "$(uname -s)" in
	Linux*) IS_LINUX=1 ;;
	Darwin*) IS_MAC=1 ;;
	CYGWIN*|MINGW*|MSYS*) IS_WINDOWS=1 ;;
	Haiku*) IS_HAIKU=1 ;;
esac

# detect package managers
if [[ -x `which brew` ]]; then
    HAS_BREW=1
fi

if [[ -x `which apt-get` ]]; then
    HAS_APT=1
fi

if [[ -x `which yum` ]]; then
    HAS_YUM=1
fi

if [[ -x `which xbps-install` ]]; then
    HAS_XBPS=1
fi
