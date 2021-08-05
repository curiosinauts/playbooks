local:
  listen: 0.0.0.0:22221
  hash: fnv1a_64
  distribution: ketama
  auto_eject_hosts: true
  redis: true
  server_retry_timeout: 30000
  server_failure_limit: 3
  servers: {{ range (ds "node").nodes }}
    - {{ . }}:6379:1{{end}}
