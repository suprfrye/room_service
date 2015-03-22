ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'sinatra'

require 'bundler/setup'
require 'rubygems'

require 'uri'
require 'pathname'

require 'active_record'
require 'pg'

require 'erb'


APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path
  set :views, File.join(APP_ROOT,"app","views")
end

Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
 #Load Controllers
 Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

require APP_ROOT.join('database')
