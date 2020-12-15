{
  "service": {
    "id": "jupyterlab-__uuid__",
    "name": "jupyterlab",
    "tags": ["urlprefix-jupyterlab.7onetella.net/"],
    "address": "",
    "meta": {
      "meta": "data science"
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
        "args": ["echo", "up"],
        "interval": "10s"
      }
    ]
  }
}