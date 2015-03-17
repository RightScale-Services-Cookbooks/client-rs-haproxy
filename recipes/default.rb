#
# Cookbook Name:: client-rs-haproxy
# Recipe:: default
#

chef_gem 'chef-rewind'
require 'chef/rewind'

updated_haproxy_config = Mash.new(
  'global' => {
    'maxconn' => node['haproxy']['global_max_connections'],
    'user' => node['haproxy']['user'],
    'group' => node['haproxy']['group'],
    'log' => "/dev/log syslog info",
    'daemon' => true,
    'quiet' => true,
    'pidfile' => node['haproxy']['pid_file']
  },
  'defaults' => {
    'timeout' => {
      'client' => '20s',
      'server' => '20s',
      'connect' => '20s'
    },
    'log' => 'global',
    'mode' => 'http',
    'option' => ['httplog', 'dontlognull', 'redispatch'],
    'balance' => node['haproxy']['balance_algorithm'],
  },
  'frontend' => {
    'all_requests' => {
      # HTTP bind address
      "bind #{node['haproxy']['incoming_address']}:#{node['haproxy']['incoming_port']}" => "",
      # rspidel entries
      'rspidel' => ['^Set-cookie:\ IP=', '^Server:']
      #'http-check expect' => ['status 401|30*|20*']
      #'http-check' => 'expect'=> 'status' =>['401|30*|20*']
      #"http-check" => ['expect status 401|30*|20*']
      #'http-check expect status'=> '200'
      'http-\check expect status'=> '200'
    }
  }
)

include_recipe 'rs-haproxy::default'

rewind 'haproxy[set up haproxy.cnf]' do
  config updated_haproxy_config
  action :create
end
