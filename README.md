### NACL package builder

In response to this blog post regarding building a discord bot using lambda and aws api gateway:
https://oozio.medium.com/serverless-discord-bot-55f95f26f743

I created a docker environment using amazon linux in order to build the nacl package. 

When attempting to build the package locally, discord was generating an error and logs from lambda were also generating errors
regarding the zip package I uploaded. Upon further investigation, I found out this package had to be built in an amazon linux
environment. 

## Requirements

You must have docker installed on your local machine

## Steps:
Clone this repo, then run these commands:
```
cd docker
docker build -t nacl:latest .
docker run -d --name nacl nacl:test
CURRENT_DIR=$(pwd)
docker run -d -v ${CURRENT_DIR}:/tmp/ --name nacl nacl:latest
CONTAINER_ID=$(docker run -d --name nacl nacl:test 2>&1)
docker cp ${CONTAINER_ID}:/tmp/pynacl_layer.zip .
```
these commands will copy the `pynacl_layer.zip` package into your current directory. You will need to upload this as a layer for your lambda function as documented in the blog post. 


