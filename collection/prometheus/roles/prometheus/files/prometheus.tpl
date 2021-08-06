{
  "service": {
    "id": "prometheus-__uuid__",
    "name": "prometheus",
    "tags": ["urlprefix-prometheus.7onetella.net/"],
    "address": "",
    "meta": {
      "meta": "monitoring"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": __port__
      }
    },
    "port": __port__,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/bin/curl", "-f", "-s", "-X", "GET", "-I", "http://0.0.0.0:9090/graph"],
        "interval": "10s"
      }
    ]
  }
}