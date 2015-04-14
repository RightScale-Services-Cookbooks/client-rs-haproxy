# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

puts "Hello World"


chef_gem "chef-rewind"
require 'chef/rewind'

include_recipe "rs-haproxy::schedule"

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

rewind "cron[rs-haproxy::frontend]" do
 command "rs_run_recipe --policy 'rsc_rs-haproxy::frontend' --name 'rsc_rs-haproxy::frontend'"
end