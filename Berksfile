site :opscode

metadata

cookbook "rs-haproxy", git: "git://github.com/RightScale-Services-Cookbooks/rs-haproxy.git", branch: 'RSPS-Fixes'
cookbook "collectd", git: "git://github.com/rightscale-cookbooks-contrib/chef-collectd.git", branch: 'generalize_install_for_both_centos_and_ubuntu'
cookbook "rs-base", git: "git://github.com/rightscale-cookbooks/rs-base.git", branch: 'master'

group :integration do
  cookbook 'apt', '~> 2.6.0'
  cookbook 'yum-epel', '~> 0.4.0'
  cookbook 'build-essential', '~> 1.4.4'
  cookbook 'mysql', github: 'rightscale-cookbooks-contrib/mysql', branch: 'COOK-2100'
  cookbook 'rs-application_php', github: 'rightscale-cookbooks/rs-application_php'
  cookbook 'application_php', github: 'rightscale-cookbooks-contrib/application_php', branch: 'template_fix_and_application_cookbook_upgrade'
  cookbook 'curl'
  cookbook 'fake', path: './test/cookbooks/fake'
  cookbook 'chef-sugar'
  cookbook 'hostsfile'
  cookbook 'rhsm', '~> 1.0.0'
end