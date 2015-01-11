#
# Cookbook Name:: my_gitbucket
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
# All rights reserved - Do Not Redistribute
#

remote_file "/opt/jetty/webapps/gitbucket.war" do
  source node["my_gitbucket"]["download_url"]
  user "jetty"
  group "jetty"
  mode "0755"
  notifies :restart, "service[jetty]"
end
