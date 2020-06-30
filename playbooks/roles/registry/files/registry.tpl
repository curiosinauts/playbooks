{
  "service": {
    "id": "registry-__uuid__",
    "name": "registry",
    "tags": [
      "urlprefix-docker.7onetella.net/"
    ],
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