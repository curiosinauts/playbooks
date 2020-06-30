job "web" {
  datacenters = ["dc1"]

  type = "service"

  update {
    stagger      = "30s"
    max_parallel = 1
  }

  group "dev" {
    count = 1

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:latest"
        labels {
            group = "dev"
        }
      }

      service {
        tags = ["urlprefix-web.7onetella.net/"]
        
        port = "http"

        check {
           type     = "http"
           protocol = "http"
           path     = "/"
           interval = "10s"
           timeout  = "2s"
           tls_skip_verify = true
         }

      }

      env {
        "HTTP_PORT" = "${NOMAD_PORT_http}"
        "STAGE" = "devpass"
      }

      resources {
        cpu    = 128 # MHz
        memory = 128 # MB

        network {
          mbits = 10
          port "http" {
            static = 80
          }
        }
      }
    }
  }
}
