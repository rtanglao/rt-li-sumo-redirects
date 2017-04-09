#!/usr/bin/env ruby
require 'rubygems'
require 'mechanize'
require 'parseconfig'
require 'pp'

stage_config = ParseConfig.new('user.conf').params
userid = stage_config['userid']
password = stage_config['password']

mechanize = Mechanize.new
login_page = mechanize.get 'https://support.mozilla.org/t5/user/userloginpage'

form = login_page.forms[1]
form.field_with(id: 'lia-login').value = userid
form.field_with(id: 'lia-password').value = password

page = form.submit

tkb_page = mechanize.get ARGV[0]
puts("POSSIBLE-locale,link")
tkb_page.css('div.tkb-other-language-link').each do |l|
  possible_locale = l.css('a:nth-child(1)').children.text
  possible_locale = "NOT en-us" if possible_locale == "English (US)"
  printf("%s,%s\n", possible_locale,
         "https://support.mozilla.org" +
         l.css('a:nth-child(1)/@href').first.value)
end
