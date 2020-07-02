#!/bin/sh

setup_git() {
  git config --global user.email "$EMAIL"
  git config --global user.name "Mojtaba Izadmehr"
}

commit_website_files() {
  git checkout master
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/m-izadmehr/playground.git > /dev/null 2>&1
  git push --set-upstream origin master
}

setup_git
commit_website_files
upload_files