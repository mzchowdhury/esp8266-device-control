local lib_net = {}
     -- Read line from file with newline
     function srv = lib_net.createServer(response)
          srv=net.createServer(net.TCP) 
          srv:listen(80,function(conn) 
              conn:on("receive", response)
          end)

          return srv
     end
     
return lib_net