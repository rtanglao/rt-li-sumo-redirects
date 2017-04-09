#!/usr/bin/env ruby
require 'rubygems'
require 'mechanize'
require 'parseconfig'
require 'pp'

stage_config = ParseConfig.new('user.conf').params
userid = stage_config['userid']
password = stage_config['password']

# http://merowing.info/2015/01/extracting-data-from-websites-without-api/
mechanize = Mechanize.new
login_page = mechanize.get 'https://support.mozilla.org/t5/user/userloginpage'
# 2
form = login_page.forms[1]
# noinspection RubyResolve
form.field_with(id: 'lia-login').value = userid
form.field_with(id: 'lia-password').value = password
# 3

page = form.submit
#pp page
tkb_page = mechanize.get 'https://support.mozilla.org/t5/Manage-preferences-and-add-ons/How-to-change-your-default-browser-in-Windows-10/ta-p/35222'
# [#<Nokogiri::XML::Element:0x3fd291af8f04 name="a"
# attributes=[#<Nokogiri::XML::Attr:0x3fd291af8e8c name="href"
# value="/t5/Manage-preferences-and-add-ons/%E5%A6%82%E4%BD%95%E5%9C%A8-Windows-10-%E4%B8%AD%E6%9B%B4%E6%94%B9%E9%BB%98%E8%AE%A4%E6%B5%8F%E8%A7%88%E5%99%A8/ta-p/38023">]
# children=[#<Nokogiri::XML::Text:0x3fd291af8a40 "Chinese (Simplified)">]>]
puts "1"
# "/t5/Manage-preferences-and-add-ons/Hogyan-m%C3%B3dos%C3%ADthatja-az-alap%C3%A9rtelmezett-b%C3%B6ng%C3%A9sz%C5%91t-a-Windows-10/ta-p/31061"
pp tkb_page.css('div.tkb-other-language-link:nth-child(1) > a:nth-child(1)/@href').first.value
# "English (US)":
pp tkb_page.css('div.tkb-other-language-link:nth-child(1) > a:nth-child(1)').children.text

puts "2"
pp tkb_page.css('div.tkb-other-language-link:nth-child(2) > a:nth-child(1)/@href').first.value

puts "count"

tkb_page.css('div.tkb-other-language-link').each do |l|
   pp l
end
