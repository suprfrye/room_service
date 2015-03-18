ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'sinatra'

require 'bundler/setup'
require 'rubygems'

require 'uri'
require 'pathname'


 APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))
 APP_NAME = APP_ROOT.basename.to_s

 #Load Controllers
 Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
