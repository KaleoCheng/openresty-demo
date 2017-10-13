local ups = ngx.shared.upstreams:get(ngx.var.http_host)
if ups ~= nil then
    ngx.log(ngx.ERR, "get [", ups,"] from ngx.shared")
    return ups
end
return "upstream_hub1"