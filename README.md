[![Docker Pulls](https://img.shields.io/docker/pulls/anotherchris/teamcity-agent.svg?maxAge=2592000)](https://hub.docker.com/r/anotherchris/teamcity-agent/)

# Supported tags

- [`9.1.7`](https://github.com/TotalJobsGroup/Docker-TeamcityAgent/), [`latest`](https://github.com/TotalJobsGroup/Docker-TeamcityAgent/)

# Docker Teamcity Agent

This is a Teamcity agent based off Alpine Linux (for docker in docker support) with the following installed:

- Java 8 Open JDK
- AWS CLI
- Docker in Docker, allowing you to build Docker images on the agent.

This repository is based off https://github.com/alonsodomin/docker-teamcity, plus other repositories that are referenced in the `agent/Dockerfile`.

## Starting the containers

The following command will start a TeamCity build agent:

```
docker run -d --name teamcity-agent1 --privileged -e TEAMCITY_SERVER=http://teamcity.mydomain.com:8500 -e TEAMCITY_NAME=my-agent-name anotherchris/teamcity-tagent
```

You should then authorise the agent on your Teamcity server.
