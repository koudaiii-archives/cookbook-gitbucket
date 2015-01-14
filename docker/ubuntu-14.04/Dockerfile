FROM chef/ubuntu-14.04

RUN sudo apt-get update
RUN sudo apt-get -q -y install openjdk-6-jdk


RUN install -d -m 755 /cookbooks /etc/chef /var/chef/node

RUN echo "local_mode      true" >> /etc/chef/client.rb;  \
    echo "cookbook_path  ['/cookbooks']" >> /etc/chef/client.rb; \
    echo "cache_path      '/var/chef/cache'" >> /etc/chef/client.rb; \
    echo "node_path       '/var/chef/node'" >> /etc/chef/client.rb; \
    echo "environment     '_default'" >> /etc/chef/client.rb; \
    echo "ssl_verify_mode :verify_peer" >> /etc/chef/client.rb;

RUN echo '{"run_list":["recipe[my_timezone]"]}' > /var/chef/node/my_timezone.json
RUN echo '{"run_list":["recipe[my_ntp]"]}' > /var/chef/node/my_ntp.json
RUN echo '{"run_list":["recipe[my_postfix]"]}' > /var/chef/node/my_postfix.json
RUN echo '{"run_list":["recipe[java]"]}' > /var/chef/node/java.json
RUN echo '{"run_list":["recipe[my_jetty]"]}' > /var/chef/node/my_jetty.json
RUN echo '{"run_list":["recipe[my_nginx]"]}' > /var/chef/node/my_nginx.json
RUN echo '{"run_list":["recipe[my_gitbucket]"]}' > /var/chef/node/my_gitbucket.json

COPY ./cookbooks /cookbooks

RUN chef-client -j /var/chef/node/my_timezone.json
RUN chef-client -j /var/chef/node/my_ntp.json
RUN chef-client -j /var/chef/node/my_postfix.json
RUN chef-client -j /var/chef/node/java.json
RUN chef-client -j /var/chef/node/my_jetty.json
RUN chef-client -j /var/chef/node/my_nginx.json
RUN chef-client -j /var/chef/node/my_gitbucket.json
