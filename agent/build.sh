echo "Building and pushing to https://hub.docker.com/r/anotherchris/teamcity-agent/"
docker build -t anotherchris/teamcity-agent:latest -t anotherchris/teamcity-agent:9.1.7 .
docker login
docker push anotherchris/teamcity-agent:latest
