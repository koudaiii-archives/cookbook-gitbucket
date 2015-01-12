#
# Cookbook Name:: jetty
# Attributes:: default
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

default["jetty"]["download_url"] = "http://download.eclipse.org/jetty/stable-9/dist/jetty-distribution-9.2.6.v20141205.tar.gz"

default["jetty"]["host"] = "0.0.0.0"
default["jetty"]["port"] = 8080
default["jetty"]["no_start"] = 0
default["jetty"]["jetty_args"] = ""
default["jetty"]["java_options"] = ""
default["jetty"]["home"] = "/opt/jetty"
default["jetty"]["user"] = "jetty"
default["jetty"]["group"] = "jetty"
default["jetty"]["tmp_dir"] = "/var/cache/jetty/data"
default["jetty"]["log_dir"] = "/var/log/jetty"
