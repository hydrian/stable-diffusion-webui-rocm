# stable-diffusion-webui-rocm
A stable diffusion webui configuration for AMD ROCm

This docker container deploys an AMD ROCm 5.4.2 container based on ubuntu 22.04 with pyTorch 2.0. I has the custom version of AUTOMATIC1111 deployed to it so it is optimized for AMD GPUs. 

## Requirements 

* Working version of docker on 64-bit Linux. Need at least kernel 5.10 for AMD ROCm support. 
* AMD rocm modules drivers loaded. Recommended 5.4.2 to match current release. 
* Permissions to create and deploy docker containers

## docker-compose.yml

### Environment

|ENV Pame| Default Value | Possible Values | Notes |
|:---| :----: | :----: |:--- |
|PORT| 7820 | Any port about 1024-65565| |
|EXTRA_ARGS| (blank) | Valid stable-diffusion-webui launch parameters| |
