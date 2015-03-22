#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

package "httpd"

my_port = 80

template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
  notifies :restart, "service[httpd]"
  variables(
    :port => my_port
  )
end

service "httpd" do
  action [:start, :enable]
end

file "/var/www/html/index.html" do
  content "Hello, Kansas LinuxFest!"
end
