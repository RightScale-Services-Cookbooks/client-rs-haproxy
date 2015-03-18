node.default[:haproxy][:config][:node.defaults]['http-check expect'] = 'status 401\|30\*|20\*'

#
# Cookbook Name:: client-rs-haproxy
# Attribute:: node.default
#
# Copyright (C) 2014 RightScale, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Packages to install. Example: pkg1, pkg2=2.0
node.default['client-rs-haproxy']['listen_port'] = 8080
# Application bind IP type - 'private' or 'public'
node.default['client-rs-haproxy']['bind_network_interface'] = 'private'
# The name of the application. Example: hello_world
node.default['client-rs-haproxy']['application_name'] = nil
# The name of the template that will be rendered to create the local settings file
node.default['client-rs-haproxy']['settings_template'] = nil
# The virtual host path served by the application server
node.default['client-rs-haproxy']['vhost_path'] = nil
# Remote recipe to attach application server to load balancer
node.default['client-rs-haproxy']['remote_attach_recipe'] = 'client-rs-haproxy::frontend'
# Remote recipe to detach application server from load balancer
node.default['client-rs-haproxy']['remote_detach_recipe'] = 'client-rs-haproxy::frontend'
