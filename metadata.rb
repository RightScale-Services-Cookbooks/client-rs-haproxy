name             'rsc_rs-haproxy'
maintainer       'RightScale PS'
maintainer_email 'premium@rightscale.com'
license          'All rights reserved'
description      'client-rs-haproxy'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'marker'
depends 'rs-haproxy', '~> 1.1.4'
depends 'haproxy'

recipe 'rsc_rs-haproxy::default', 'Runs rs-haproxy::default with custom changes to config.'
recipe 'rsc_rs-haproxy::frontend', 'Runs rs-haproxy::frontentd with custom changes'
recipe 'rsc_rs-haproxy::schedule', 'Configure cron to periodically run rsc_rs-haproxy::frontend.'
recipe 'rsc_rs-haproxy::hatop', 'install hatop'

attribute 'haproxy/config/defaults/timeout/client',
  :display_name => 'haproxy client timeout',
  :description => 'haproxy client timeout',
  :required => 'optional',
  :default => '20s'

attribute 'haproxy/config/defaults/timeout/server',
  :display_name => 'haproxy server timeout',
  :description => 'haproxy server timeout',
  :required => 'optional',
  :default => '20s'

attribute 'haproxy/config/defaults/timeout/connect',
  :display_name => 'haproxy connect timeout',
  :description => 'haproxy connect timeout',
  :required => 'optional',
  :default => '20s'

attribute 'rs-haproxy/pools',
  :display_name => 'Load Balance Pools',
  :description =>
    'List of application pools for which the load balancer' \
    ' will create backend pools to answer website requests. The order of the' \
    ' items in the list will be preserved when answering to requests.' \
    ' Last entry will be considered as the default backend and will answer for all' \
    ' requests. Application servers can provide any number of URIs or FQDNs (virtual host paths)' \
    ' to join corresponding server pool backends. The pool names can have only' \
    ' alphanumeric characters and underscores. Example: mysite, _api, default123',
  :type => 'array',
  :required => 'recommended',
  :default => ['default']

attribute 'rs-haproxy/incoming_port',
  :display_name => 'HAProxy HTTP Listen Port',
  :description => 'The port on which HAProxy listens for HTTP requests.',
  :required => 'optional'

attribute 'rs-haproxy/ssl_cert',
  :display_name => 'HAProxy SSL Certificate',
  :description => 'PEM formatted string containing SSL certificates and keys for SSL encryption.' \
    'Unset this to configure HAProxy without SSL encryption.',
  :required => 'optional'

attribute 'rs-haproxy/ssl_incoming_port',
  :display_name => 'HAProxy HTTPS Listen Port',
  :description => 'The port on which HAProxy listens for HTTPS requests',
  :required => 'optional'

attribute 'rs-haproxy/stats_uri',
  :display_name => 'Statistics URI',
  :description =>
    'The URI for the load balancer statistics report page.' \
    ' This page lists the current session, queued session, response error,' \
    ' health check error, server status, etc. for each load balancer group.' \
    ' Example: /haproxy-status',
  :required => 'optional',
  :default => '/haproxy-status'

attribute 'rs-haproxy/stats_user',
  :display_name => 'Statistics Page Username',
  :description =>
    'The username that is required to access the load balancer' \
    ' statistics report page. Example: cred:STATS_USER',
  :required => 'optional'

attribute 'rs-haproxy/stats_password',
  :display_name => 'Statistics Page Password',
  :description =>
    'The password that is required to access the load balancer statistics' \
    ' report page. Example: cred:STATS_PASSWORD',
  :required => 'optional'

attribute 'rs-haproxy/session_stickiness',
  :display_name => 'Use Session Stickiness',
  :description =>
    'Determines session stickiness. Set to \'True\' to use session stickiness,' \
    ' where the load balancer will reconnect a session to the last server it' \
    ' was connected to (via a cookie). Set to \'False\' if you do not want to' \
    ' use sticky sessions; the load balancer will establish a connection' \
    ' with the next available server. Example: true',
  :required => 'optional',
  :choice => ['true', 'false'],
  :default => 'true'

attribute 'rs-haproxy/health_check_uri',
  :display_name => 'Health Check URI',
  :description =>
    'The URI that the load balancer will use to check the health of a server.' \
    ' It is only used for HTTP (not HTTPS) requests. Example: /',
  :required => 'optional',
  :default => '/'

attribute 'rs-haproxy/balance_algorithm',
  :display_name => 'Load Balancing Algorithm',
  :description =>
    'The algorithm that the load balancer will use to direct traffic.' \
    ' Example: roundrobin',
  :required => 'optional',
  :default => 'roundrobin',
  :choice => ['roundrobin', 'leastconn', 'source']

attribute 'rs-haproxy/schedule/enable',
  :display_name => 'Periodic Queries of Application Server',
  :description => 'Enable or disable periodic queries of application servers in the deployment.',
  :required => 'optional',
  :choice => ['true', 'false'],
  :default => 'true'

attribute 'rs-haproxy/schedule/interval',
  :display_name => 'Interval for Periodic Queries',
  :description => 'Interval in minutes to run periodic queries of application servers in the deployment.' \
    ' Example: 15',
  :required => 'optional',
  :default => '15'
