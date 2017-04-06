#!/usr/bin/env ruby
require 'rubygems'
# http://stackoverflow.com/questions/13822555/how-to-do-basic-authentication-over-https-in-ruby
# see also: rest-client

require 'net/http'
require 'parseconfig'
require 'pp'
require 'ccsv'
require 'openssl'

stage_config = ParseConfig.new('stage.conf').params
userid = stage_config['userid']
password = stage_config['password']

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
                        
header = true
Ccsv.foreach(ARGV[0]) do |values|
  if header == true
    header = false
    next
  end
  fromuri = values[3].gsub("support.mozilla.org", "support-stage.allizom.org") # column D
  from_uri= URI(fromuri)
  touri = values[6].gsub("support.mozilla.org", "support-stage.allizom.org") #column G
  guid_str = touri[touri.rindex("/") + 1, touri.length - 1]
  anchor_pos =  guid_str.rindex("#")
  unless anchor_pos.nil?
    guid_str = guid_str[0, anchor_pos - 1]
  end
  touri = "https://support-stage.allizom.org/t5/-/-/ta-p/" + guid_str
  to_uri = URI(touri)
  try_count = 0
  begin 
    Net::HTTP.start(from_uri.host, from_uri.port,
                    :use_ssl => from_uri.scheme == 'https',
                    :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new from_uri.request_uri
      request.basic_auth userid, password
      response = http.request request # Net::HTTPResponse object
      if response.code == "301"
        $stderr.puts("in first 301")
        $stderr.puts response['location']
        $stderr.puts touri
        response_uri = response['location']
      else
        response_uri = ""
      end        
      if  response_uri == touri
        printf("PASS,%d,%s,%s\n", response.code, fromuri, touri)
      else
        printf("FAIL,%d,%s,%s\n", response.code, fromuri, response_uri)
      end
    end
  rescue Errno::ECONNRESET, Errno::ECONNREFUSED, Net::ReadTimeout => e
    try_count += 1
    if try_count < 6
      $stderr.printf("%s exception, message:%s, retry:%d\n",\
                     e.class, e.message, try_count)
      sleep(10)
      retry
    else
      $stderr.printf("%s exception, message:%s, RETRY FAILED\n",\
                     e.class, e.message)
      raise e
    end
  end
end
  
    
