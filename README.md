# coap esp control

remote control gpio pins of the ESP via coap, for example for setting
rst or gpio0 on another esp.

# Configuration

* have firmware with coap compiled into
* luatool -f init.lua -t init.lua
* luatool -f coapsrv.lua -t coapsrv.lua -r

