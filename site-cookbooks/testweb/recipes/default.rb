#
# Cookbook Name:: testweb
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute "package update" do
  user    "root"
  command node["pkg"]["update"]
  action  :run
end

[node["pkg"]["httpd"], node["pkg"]["php"]].each do |pkg|
  package pkg do
    action :install
  end
end

service node["pkg"]["httpd"] do
  action [:enable, :restart]
end

template "#{node["web"]["docroot"]}/index.php" do
  source "index.php.erb"
  owner  "root"
  group  "root"
  mode   0644
  variables(
    :platform => node["platform"],
    :version  => node["platform_version"]
  )
end
