#!/bin/sh

set -e

DEPLOYMENT_STATUS_URL=https://api.github.com/repos/octodemo/azure-bookstore/deployments
TARGET_URL=https://bookstore-prod.azurewebsites.net
GITHUB_EVENT_PATH=event.json

DEPLOYMENT_REQUEST='{ "ref": "master", "environment": "production", "required_contexts": [], "description": "Deploy master to production"}'

curl -k -H "Authorization: token ${GITHUB_TOKEN}" -d "$DEPLOYMENT_REQUEST" $DEPLOYMENT_STATUS_URL > event.json

DEPLOYMENT_STATUS_URL=$(jq -r .statuses_url $GITHUB_EVENT_PATH)
echo $DEPLOYMENT_STATUS_URL

DEPLOYMENT_REQUEST=$( jq -n \
                  --arg url "$TARGET_URL" \
                  '{"state": "success", "description": "Deployed to production", "environment_url": $url}' )

curl -k -H "Authorization: token $GITHUB_TOKEN" -H "accept: application/vnd.github.ant-man-preview+json,application/vnd.github.flash-preview+json" -d "$DEPLOYMENT_REQUEST" $DEPLOYMENT_STATUS_URL
