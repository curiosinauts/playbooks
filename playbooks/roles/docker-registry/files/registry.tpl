{
  "service": {
    "id": "docker-registry-__uuid__",
    "name": "docker-registry",
    "address": "__ip__",
    "port": __port__,
    "enable_tag_override": false,
    "check": {
      "deregister_critical_service_after": "1m",
      "tcp": "__ip__:__port__",
      "interval": "10s",
      "timeout": "3s"
    },
    "weights": {
      "passing": 10,
      "warning": 1
    }
  }
}