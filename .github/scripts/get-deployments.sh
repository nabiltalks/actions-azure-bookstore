curl -v -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/${GITHUB_REPOSITORY}/deployments?ref=$(echo $GITHUB_REF | cut -f3 -d "/") > $HOME/deployments.json
