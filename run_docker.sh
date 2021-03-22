# Build flask-app image
docker build -t mock-api:$CIRCLE_BUILD_NUM .

# Run flask-app container
docker run -d -p 5000:5000 --name mock-api mock-api:$CIRCLE_BUILD_NUM
