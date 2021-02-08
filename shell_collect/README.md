## collection of shell scripts scripts

### 1: SSL certificate checking  
https://www.holylinux.net/content/bash-script-check-ssl-certificates-expiration 


```

show_ssl_expire [-h] [-c] [-d DAYS] [-f FILENAME] | [-w WEBSITE] | [-s SITELIST]

Retrieve the expiration date(s) on SSL certificate(s) using OpenSSL.

Usage:
    -h  Help

    -c  Color output

    -d  Amount of days to show warnings (default is 30 days)
        Example: -d 15

    -f  SSL date from FILENAME
        Example: -f /home/user/example.pem

    -w  SSL date from SITE(:PORT) (Port defaults to 443)
        Example: -w www.example.com

    -s  SSL date(s) from SITELIST
        Example:      -s ./websites.txt
        List format:  sub.domain.tld:993 (one per line - port optional)

Example:
    $ show_ssl_expire -c -d 14 -s ./websites.txt

    WARNS (in color) if within 14 days of expiring on each entry in the file list.
    
 ```
 
 ### 2: curl 
 
 ```
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

```
 
