#!/usr/bin/env bash
BRANCH="${1:-master}"
if [ "$BRANCH" == 'master' ] ; then
	docker build . -t stable-diffusion-webui-rocm
else
	docker build . -t stable-diffusion-webui-rocm:${BRANCH} --build-arg SD_BRANCH=${BRANCH}
fi