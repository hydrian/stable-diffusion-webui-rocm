# stable-diffusion-webui-rocm
A stable diffusion webui configuration for AMD ROCm. This only developed to run on Linux because ROCm is only officially supported on Linux. 

This docker container deploys an AMD ROCm 5.4.2 container based on ubuntu 22.04 with pyTorch 2.0. I has the custom version of AUTOMATIC1111 deployed to it so it is optimized for AMD GPUs. 

## Requirements 

* Working version of docker on 64-bit Linux. Need at least kernel 5.10 for AMD ROCm support. 
* AMD rocm modules drivers loaded. Recommended 5.4.2 to match current release. 
* Permissions to create and deploy docker containers

## Build and Deployment

There is currently no dockerhub entry for this yet, so you have to build the docker image for yourself. 

### Recommended Build/Deployment Process

1. Change directory to the git clone of stable-diffusion-webui-rocm
2. Run on the command `docker build . -t stable-diffusion-webui-rocm5.4`
3. Wait for build to complete. 
4. Verify docker-compose.yml meets your environment need
5. Run command `docker-compose up`
6. Wait for deploy to complete
7. Browse to http://localhost:7820/



## docker-compose.yml

### Environment

|ENV Parameter| Default Value | Possible Values | Notes |
|:---| :----: | :----: |:--- |
|COMMANDLINE_ARGS|(empty)|(string)|
|PORT|7820|VALID TCP PORT NUMBER|


### Volumes 

|Default Volume Name| Container Path| Notes |
|:---| :----: | :--- |
|configs|/sd/configs| This does not include web-user.sh or web-ui.json. See Issue #3.
|models|/sd/models| This directory can use lots of space. Plan accordingly|
|outputs|/sd/outputs|Location of saved generations goes|
|extensions|/sd/extensions| Installed custom extensions|
|plugins|/sd/plugins|Installed plugins|
