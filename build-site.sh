#!/bin/bash
# Exit on error
set -e

OUR_GITHUB_API_PULLS_URL=https://api.github.com/repos/mysrcs/hugooooo/pulls
OUR_ACCEPT_HEADER="Accept: application/vnd.github+json"
OUR_AUTH_HEADER="Authorization: Bearer ${OUR_CI_TOKEN}"
OUR_EXAMPLES_REPO=mysrcs.github.io
OUR_EXAMPLES_USER=mysrcs
# OUR_EXAMPLES_ORG=mysrcs

if [[ "${GITHUB_ACTIONS}" = "true" ]]; then
  OUR_EXAMPLES_BRANCH=${GITHUB_HEAD_REF}
fi


USE_BASE_URL_SITE="/hugooooo/"
if [[ "${NETLIFY}" = "true" ]]; then
  echo -e "\033[0;32mNetlify detected, deployment happening at ${DEPLOY_PRIME_URL}...\033[0m"
  USE_BASE_URL_SITE="--baseURL ${DEPLOY_PRIME_URL}"
  if [[ "${PULL_REQUEST}" = "true" ]]; then
    echo -e "\033[0;32mDeploying a preview for a pull request in Netlify...\033[0m"
    # Getting repo information from the GitHub API
    # Useful to get the code examples from the right user (org) and repo
    REPO_INFO=$(curl -s -H ${OUR_ACCEPT_HEADER} -H ${OUR_AUTH_HEADER} ${OUR_GITHUB_API_PULLS_URL}/${REVIEW_ID})
    OUR_EXAMPLES_BRANCH=${HEAD}
    OUR_EXAMPLES_REPO=$(echo $REPO_INFO | jq -r .head.repo.name)
    OUR_EXAMPLES_USER=$(echo $REPO_INFO | jq -r .head.repo.owner.login)
  fi
fi

if [[ "${OUR_EXAMPLES_BRANCH}" = "" ]]; then
  echo -e "\033[0;32mEmpty OUR_EXAMPLES_BRANCH, setting to default...\033[0m"
  OUR_EXAMPLES_BRANCH=default
fi

echo -e "\033[0;32mDeleting Hugo previously generated directories...\033[0m"
rm -rf docs/public

echo -e "\033[0;32mSwitching to Docsy theme directory...\033[0m"
cd docs && npm install

echo -e "\033[0;32mGenerating Hugo site for website...\033[0m"
echo -e "\033[0;32mUsing OUR_EXAMPLES_REPO=${OUR_EXAMPLES_REPO} OUR_EXAMPLES_USER=${OUR_EXAMPLES_USER} OUR_EXAMPLES_BRANCH=${OUR_EXAMPLES_BRANCH} hugo --minify ${USE_BASE_URL_SITE}...\033[0m"
OUR_EXAMPLES_REPO=${OUR_EXAMPLES_REPO} OUR_EXAMPLES_USER=${OUR_EXAMPLES_USER} OUR_EXAMPLES_BRANCH=${OUR_EXAMPLES_BRANCH} hugo --minify ${USE_BASE_URL_SITE}

echo -e "\033[0;32mDone building site!\033[0m"
