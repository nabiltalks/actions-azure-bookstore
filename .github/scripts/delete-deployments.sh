curl -v -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${GITHUB_REPOSITORY}/deployments?ref=$(echo $GITHUB_HEAD_REF | cut -f3 -d "/") > deployments.json

jq -r 'map(select(.environment | contains ("test"))) | .[].statuses_url' deployments.json | xargs curl -v -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.ant-man-preview+json" -d '{"state": "inactive"}'
