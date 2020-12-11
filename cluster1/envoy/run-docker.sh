#!/bin/bash
docker run -d --name envoy-side-car -p 22020:22020 -p 9901:9901 envoy:v1