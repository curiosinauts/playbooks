{
  "service": {
    "id": "jupyterlab",
    "name": "jupyterlab",
    "tags": ["urlprefix-jupyterlab.7onetella.net/"],
    "address": "",
    "meta": {
      "meta": "data science"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 8888
      }
    },
    "port": 8888,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["echo", "up"],
        "interval": "10s"
      }
    ]
  }
}