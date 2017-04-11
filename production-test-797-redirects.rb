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
  fromuri = columns[0].chomp # column A
  from_uri= URI(fromuri)
  touri = columns[1].chomp #column B
  guid_str = touri[touri.rindex("/") + 1, touri.length - 1]
  to_uri = URI(touri)
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
        from_uri = URI.parse(response['location'])
        Net::HTTP.start(from_uri.host, from_uri.port,
                        :use_ssl => from_uri.scheme == 'https') do |http|
          request = Net::HTTP::Get.new from_uri.request_uri
          response = http.request request # Net::HTTPResponse object
          response_uri = response['location']
          $stderr.printf("2nd response uri:%s\n", response['location'])
          response_uri = "" if response_uri.nil?
          response_uri = "https://support.mozilla.org" + response_uri 
        end
      end        
      if  response_uri == touri
        printf("* PASS,row:%d,code:%d,FROM:[%s](%s),EXPECTED:[%s](%s),ACTUAL:[%s](%s)\n",\
               row_number,response.code,fromuri,fromuri,touri,touri,response_uri,response_uri)
      else
        actual_guid_str = response_uri[response_uri.rindex("/") + 1,
                                response_uri.length - 1]
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
  
    
