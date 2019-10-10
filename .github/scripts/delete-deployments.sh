curl -v -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${GITHUB_REPOSITORY}/deployments?ref=$(echo $GITHUB_REF | cut -f3 -d "/") > deployments.json

jq -c 'map(select(.environment | contains ("test")))' deployments.json > test-deployments.json
