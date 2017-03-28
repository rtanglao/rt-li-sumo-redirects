#!/usr/bin/env ruby
require 'rubygems'
# http://stackoverflow.com/questions/13822555/how-to-do-basic-authentication-over-https-in-ruby

require 'net/http'
require 'parseconfig'

uri = URI('https://support-stage.allizom.org/kb/npapi-plugins-en-GB')
stage_config = ParseConfig.new('stage.conf').params
userid = stage_config['userid']
password = stage_config['password']

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth userid, password

  response = http.request request # Net::HTTPResponse object

  puts response
  puts response.body
end
