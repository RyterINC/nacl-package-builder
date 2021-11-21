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
 1. Clone this repo
 2. `cd nacl-package-builder/docker`
 3. `bash package-retrieve.sh`
 4. You should have the `pynacl_layer.zip` in your current directory


## Cleanup:
```
docker kill ${CONTAINER_ID}
docker rm ${CONTAINER_ID}
docker rmi nacl:latest
```

## What went wrong

- Check that the container is running. 

- If the container is running and there was no package, `docker exec` into the container and try running the commands manually from the dockerfile. 

- If there is something wrong with the commands, let me know.




