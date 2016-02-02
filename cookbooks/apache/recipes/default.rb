# Installs the Apache WebServer

package "apache2" do
  action :install
end

service "apache2" do
	action [ :start, :enable ]
end

cookbook_file "/var/www/index.html" do
	source "index.html"
	mode "0644"
end
