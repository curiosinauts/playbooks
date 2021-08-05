{
  "service": {
    "id": "redis-__uuid__",
    "name": "redis",
    "tags": ["shard"],
    "address": "",
    "meta": {
      "meta": "sharded"
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
        "args": ["/usr/local/bin/check_redis.py"],
        "interval": "10s"
      }
    ]
  }
}