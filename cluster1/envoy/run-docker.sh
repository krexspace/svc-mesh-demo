docker stop envoysc
docker run -d --rm --name envoysc -p 8000:8000 -p 8081:8081 envoy:v1
