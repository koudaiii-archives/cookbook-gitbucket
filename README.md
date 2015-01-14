cookbook-gitbucket
==================

### Overview

cookbook for gitbucket

### Description

install gitbucket by Chef Solo.
default timezone is Tokyo.

* Platform is ubuntu14.04 and CentOS6.

If you want to Customize. please set default attributes.

* example

Change URL and gitbucket version

```roles/web.json
  "override_attributes": {
    "my_nginx" : {
      "servername" : "webapp"
    },
    "my_gitbucket" : {
      "download_url" : "https://github.com/takezoe/gitbucket/releases/download/2.7/gitbucket.war"
    }
  }
```

```roles/base.json
  "tz": "Asia/Tokyo",
  "override_attributes": {
    "my_jetty" : {
      "download_url" : "http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.6.v20141205.tar.gz",
      "host": "127.0.0.1",
      "java_options": "",
      "home": "/opt/jetty"
    },
    "java" : {
      "install_flavor" : "oracle",
      "jdk_version" : "7",
      "oracle" : {
      "accept_oracle_download_terms" : true
    }
  },
```

* Mail setup
http://YourServer/gitbucket/admin/system
```
Check Send notifications.
SMTP Host 127.0.0.1
SMTP Port 25
SMTP User #Nothing
SMTP Password #Nothing
```

### Requirement

* cookbook 'nginx'
* cookbook 'timezone-ii'
* cookbook 'java'

### Install

* vagrant 1.6.3 or later
* virtualbox
* vagrant plugin vagrant-omnibus
* Ruby 2.1.5 or later
* gem install bundler

### Usage

* bundle install

```bash
bundle install
```

* build berks

```bash
bundle exec berks vendor cookbooks
```

* provision server

```bash
bundle exec knife solo bootstrap YourServer
```

* [Defalut]Jetty is stopped service. Please command "service jetty start" in root user.
* [Defalut]Gitbucket accepts the "http:// webapp or ipaddress /gitbucket". Please set up "/etc/nginx/sites-enabled/app".

### Develop(Vagrant)

#### Requiremants

* add hosts

```hosts
192.168.33.10 webapp
```

* add ssh config

```config
vagrant ssh-config >> ~/.ssh/config
```

* chanage Host

```~/.ssh/config
Host webapp
```

#### build and run test

* bootstrapping

```bash
bundle exec rake vagrant:init
```

### Test(Docker)

#### Requirements

* Docker 1.0+

#### build and run test

```bash
bundle exec thor docker
```

### Contribution
- Fork the this repository on GitHub
- Create a named feature branch (like add_component_x)
- Write your change
- If at all possible, write serverspec tests for your change and ensure they all pass
- Submit a pull request using GitHub
