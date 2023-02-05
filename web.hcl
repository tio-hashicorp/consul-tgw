service {
  name = "web"
  port = 6060
  
  #no address=, means it binds to localhost 127.0.0.1 or 0.0.0.0

  # health check for the web service
  check {
    id       = "web-check"
    http     = "http://localhost:6060/health"
    method   = "GET"
    interval = "60s"
    timeout  = "60s"
  }
  
  # register envoy proxy, but not starting it
  connect {
    sidecar_service {
      proxy {
         upstreams = [
            {
            destination_name = "api"
            local_bind_port  = 5000
            }
          ]
      }
    }
  }
}
