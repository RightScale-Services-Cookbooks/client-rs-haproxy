name             'client-rs-haproxy'
maintainer       'Lopaka Delp'
maintainer_email 'lopaka@rightscale.com'
license          'All rights reserved'
description      'client-rs-haproxy'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'marker', '~> 1.0.1'
depends 'haproxy', '~> 1.6.0'
depends 'collectd', '~> 1.1.0'
depends 'rightscale_tag', '~> 1.0.3'
depends 'rs-base', '~> 1.1.3'
depends 'rs-haproxy', '~> 1.1.3'

recipe 'client-rs-haproxy::default', 'Runs rs-haproxy::default with custom changes to config.'
recipe 'client-rs-haproxy::frontend', 'Runs rs-haproxy::frontend'
recipe 'client-rs-haproxy::new_application_backend', 'Attaches the application server to the load balancer'
recipe 'client-rs-haproxy::new_application_backend_detached', 'Detaches the application server from a load balancer'
recipe 'client-rs-haproxy::schedule', 'Configure cron to periodically run rs-haproxy::frontend.'


attribute 'client-rs-haproxy/application_name',
  :display_name => 'application_name',
  :required => 'required'
