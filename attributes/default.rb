default['haproxy']['config']['defaults']['option'] = [ 'x_forwarded_for' ]
force_override['haproxy']['config']['defaults']['timeout'] = {
  'client' => '20s',
  'server' => '20s',
  'connect' => '20s'
}
