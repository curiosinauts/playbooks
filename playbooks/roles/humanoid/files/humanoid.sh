#!/bin/sh

export SLACK_BOT_USER_OAUTH_ACCESS_TOKEN=$(cat /etc/humanoid.d/bot_access_token)

export SLACK_BOT_MEMBER_ID=$(cat /etc/humanoid.d/bot_member_id)

export SLACK_BOT_DEBUG=true

/usr/local/bin/humanoid