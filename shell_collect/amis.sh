#!/bin/sh

# Run like ./amis-for-bamboo-version.sh 5.8.3

if [ $# -eq 0 ]; then
  echo "Usage: `basename $0` [5.8.3] (Your Bamboo version)"
  exit 0
fi

BAMBOO_VERSION=$1
echo For Bamboo version: $BAMBOO_VERSION
ELASTIC_VERSION="$(curl -v --silent https://maven.atlassian.com/content/groups/public/com/atlassian/bamboo/atlassian-bamboo/$BAMBOO_VERSION/atlassian-bamboo-$BAMBOO_VERSION.pom 2>&1 | grep \<elastic-image.version\> | sed -e 's/<[^>]*>//g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

echo "Elastic bamboo version is $ELASTIC_VERSION"

curl -v --silent https://maven.atlassian.com/content/groups/public/com/atlassian/bamboo/atlassian-bamboo-elastic-image/$ELASTIC_VERSION/atlassian-bamboo-elastic-image-$ELASTIC_VERSION.ami 2>&1 | grep image.
echo "REMEMBER: Use the image from the appropriate region!"