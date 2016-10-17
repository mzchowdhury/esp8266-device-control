local lib_util = {}
     -- Read line from file with newline
     function lib_util.fileReadLine(file)
          return string.gsub(file.readline(), "\n", "")
     end

     -- Load wifi ssid & password
     function lib_util.getConfig()
          local config = {}
          local filename = "config.ini"
          result = file.open(filename, "r")
          if result == true then
               config.ssid = lib_util.fileReadLine(file)
               config.pass = lib_util.fileReadLine(file)
          end
          return config
     end

return lib_util
