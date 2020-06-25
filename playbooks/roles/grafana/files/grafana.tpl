{
  "service": {
    "id": "grafana",
    "name": "grafana",
    "tags": ["metrics"],
    "address": "",
    "meta": {
      "meta": "metrics"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 3000
      }
    },
    "port": 3000,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/bin/curl", "-f", "-s", "-I", "http://0.0.0.0:3000"],
        "interval": "10s"
      }
    ]
  }
}