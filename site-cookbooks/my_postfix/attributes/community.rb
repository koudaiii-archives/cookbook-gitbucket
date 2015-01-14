default['postfix']['main']['myhostname'] = (node['fqdn'] || node['hostname']).to_s.chomp('.') #defaults to fqdn from Ohai
default['postfix']['main']['mydomain'] = (node['domain'] || node['hostname']).to_s.chomp('.') #defaults to domain from Ohai
default['postfix']['main']['mynetworks'] = "127.0.0.0/8"
default['postfix']['main']['mydestination'] = "$myhostname, localhost.$mydomain, localhost"
default['postfix']['main']['inet_interfaces'] = "all"
default['postfix']['main']['inet_protocols']  = "all"
