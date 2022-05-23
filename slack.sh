######
# Send notification messages to a Slack channel by using Slack webhook
# 
# input parameters:
#   $1 - message level: 'INFO' | 'WARN' | 'ERROR'
#   $2 - pretext
#   $3 - main text
######
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/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
SLACK_CHANNEL=nothing

send_notification() {
  local color='good'
  if [ $1 == 'ERROR' ]; then
    color='danger'
  elif [ $1 == 'WARN' ]; then
    color = 'warning'
  fi
  local message="payload={\"channel\": \"#$SLACK_CHANNEL\",\"attachments\":[{\"pretext\":\"$2\",\"text\":\"$3\",\"color\":\"$color\"}]}"

  curl -X POST --data-urlencode "$message" ${SLACK_WEBHOOK_URL}
}
send_notification 'ERROR' "Message Title" "some long text message"
