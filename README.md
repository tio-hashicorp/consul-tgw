# consul-tgw
Flow:
web (port 6060) -> web-proxy -> terminating-gateway -> api (port 6061)

### Run Consul server
$ consul agent -dev. 

### Run Services
$ run-web.sh  
$ run-api.sh

### Register Services
$ consul services register web.hcl  
$ consul connect envoy -sidecar-for web -- -l debug > /tmp/web-proxy.log 2>&1 &  

$ consul services register api-v1.hcl  
$ consul config write api-service-defaults.json  
$ consul config write web-defaults.hcl  

### Register and Run Terminating Gateway 
$ consul config write terminating-gateway.hcl  
$ consul connect envoy -gateway=terminating \  
   -register \  
   -admin-bind localhost:19001 \  
   -service terminating-gateway \  
   -address '{{ GetInterfaceIP "eth0" }}:8443' -- -l debug >  /tmp/tgw.log 2>&1 &  
   
### Test the service
$ curl -v localhost:6060  
or  
$ From browser, type localhost:6060/ui  

### Cleanup
$ pkill -f envoy  
$ pkill -f fake-service  
$ consul services deregister web.hcl  
$ consul services deregister api-v1.hcl  
$ # or simply shutdown consul server  
