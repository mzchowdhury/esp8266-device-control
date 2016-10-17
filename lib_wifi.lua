local lib_wifi = {}
     -- Connect to wifi hotspot
     function lib_wifi.connectWifi()
          config = lib_util.getConfig()
          wifi.setmode(wifi.STATION);
          wifi.sta.config(config.ssid, config.pass)
          print("Connecting to hotspot: "..config.ssid)
          wifi.sta.connect()
          lib_wifi.wifiStatus(0)
     end
     
     -- Show wifi connection status
     function lib_wifi.wifiStatus(timerId)
          status = wifi.sta.status()
          if status == 0 then
               print("Wifi: Not Connecting")
          elseif status == 1 then
               print("Wifi: Connecting...")
               tmr.alarm(timerId, 1000, 1, function() 
                    status = wifi.sta.status()
                         if status == 2 then
                              print("Wifi: Wrong password")
                         elseif status == 3 then
                              print("Wifi: No AP found")
                         elseif status == 4 then
                              print("Wifi: Connection failed")
                         elseif status == 5 then 
                              print("Wifi: Connected!")
                              print("IP Address: "..wifi.sta.getip())
                         end
                                       
                         if status > 1 then
                              tmr.stop(timerId)
                         end
               end )
          end          
     end
return lib_wifi
