docker stop envoysc
docker run -d --rm --name envoysc -p 22020:20202 -p 9901:9901 envoy:v1
