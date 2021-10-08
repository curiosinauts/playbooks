{
  "service": {
    "id": "grafana-__uuid__",
    "name": "grafana",
    "tags": ["urlprefix-grafana.7onetella.net/"],
    "address": "",
    "meta": {
      "meta": "metrics"
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
        "args": ["/usr/bin/curl", "-f", "-s", "-I", "http://0.0.0.0:3000"],
        "interval": "10s"
      }
    ]
  }
}