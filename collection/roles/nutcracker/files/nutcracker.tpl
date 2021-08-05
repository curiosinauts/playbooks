{
  "service": {
    "id": "nutcracker",
    "name": "nutcracker",
    "tags": ["instance"],
    "address": "",
    "meta": {
      "meta": "instance"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 22221
      }
    },
    "port": 22221,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/local/bin/check_nutcracker.py"],
        "interval": "10s"
      }
    ]
  }
}