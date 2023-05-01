# stable-diffusion-webui-rocm
A stable diffusion webui configuration for AMD ROCm

This docker container deploys an AMD ROCm 5.4.2 container based on ubuntu 22.04 with pyTorch 2.0. I has the custom version of AUTOMATIC1111 deployed to it so it is optimized for AMD GPUs. 

## Requirements 

* Working version of docker on 64-bit Linux. Need at least kernel 5.10 for AMD ROCm support. 
* AMD rocm modules drivers loaded. Recommended 5.4.2 to match current release. 
* Permissions to create and deploy docker containers

## docker-compose.yml

### Environment

|ENV Parameter| Default Value | Possible Values | Notes |
|:---| :----: | :----: |:--- |
|COMMANDLINE_ARGS|(empty)|(string)|
|PORT|7820|VALID TCP PORT NUMBER|


### Volumes 

|Default Volume Name| Container Path| Notes |
|:---| :----: | :--- |
|configs|/sd/configs| This does not include web-user.sh or web-ui.json. See Issue #3
|models|/sd/models| This directory can use lots of space. Plan accordingly|
|outputs|/sd/outputs|Location of saved generations goes|
|extensions|/sd/extensions| Installed custom extensions|
|plugins|/sd/plugins|Installed plugins|
