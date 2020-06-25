{
  "service": {
    "id": "jenkins",
    "name": "jenkins",
    "tags": ["buids"],
    "address": "",
    "meta": {
      "meta": "buids"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 8080
      }
    },
    "port": 8080,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/bin/curl", "-f", "-s", "-I", "http://0.0.0.0:8080"],
        "interval": "10s"
      }
    ]
  }
}