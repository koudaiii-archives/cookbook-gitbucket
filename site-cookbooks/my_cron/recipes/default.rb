#
# Cookbook Name:: my_cron
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cron "backup" do
  minute "*"
  hour "5"
  month "*"
  weekday "*"
  user "jetty"
  command "tar zcf /home/jetty/gitbucket-`date +\%Y-\%m-\%d`.tar.gz /home/jetty/.gitbucket"
end

cron "rotation" do
  minute "*"
  hour "6"
  month "*"
  weekday "*"
  user "jetty"
  command "find /home/jetty -type f -mtime +6 -name 'gitbucket-*.tar.gz' -exec rm -f {} \;"
end

