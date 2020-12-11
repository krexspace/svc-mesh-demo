FROM envoyproxy/envoy-dev:latest
RUN apt-get update && apt-get -q install -y \
    curl
COPY ./envoy-conf.yaml /etc/envoy-conf.yaml
RUN chmod go+r /etc/envoy-conf.yaml
CMD ["/usr/local/bin/envoy", "-c", "/etc/envoy-conf.yaml", "--service-cluster", "front-proxy"]

