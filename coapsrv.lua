cs=coap.Server()
cs:listen(5683)

-- see https://github.com/nodemcu/nodemcu-firmware#gpio-new-table--build-20141219-and-later
local function validPin(p)
    return (p > 0) and (p<13)
end

local function setpin(payload,value)
    local pin=tonumber(payload)

    if not validPin(pin) then
        return pin.." is not a valid pin"
    end
    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,value)
    return "pin "..pin.." now set to "..gpio.read(pin)
end
function low(payload)
    return setpin(payload,gpio.LOW)
end
cs:func("low")

function high(payload)
    return setpin(payload,gpio.HIGH)
end
cs:func("high")

function read(payload)
    local pin=tonumber(payload)
    return gpio.read(pin)
end
cs:func("read")

function readall(payload)
    local ret="pin\tvalue\n"
    for i=1,12,1 do
        ret=ret..string.format("%3d\t%5d\n",i,gpio.read(i))
    end
    return ret
end
cs:func("readall")

function heap(payload)
    return node.heap()
end
cs:func("heap")

function readvcc()
    return node.readvdd33()
end
cs:func("readvcc")

return cs
