require ::File.expand_path('../environment', __FILE__)

require 'rake'
# THIS IS NEEDED FOR THE spec TASK TO WORK!!!
require 'rspec/core/rake_task'

desc 'Start IRB with application environment loaded'
task "console" do
    exec "irb -r./environment"
end

task :default  => :console

namespace :generate do
  task :model do
    desc "Create an empty model , e.g., rake generate:model NAME=User"
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:model NAME=User"
    end

    model_name     = ENV['NAME'].camelize
    model_filename = ENV['NAME'].underscore + '.rb'
    model_path = APP_ROOT.join('app', 'models', model_filename)

    if File.exist?(model_path)
      raise "ERROR: Model file '#{model_path}' already exists"
    end

    puts "Creating #{model_path}"
    File.open(model_path, 'w+') do |f|
      f.write(<<-EOF)
class #{model_name} < ActiveRecord::Base
  # Remember to create a migration!
end
      EOF
    end
  end
  task :migration do
    desc "Create an empty migration , e.g., rake generate:spec:model NAME=user"
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF)
class #{name} < ActiveRecord::Migration
  def change
  end
end
      EOF
    end
  end

  namespace :spec do
    desc "Create an empty model spec in spec, e.g., rake generate:spec:model NAME=user"
    task :model do
      unless ENV.has_key?('NAME')
        raise "Must specificy migration name, e.g., rake generate:spec:model NAME=user"
      end

      name     = ENV['NAME'].camelize
      filename = "%s_spec.rb" % ENV['NAME'].underscore
      path     = APP_ROOT.join('spec', 'models', filename)

      if File.exist?(path)
        raise "ERROR: File '#{path}' already exists"
      end

      puts "Creating #{path}"
      File.open(path, 'w+') do |f|
        f.write(<<-EOF)
require_relative '../spec_helper'
describe #{name} do
  pending "add some examples to (or delete) #{__FILE__}"
end
        EOF
      end
    end

    desc "Create an empty controller spec in spec, e.g., rake generate:spec:controller NAME=users"
    task :controller do
      unless ENV.has_key?('NAME')
        raise "Must specificy migration name, e.g., rake generate:spec:controller NAME=users"
      end

      name     = ENV['NAME'].camelize
      filename = "%s_spec.rb" % ENV['NAME'].underscore
      path     = APP_ROOT.join('spec', 'controllers', filename)

      if File.exist?(path)
        raise "ERROR: File '#{path}' already exists"
      end

      puts "Creating #{path}"
      File.open(path, 'w+') do |f|
        f.write(<<-EOF)
require_relative '../spec_helper'
describe #{name} do
  pending "add some examples to (or delete) #{__FILE__}"
end
        EOF
      end
    end
  end
end

namespace :db do
  desc "Drop, create, and migrate the database"
  task :reset => [:drop, :create, :migrate]

  desc "Create the databases at #{DB_NAME}"
  task :create do
    puts "Creating development and test databases if they don't exist..."
    system("createdb #{APP_NAME}_development && createdb #{APP_NAME}_test")
  end

  desc "Drop the database at #{DB_NAME}"
  task :drop do
    puts "Dropping development and test databases..."
    system("dropdb #{APP_NAME}_development && dropdb #{APP_NAME}_test")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

  namespace :test do
    desc "Migrate test database"
    task :prepare do
      system "rake db:migrate RACK_ENV=test"
    end
  end
end

namespace :spec do
  desc 'run spec'
  RSpec::Core::RakeTask.new(:test)
  task 'run' do
    test_env = {'RACK_ENV' => 'test'}
    ['db:create', 'db:migrate', 'db:seed', 'spec:test', 'db:drop'].each do |step|
      system(test_env, "bundle exec rake #{step}")
    end
  end
end
