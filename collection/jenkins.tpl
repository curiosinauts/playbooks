{
  "service": {
    "id": "jenkins-__uuid__",
    "name": "jenkins",
    "tags": ["urlprefix-jenkins.7onetella.net/"],
    "address": "__ip__",
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
        "deregister_critical_service_after": "1m",
        "args": ["/usr/bin/curl", "-f", "-s", "-I", "http://0.0.0.0:8080/login"],
        "interval": "10s"
      }
    ]
  }
}