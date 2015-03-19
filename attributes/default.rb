node.force_default[:haproxy][:config][:defaults]['http-check expect'] = 'status 401\|30\*|20\*'
# Packages to install. Example: pkg1, pkg2=2.0
node.default['client-rs-haproxy']['listen_port'] = 8080
# Application bind IP type - 'private' or 'public'
node.default['client-rs-haproxy']['bind_network_interface'] = 'private'
# The name of the application. Example: hello_world
node.default['client-rs-haproxy']['application_name'] = nil
# The name of the template that will be rendered to create the local settings file
node.default['client-rs-haproxy']['settings_template'] = nil
# The virtual host path served by the application server
node.default['client-rs-haproxy']['vhost_path'] = '/'
# Remote recipe to attach application server to load balancer
node.default['client-rs-haproxy']['remote_attach_recipe'] = 'client-rs-haproxy::frontend'
# Remote recipe to detach application server from load balancer
node.default['client-rs-haproxy']['remote_detach_recipe'] = 'client-rs-haproxy::frontend'
