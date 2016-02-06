package [ "haproxy", "socat" ] do
    action :install
end

template "/etc/default/haproxy" do
  source "haproxy.erb"
  owner "haproxy"
  group "haproxy"
end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  owner "haproxy"
  group "haproxy"
  variables({
    backend_nodes: search(:node, "role:webserver")
  })
  notifies :reload, 'service[haproxy]'
end

service "haproxy" do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end