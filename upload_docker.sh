# Tag image
docker tag mock-api:$CIRCLE_SHA1 $DOCKER_USERNAME/mock-api:$CIRCLE_SHA1

# Login to docker-hub
docker login -u $DOCKER_USERNAME -p $DOCKER_PWD

# Push image
docker push $DOCKER_USERNAME/mock-api:$CIRCLE_SHA1
