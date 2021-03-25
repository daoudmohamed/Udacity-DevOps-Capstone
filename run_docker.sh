echo "sh1 ${CIRCLE_SHA1}"

# Build flask-app image
docker build --build-arg version=$CIRCLE_SHA1 -t mock-api:$CIRCLE_SHA1 .

# Run flask-app container
docker run -d -p 5000:5000 --name mock-api mock-api:$CIRCLE_SHA1

docker save -o image.tar mock-api
