{
  "service": {
    "id": "prometheus",
    "name": "prometheus",
    "tags": ["monitoring"],
    "address": "",
    "meta": {
      "meta": "monitoring"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 9090
      }
    },
    "port": 9090,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/bin/curl", "-f", "-s", "-X", "GET", "-I", "http://0.0.0.0:9090/graph"],
        "interval": "10s"
      }
    ]
  }
}