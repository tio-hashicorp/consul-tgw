Kind =  "service-defaults"
Name =  "web"
Protocol =  "http"

  UpstreamConfig = {
  Defaults = {
    ConnectTimeoutMs = 15000
  }

  Overrides = [
    {
      Name = "api"
      ConnectTimeoutMs = 20000
    }
  ]
}
