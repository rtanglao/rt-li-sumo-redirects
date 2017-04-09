#!/usr/bin/env ruby
require 'rubygems'
require 'mechanize'
require 'parseconfig'
require 'pp'

stage_config = ParseConfig.new('user.conf').params
userid = stage_config['userid']
password = stage_config['password']
puts userid
puts password

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
pp page
tkb_page = mechanize.get 'https://support.mozilla.org/t5/Manage-preferences-and-add-ons/How-to-change-your-default-browser-in-Windows-10/ta-p/35222'
pp tkb_page.css('div.tkb-other-language-links')
