# encoding: UTF-8
require 'json'
require 'sinatra'
require 'certified'

GOOGLE_API_KEY = "AIzaSyAdBB5I81e_OWemsH5hsKse3kjpWK7Y-YA"
# ENV['SSL_CERT_FILE'] = File.expand_path(File.dirname(__FILE__) + "config/cacert.pem")

require './routes/api'
