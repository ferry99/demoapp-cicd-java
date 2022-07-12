REPOSITORIES=`pwd`

echo "Updating $REPOSITORIES at `date`"

VERSION=`cat ./.env | grep VERSION= | cut -d '=' -f2`

echo $VERSION

docker-compose -f docker-compose-prod.yml up -d

# docker run -d -p 8181:9999 ferry9999/demoapp:v1.0.0-M.4 /bin/bash -c 'java -jar demoapp-v1.0.0-M.4.jar'