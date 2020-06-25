{
  "service": {
    "id": "redis",
    "name": "redis",
    "tags": ["shard"],
    "address": "",
    "meta": {
      "meta": "sharded"
    },
    "tagged_addresses": {
      "lan": {
        "address": "__ip__",
        "port": 6379
      }
    },
    "port": 6379,
    "enable_tag_override": false,
    "checks": [
      {
        "args": ["/usr/local/bin/check_redis.py"],
        "interval": "10s"
      }
    ]
  }
}