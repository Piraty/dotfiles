#!/bin/sh
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlinefu-explained)
# displays mounted drive information in a nicely formatted manner
nicemount() {
	(
		echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1'
	) | column -t
}
