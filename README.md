cookbook-gitbucket
==================

### Overview

cookbook for GitBucket

### Description

* install GitBucket by Chef Solo.
* timezone is Tokyo.

### Feature

* Supported SSL
* Supported backup
* Supported SMTP

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
    "java" : {
      "install_flavor" : "oracle",
      "jdk_version" : "7",
      "oracle" : {
      "accept_oracle_download_terms" : true
    }
  },
```

* Setup Notification Mail in GitBucket
* http://YourServer/gitbucket/admin/system

```
Check Send notifications.
SMTP Host 127.0.0.1
SMTP Port 25
SMTP User #Nothing
SMTP Password #Nothing
```

### Install

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

### local(Vagrant)

#### Requiremants

* vagrant 1.6.3 or later
* virtualbox
* setup your "/etc/hosts" file
* set up Host Only Network in Virtualbox.(default ip:192.168.33.10)

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

* vagrant up

```
 $ vagrant up
```

* knife solo

```
 $ bundle exec knife solo bootstrap webapp
```

### local(Docker)

#### Requirements

* Docker 1.0+

```bash
 $ bundle exec thor docker
```

#### test

```bash
bundle exec rake spec
```

### Contribution
- Fork the this repository on GitHub
- Create a named feature branch (like add_component_x)
- Write your change
- If at all possible, write serverspec tests for your change and ensure they all pass
- Submit a pull request using GitHub
