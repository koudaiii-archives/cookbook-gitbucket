require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

namespace :vagrant do
  desc 'setup and vagrant up and bootstrap'
  task :init => [:setup, :up, :bootstrap]

  desc 'bundle exec berks vendor cookbooks'
  task :setup do
    sh 'bundle', 'install', '--quiet'
    rm_rf 'cookbooks'
    sh 'bundle', 'exec', 'berks', 'vendor', 'cookbooks'
  end

  desc 'vagrant up'
  task :up do
    sh 'vagrant', 'up'
  end

  desc 'bundle exec knife solo bootstrap webapp'
  task :bootstrap do
    sh 'bundle', 'exec', 'knife', 'solo', 'bootstrap', 'webapp'
  end

  desc 'vagrant destroy -f default'
  task :clean do
    sh 'vagrant', 'destroy'
  end
end

desc 'spec'
namespace :spec do
  targets = []
  Dir.glob('./spec/*').each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end

  task :all     => targets
  task :default => :all

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = "spec/#{target}/*_spec.rb"
    end
  end
end
