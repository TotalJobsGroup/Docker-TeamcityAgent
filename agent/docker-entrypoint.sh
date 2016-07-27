#!/bin/sh

if [ ! -z "$TEAMCITY_SERVER" ] && [ ! -z "$TEAMCITY_NAME" ]; then
	sed -i "s~<teamcity_server>~"${TEAMCITY_SERVER}"~" /etc/teamcity-agent/buildAgent.properties
	sed -i "s~<teamcity_name>~"${TEAMCITY_NAME}"~" /etc/teamcity-agent/buildAgent.properties
fi

openrc boot
openrc sysinit
openrc -s docker start
exec "$TEAMCITY_AGENT_HOME/bin/agent.sh" run