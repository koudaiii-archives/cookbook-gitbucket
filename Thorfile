
IMAGE_MAPPING = {
  "ubuntu-14.04" => {
    :base => "chef/ubuntu-14.04",
    :dest => "koudaiii/cookbook-gitbucket-ubuntu-14.04",
  },
  "centos-6" => {
    :base => "chef/centos-6",
    :dest => "koudaiii/cookbook-gitbucker-centos-6"
  },
}

IMAGES = IMAGE_MAPPING.keys.map {|k| IMAGE_MAPPING[k][:dest] }

class Docker < Thor
  include Thor::Actions

  default_task :default

  desc 'default', 'build image and run spec'
  def default
    build
    spec
  end

  desc 'berkshelf', 'berks vendor'
  def berkshelf(dir="cookbooks")
    run 'bundle install --quiet'
    run "rm -fr #{dir}"
    run "bundle exec berks vendor #{dir}"
  end

  desc 'build', 'build docker image provisioned by chef'
  def build
    IMAGE_MAPPING.each do |name, mapping|
      base, dest = mapping[:base], mapping[:dest]
      berkshelf "docker/#{name}/cookbooks"

      run "docker build -t #{dest} docker/#{name}"
    end
  end

  desc 'spec', 'run spec'
  def spec
    IMAGES.each do |image|
      ENV['DOCKER_IMAGE'] = image
      run("bundle exec rspec -r spec_helper")
    end
  end
end
