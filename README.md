[![Docker Pulls](https://img.shields.io/docker/pulls/anotherchris/teamcity-agent.svg?maxAge=2592000)](https://hub.docker.com/r/anotherchris/teamcity-agent/)

# Supported tags

- [`9.1.7`](https://github.com/TotalJobsGroup/Docker-TeamcityAgent/), [`latest`](https://github.com/TotalJobsGroup/Docker-TeamcityAgent/)

# Docker Teamcity Agent

This is a Teamcity agent based off Alpine Linux (for docker in docker support) with the following installed:

- Java 8 Open JDK
- AWS CLI
- Docker in Docker, allowing you to build Docker images on the agent.

*Note:* The image is currently referencing Dind (Docker-in-Docker) version 1.11. For `docker build` commands to work on the Teamcity agent, the host docker version must match the Dind version. If you are using a later version of Docker on your host such 1.12,  you will need to rebuild the image from the Github repository.

This repository is based off https://github.com/alonsodomin/docker-teamcity, plus other repositories that are referenced in the `agent/Dockerfile`.

## Starting the containers

The following command will start a TeamCity build agent:

```
docker run -d --name teamcity-agent1 --privileged -e TEAMCITY_SERVER=http://teamcity.mydomain.com:8500 -e TEAMCITY_NAME=my-agent-name anotherchris/teamcity-agent
```

You should then authorise the agent on your Teamcity server.
