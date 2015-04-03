#
# Cookbook Name:: client-rs-haproxy
# Recipe:: default
#

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

Chef::Log.info node['haproxy'].inspect
include_recipe 'rs-haproxy::default'
