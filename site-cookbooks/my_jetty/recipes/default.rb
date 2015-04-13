#
# Cookbook Name:: my_jetty
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'jetty' do
  group_name 'jetty'
  system false
  action     [:create]
end

user 'jetty' do
  comment  'jetty'
  system false
  group    'jetty'
  home     '/home/jetty'
  shell    '/bin/bash'
  password nil
  supports :manage_home => true
  action   [:create, :manage]
end

remote_file "/root/jetty.tar.gz" do
    source node["jetty"]["download_url"]
    user "root"
    mode "0755"
    not_if { File.exist?("/jetty.tar.gz") }
end


script "install_jetty" do
  interpreter "bash"
  user        "root"
  code <<-EOL
    cd /root/
    tar zxvf jetty.tar.gz
    mv /root/jetty-distribution-9.2.10.v20150310 /opt/jetty
    cp /opt/jetty/bin/jetty.sh /etc/init.d/jetty
    chown -R jetty:jetty /opt/jetty
  EOL
  not_if { ::File.directory?("/opt/jetty/webapps") }
end

directory node["jetty"]["log_dir"] do
  mode "0755"
  user "jetty"
  group "jetty"
  recursive true
  not_if { ::File.directory?(node["jetty"]["log_dir"]) }
end
directory node["jetty"]["tmp_dir"] do
  mode "0755"
  user "jetty"
  group "jetty"
  recursive true
  not_if { ::File.directory?(node["jetty"]["tmp_dir"]) }
end

template "/etc/default/jetty" do
  source "default_jetty.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "jetty" do
  service_name "jetty"
  supports :restart => true, :status => true
  action :enable
end
