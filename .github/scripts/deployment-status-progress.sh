#!/bin/sh

set -e

DEPLOYMENT_STATUS_URL=$(jq -r .deployment.statuses_url $GITHUB_EVENT_PATH)
DEPLOYMENT_ENVIRONMENT=$(jq -r .deployment.environment $GITHUB_EVENT_PATH)

DESCRIPTION="Deploying to $DEPLOYMENT_ENVIRONMENT"
LOG_URL="https://github.com/$GITHUB_REPOSITORY/actions"

JSON_STRING=$( jq -n \
                  --arg desc "$DESCRIPTION" \
                  --arg url "$LOG_URL" \
                  '{"state": "in_progress", "description": $desc, "log_url": $url}' )

curl -k -H "Authorization: token $GITHUB_TOKEN" -H "accept: application/vnd.github.ant-man-preview+json,application/vnd.github.flash-preview+json" -d "$JSON_STRING" $DEPLOYMENT_STATUS_URL
