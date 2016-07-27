FROM docker
MAINTAINER Chris Small "chris.small@totaljobsgroup.com"

#
# Java
# (from https://github.com/docker-library/openjdk/blob/54c64cf47d2b705418feb68b811419a223c5a040/8-jre/alpine/Dockerfile)
#
ENV LANG C.UTF-8

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u92
ENV JAVA_ALPINE_VERSION 8.92.14-r1

RUN set -x \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache \
		openjdk8-jre="$JAVA_ALPINE_VERSION" \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

#
# AWS CLI (Using Python and PIP)
#
RUN apk add python py-pip
RUN pip install awscli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest \
	&& chmod +x /usr/local/bin/ecs-cli

# Add openrc so the docker daemon runs
RUN apk add openrc && apk add iptables

# Re-add Docker for the service registration
RUN apk add docker

#
# Teamcity agent
#
RUN mkdir -p /opt/lib/teamcity-agent

ENV TEAMCITY_VERSION 9.1.7
ENV TEAMCITY_AGENT_HOME /opt/lib/teamcity-agent

RUN mkdir -p /etc/teamcity-agent

COPY conf/* /etc/teamcity-agent/
COPY buildAgent.zip /tmp/buildAgent.zip
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN unzip -qq /tmp/buildAgent.zip -d $TEAMCITY_AGENT_HOME && \
    chmod +x $TEAMCITY_AGENT_HOME/bin/*.sh && \
    rm -f $TEAMCITY_AGENT_HOME/conf/buildAgent.properties && \
    ln -s /etc/teamcity-agent/buildAgent.properties $TEAMCITY_AGENT_HOME/conf/buildAgent.properties && \
    rm -fR /tmp/*

EXPOSE 9090
VOLUME [ "/etc/teamcity-agent" ]
WORKDIR /opt/lib/teamcity-agent
ENTRYPOINT [ "/docker-entrypoint.sh" ]