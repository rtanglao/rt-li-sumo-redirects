#!/usr/bin/env ruby
require 'rubygems'
# http://stackoverflow.com/questions/13822555/how-to-do-basic-authentication-over-https-in-ruby
# see also: rest-client

require 'net/http'
require 'parseconfig'
require 'pp'
require 'ccsv'

stage_config = ParseConfig.new('stage.conf').params
userid = stage_config['userid']
password = stage_config['password']
                        
header = true
Ccsv.foreach(ARGV[0]) do |values|
  if header == true
    header = false
    next
  end
  fromuri = values[3].gsub("support.mozilla.org", "support-stage.allizom.org") # column D
  from_uri= URI(fromuri)
  touri = values[6] #column G
  to_uri = URI(touri)
  try_count = 0
  begin 
    Net::HTTP.start(from_uri.host, from_uri.port,
                    :use_ssl => from_uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new from_uri.request_uri
      request.basic_auth userid, password
      response = http.request request # Net::HTTPResponse object
      response_uri = response['location']
      if  response_uri == touri
        printf("PASS,%d,%s,%s\n", response.code, fromuri, touri)
      else
        printf("FAIL,%d,%s,%s\n", response.code, fromuri, response_uri)
      end
    end
  rescue Errno::ECONNRESET
    try_count += 1
    if try_count < 4
      $stderr.printf("Errno::ECONNRESET exception, retry:%d\n",\
                     try_count)
      sleep(10)
      retry
    else
      $stderr.printf("Curl:ConnectionFailedError exception, retrying FAILED\n")
      raise e
    end
  end
end
  
    
