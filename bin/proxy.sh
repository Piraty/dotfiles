#!/bin/sh
# handle proxy environment variables

proxyAssign() {
	PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
	NOPROXY_ENV="no_proxy NO_PROXY"

	for envar in $PROXY_ENV ; do
		export $envar="$1"
	done
	for envar in $NOPROXY_ENV ; do
		export $envar="$2"
	done
}

proxyClear() {
	proxyAssign ""
}

proxySet() {
	echo -n "Server: " && read server
	echo -n "Port: " && read port
	echo -n "User: " && read user 
	echo -n "Password: " && read pass 

	proxy_value="http://${user}:${pass}@${server}:${port}"	
	no_proxy_value="localhost,127.0.0.1"

	proxyAssign $proxy_value $no_proxy_value
}
