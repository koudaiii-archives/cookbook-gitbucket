#
# Cookbook Name:: my_nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nginx::repo'

package "nginx" do
  action :install
end

service "nginx" do
  action [ :enable, :start ]
  supports :status => true, :restart => true, :reload => true
end

execute "Create key and csr" do
  command "/usr/bin/openssl req -new -newkey rsa:2048 -nodes \
           -set_serial 1 \
           -days 3650 \
           -subj '/C=JP/ST=Tokyo/L=Tokyo City/CN=example.com' \
           -keyout /etc/nginx/server.key \
           -out /etc/nginx/server.csr"
  not_if { File.exists?("/etc/nginx/server.key")}
end

execute "Create crt" do
  command "/usr/bin/openssl x509 -req -days 3650 -in /etc/nginx/server.csr -signkey /etc/nginx/server.key -out /etc/nginx/server.crt"
  not_if { File.exists?("/etc/nginx/server.crt")}
end

execute "Create dhparam" do
  command "/usr/bin/openssl dhparam 2048 -out /etc/nginx/dhparam.pem"
  not_if { File.exists?("/etc/nginx/dhparam.pem")}
end


template 'nginx.conf' do
  path   "#{node['nginx']['dir']}/nginx.conf"
  source 'nginx.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

template 'default.conf' do
  path   "#{node['nginx']['dir']}/conf.d/default.conf"
  source 'default.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

include_recipe 'nginx::commons_dir'
include_recipe 'my_nginx::sites'
