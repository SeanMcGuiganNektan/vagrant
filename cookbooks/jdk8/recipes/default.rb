#bash 'install_jdk8' do
#  user 'root'
#  cwd '/tmp'
#  code <<-EOH
#    apt-get -y -q install software-properties-common htop
#    echo -ne '\n' | add-apt-repository ppa:webupd8team/java
#    apt-get -y -q update
#    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#    apt-get -y -q install oracle-java8-installer
#    update-java-alternatives -s java-8-oracle
#    apt-get install oracle-java8-set-default
#    echo -ne '\n' | add-apt-repository --remove ppa:webupd8team/java
#    apt-get -y -q update
#  EOH
#end
execute "update" do
  command "sudo apt-get -y -q update"
end
package "software-properties-common" do
  action :install
end
execute "add-apt-repository" do
  command "sudo add-apt-repository ppa:webupd8team/java"
end
execute "update" do
  command "sudo apt-get -y -q update"
end
execute "licence" do
  command "sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections"
end
package "oracle-java8-installer" do
  action :install
end
execute "update" do
  command "update-java-alternatives -s java-8-oracle"
end
package "oracle-java8-set-default" do
  action :install
end
execute "add-apt-repository" do
  command "sudo add-apt-repository --remove ppa:webupd8team/java"
end
execute "update" do
  command "sudo apt-get -y -q update"
end

