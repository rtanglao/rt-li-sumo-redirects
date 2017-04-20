#!/usr/bin/env ruby
require 'rubygems'
# http://stackoverflow.com/questions/13822555/how-to-do-basic-authentication-over-https-in-ruby
# see also: rest-client

require 'net/http'
require 'parseconfig'
require 'pp'
require 'ccsv'
# read in 2 column CSV
from_array = []
to_array = []
header = true
Ccsv.foreach(ARGV[0]) do |values|
  if header
    header = false
    next
  end
  from_array.push values[0].chomp
  to_array.push values [1].chomp
end

header = true
row_number = 0
# read in 9 column CSV
output_to_array = []
output_from_array = []
puts "IN PRODUCT LINK,EXPECTED REDIRECT URL"
Ccsv.foreach(ARGV[1]) do |values|
  row_number += 1
  if header == true
    header = false
    next
  end
  fromuri = values[3].chomp # column D
  touri = values[6].chomp #column G
  index =  from_array.index(fromuri)
  if index.nil?
    $stderr.printf("match NOT found:%s\n", fromuri)
    printf("%s,%s\n", fromuri,touri)
  else
    $stderr.printf("match found:%s\n", fromuri)
    printf("%s,%s\n", fromuri, to_array[index])
  end
end

  
    
