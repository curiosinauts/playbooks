{
  "service": {
    "id": "neo4j",
    "name": "neo4j",
    "tags": ["graphdb"],
    "address": "",
    "meta": {
      "meta": "graphdb"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 7474
      }
    },
    "port": 7474,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/bin/curl", "-f", "-s", "-I", "http://0.0.0.0:7474"],
        "interval": "10s"
      }
    ]
  }
}