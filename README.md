cookbook-gitbucket
==================

### Overview

cookbook for gitbucket

### Description

install gitbucket by Chef Solo.
default timezone is Tokyo.
If you want to modify timezone. please set default attributes.

* example

```json
  "tz": "Africa/Timbuktu"
```

### Requirement

* cookbook 'nginx'
* cookbook 'timezone-ii'
* cookbook 'java'
* cookbook 'jetty'

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

### Develop(Vagrant)

#### Requiremants

* add hosts

```hosts
192.168.33.10 webapp
```

#### build and run test

* bundle install

```bash
bundle install
```

* build berks

```bash
bundle exec berks vendor cookbooks
```

* build vm and provisioning

```bash
vagrant up --provider=virtualbox
```

* provision server

```bash
bundle exec knife solo bootstrap webapp
```

### Test(Docker)

#### Requirements

* Docker 1.0

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
