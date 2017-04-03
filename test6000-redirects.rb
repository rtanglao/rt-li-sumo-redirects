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
  sleep(10) if rand() < 0.4
  if header == true
    header = false
    next
  end
  fromuri = values[3].gsub("support.mozilla.org", "support-stage.allizom.org") # column D
  from_uri= URI(fromuri)
  touri = values[6] #column G
  touri = touri
  to_uri = URI(touri)
  try_count = 0
  begin 
    Net::HTTP.start(from_uri.host, from_uri.port,
                    :use_ssl => from_uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new from_uri.request_uri
      request.basic_auth userid, password
      response = http.request request # Net::HTTPResponse object
      #pp response
      #pp response.header
      #pp response['location']
      #pp response.code
      if response.code == "301"
        #puts("in first 301")
        from_uri = URI.parse(response['location'])
        Net::HTTP.start(from_uri.host, from_uri.port,
                    :use_ssl => from_uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new from_uri.request_uri
          request.basic_auth userid, password
          response = http.request request # Net::HTTPResponse object
          #pp response
          #pp response.header
          #pp response['location']
        end
        if response.code == "301"
          #puts("in 2nd 301")
          #pp from_uri
          #pp response['location']
          response_uri = "https://support.mozilla.org" + response['location']
          #pp response_uri
        else
          #puts("Did NOT get 2nd 301")
        end
      end        
      if  response_uri == touri
        printf("PASS,%d,%s,%s\n", response.code, fromuri, touri)
      else
        printf("FAIL,%d,%s,%s\n", response.code, fromuri, response_uri)
      end
    end
  rescue Errno::ECONNRESET, Errno::ECONNREFUSED => e
    try_count += 1
    if try_count < 4
      $stderr.printf("Errno::ECONNRESET exception, retry:%d\n",\
                     try_count)
      sleep(10)
      retry
    else
      $stderr.printf("Errno::ECONNRESETexception, retrying FAILED\n")
      raise e
    end
  end
end
  
    
