#
# Cookbook Name:: client-rs-haproxy
# Recipe:: default
#

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

node.default['haproxy']['config']['defaults']['option'] = [ 'forward_for' ]

include_recipe 'rs-haproxy::default'
