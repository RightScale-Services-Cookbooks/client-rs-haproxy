default['haproxy']['config']['defaults']['option'] = [ 'forward_for' ]
force_override['haproxy']['config']['defaults']['timeout'] = {
  'client' => '20s',
  'server' => '20s',
  'connect' => '20s'
}
