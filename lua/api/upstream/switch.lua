local ups = ngx.req.get_uri_args()["upstream"]
local host = ngx.var.http_host
local upstreams = ngx.shared.upstreams

if ups == nil or ups == "" then
    ngx.say("upstream is nil")
    return nil
end

local succ, err, forcible = upstreams:set(host,  ups)
ngx.say(host, " change upstream to ", ups)

