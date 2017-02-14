#!/bin/bash
set -ex

GIT_USER_NAME="rill-docs-ci"
GIT_USER_EMAIL="yutopp+rill-docs-ci@gmail.com"

PROJECT_USERNAME="yutopp"
PROJECT_REPONAME="rill-docs"
GIT_REPO="git@github.com:${PROJECT_USERNAME}/${PROJECT_REPONAME}.git"

WORK_DIR="_gh_pages"
if [ "${WORK_DIR}" == "" ]; then exit 1; fi

# make dir for gh-pages and clean files
if [ ! -e ${WORK_DIR} ]; then
    git clone -b gh-pages "${GIT_REPO}" ${WORK_DIR}
fi
rm -rf ${WORK_DIR}/*

# copy files which are generated
cp -r book/* ${WORK_DIR}/.

# push
cd ${WORK_DIR}
git config user.name "${GIT_USER_NAME}"
git config user.email "${GIT_USER_EMAIL}"
git add --all
git commit -m 'Update [ci skip]'
git push -f origin gh-pages
