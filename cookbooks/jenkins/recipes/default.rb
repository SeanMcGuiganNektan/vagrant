execute "install jenkins repo key" do
  command "wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -"
end
cookbook_file "/etc/apt/sources.list.d/jenkins.list" do
	source "jenkins.list"
	user "root"
	mode "0644"
	action :create
end
execute "update" do
  command "sudo apt-get -y -q update"
end
package "jenkins" do
    action :install
end
service "jenkins" do
  supports status: true, restart: true
  action [ :enable, :start ]
end
