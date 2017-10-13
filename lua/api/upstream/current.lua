local function current_ups(upstreams, host)
    local current_upstream = upstreams:get(host)
    if current_upstream == nil then
        current_upstream = "upstream_hub1"
    end
    return current_upstream
end

local host = ngx.var.http_host
local upstreams = ngx.shared.upstreams
local cu = current_ups(upstreams, host)

ngx.say(cu)

