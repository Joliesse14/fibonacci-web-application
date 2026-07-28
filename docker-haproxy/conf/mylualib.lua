local os = require("os")

-- respond directly with pure lua
core.register_service("hello_world_http", "http", function(applet)
  local response = "You requested: '" .. applet.path .. " (from mylualib)'\n"
  applet:set_status(200)
  applet:add_header("content-length", response:len()) --string.len(response))
  applet:add_header("content-type", "text/plain")
  applet:start_response()
  applet:send(response)
end)

-- hook for request
local function atrequest(txn)
   txn:set_var('txn.mystart', os.clock())
end
core.register_action('atrequest',{'http-req'}, atrequest)

-- hook for response, accessing txn value from request
local function atresponse(txn)
   txn:set_var('txn.mykey', 'myvalue')
   local start = txn:get_var('txn.mystart')
   local clocks = os.clock()-start
   txn:set_var('txn.myclocks',string.format('%.5f',clocks))
end
core.register_action('atresponse',{'http-res'}, atresponse)
-- nmap wezterm envoy celestia wireshark redis (cvss 10.0) apache-mod_lua lighttpd luanti lualatex minecraft
-- neovim pandoc snort varnish vim o3de wickedengine overload
