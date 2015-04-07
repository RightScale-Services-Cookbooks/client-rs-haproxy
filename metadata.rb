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

attibute 'haproxy/config/defaults/timeout/client',
  :display_name => 'haproxy client timeout',
  :description => 'haproxy client timeout',
  :required => 'optional',
  :default => '20s'
