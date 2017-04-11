#!/usr/bin/env ruby
require 'rubygems'
# http://stackoverflow.com/questions/13822555/how-to-do-basic-authentication-over-https-in-ruby
# see also: rest-client

require 'net/http'
require 'parseconfig'
require 'pp'
require 'ccsv'
require 'openssl'

                        
header = true
row_number = 0
Ccsv.foreach(ARGV[0]) do |columns|
  row_number += 1
  if header == true
    header = false
    next
  end
  fromuri = columns[0].chomp.gsub("support.mozilla.org", "support-stage.allizom.org") # column A
  from_uri= URI(fromuri)
  touri = columns[1].chomp.gsub("support.mozilla.org", "support-stage.allizom.org") #column B
  guid_str = touri[touri.rindex("/") + 1, touri.length - 1]
  anchor_pos = guid_str.rindex("#")
  guid_str = guid_str[0..anchor_pos - 1] if !anchor_pos.nil?
  to_uri = URI(touri)
  anchor_pos = touri.rindex("#")
  touri = touri[0..anchor_pos - 1] if !anchor_pos.nil?

  try_count = 0
  begin 
    Net::HTTP.start(from_uri.host, from_uri.port,
                    :use_ssl => from_uri.scheme == 'https',
                    :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new from_uri.request_uri
      response = http.request request # Net::HTTPResponse object
      response_uri = ""
      if response.code == "301"
        $stderr.puts("in first 301")
        $stderr.puts response['location']
        $stderr.puts touri
        #response_uri = response['location']
        response_uri = URI::encode(response['location'])
      end
      actual_guid_str =
        response_uri[
          response_uri.rindex("/") + 1..response_uri.length - 1]
      anchor_pos = actual_guid_str.rindex("#")
      actual_guid_str =
        actual_guid_str[0..anchor_pos - 1] if !anchor_pos.nil?
      intermediate_redirect_uri = "https://support-stage.allizom.org/t5/-/-/ta-p/" + actual_guid_str
      intermediate_to_uri = "https://support-stage.allizom.org/t5/-/-/ta-p/" + guid_str
      if  response_uri == touri || intermediate_to_uri == intermediate_redirect_uri
        printf("* PASS,row:%d,code:%d,FROM:[%s](%s),EXPECTED:[%s](%s),ACTUAL:[%s](%s)\n",\
               row_number,response.code,fromuri,fromuri,touri,touri,response_uri,response_uri)
      else
        printf(
          "* **FAIL**,row:%d,code:%d,FROM:[%s](%s),EXPECTED:[%s](%s),ACTUAL:**[%s](%s)**,EXPECTEDid:%s, ACTUALid:**%s**\n",\
          row_number,response.code,fromuri,fromuri,touri,touri,response_uri,response_uri,
          guid_str, actual_guid_str)
      end
    end
    rescue Errno::ECONNRESET, Errno::ECONNREFUSED,
           Net::ReadTimeout, Net::OpenTimeout,
           SocketError => e
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
  
    
