{
  "service": {
    "id": "graphite",
    "name": "graphite",
    "tags": ["metrics"],
    "address": "",
    "meta": {
      "meta": "metrics"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 8000
      }
    },
    "port": 8000,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/bin/curl", "-f", "-s", "-I", "http://0.0.0.0:8000"],
        "interval": "10s"
      }
    ]
  }
}