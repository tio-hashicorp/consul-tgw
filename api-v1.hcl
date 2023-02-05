service {
  name = "api"
  id = "api-v1"
  tags = ["v1"]
  meta = {
    version = "3"
  }
  port = 6061

  # health check for the web service
  check {
    id       = "api1-check"
    http     = "http://localhost:6061/health"
    method   = "GET"
    interval = "60s"
    timeout  = "60s"
  }

/*
  # register envoy proxy, but not starting it
  connect {
    sidecar_service {
       proxy {
          config {
              # Expose metrics for prometheus (envoy)
              envoy_prometheus_bind_addr = "0.0.0.0:9101"
              protocol = "http"
          }
       }
     }
   }
*/
}
