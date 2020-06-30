{
  "ID": "registry-__uuid__",
  "Name": "registry",
  "Tags": [
    "urlprefix-docker.7onetella.net/"
  ],
  "Address": "__ip__",
  "Port": __port__,
  "EnableTagOverride": false,
  "Check": {
    "DeregisterCriticalServiceAfter": "1m",
    "Tcp": "__ip__:__port__",
    "Interval": "10s",
    "Timeout": "3s"
  },
  "Weights": {
    "Passing": 10,
    "Warning": 1
  }
}