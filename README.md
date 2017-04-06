# rt-li-sumo-redirects
Roland's fun redirects for support.mozilla.org on lithium
## 06April2017
### 06April2017 - 6000 redirects - better logging
* 1\. added code to log better! log row number, locale, expected uri i.e. the TO URI, actual URI, expected URI, guid
```bash
./test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2>run6-2exceptions-stderr-06april2017-all-6000urls.txt \
>run6-2exceptions-stdout-06april2017-all-6000urls.txt &
```
* 2\. create FAIL file
```bash
grep FAIL run6-2exceptions-stdout-06april2017-all-6000urls.txt \
>FAIL-run6-stdout-06april2017-all-6000urls.txt
```
* 3\.analysis ja versus NON ja failures
* 3a. 128 japanese failures - which i believe Lithium is fixing 
```bash
grep "locale:ja" FAIL-run6-stdout-06april2017-all-6000urls.txt | wc -l
    128
```
* 3b\. 1112 non japanese failures
```bash
grep -v "locale:ja" FAIL-run6-stdout-06april2017-all-6000urls.txt\
> NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt
grep -v "locale:ja" FAIL-run6-stdout-06april2017-all-6000urls.txt | wc -l\
   1112
```
* 4\. analysis of 1112 NON ja faiures
* 4a. 93 have non integer GUIDS which I believe is a result of errors in the spreadsheet i.e. SUMO needs to fix these these 93 rows of the CSV 
```bash
egrep "GUID:[^0-9]" NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt \
> NON-integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt \
wc -l NON-integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt\ 
93 NON-integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt
```
* 4b. 1019 have integer GUIDS 
```bash
egrep -v "GUID:[^0-9]" NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt \
> integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt\
wc -l integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt\
    1019 integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt
```
* 4b.i) of the 1019, 1016 has %20 in the URLs (which I believe may be a SUMO input error! not sure)
```bash
fgrep "%20" integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt  | wc -l
    1016
```
* 4b.ii) of the 1019, THREE don't have %20 in the URLs and look to be  redirecting to the wrong GUID, perhaps this is a Lithium bug??!?
```bash
fgrep -v "%20" integer-GUID-NON-ja-FAIL-run6-stdout-06april2017-all-6000urls.txt  
1. FAIL,row:1164,locale:id,code:301,GUID:27861,\
FROM:https://support-stage.allizom.org/kb/insecure-password-warning-firefox-id,\
EXPECTED:https://support-stage.allizom.org/t5/-/-/ta-p/27861,\
ACTUAL:https://support-stage.allizom.org/t5/-/-/ta-p/28758
2. FAIL,row:1196,locale:sl,code:301,GUID:27861,\
FROM:https://support-stage.allizom.org/kb/insecure-password-warning-firefox-sl,\
EXPECTED:https://support-stage.allizom.org/t5/-/-/ta-p/27861,\
ACTUAL:https://support-stage.allizom.org/t5/-/-/ta-p/36865
3. FAIL,row:1209,locale:zh-CN,code:301,GUID:36756,\
FROM:https://support-stage.allizom.org/kb/insecure-password-warning-firefox-zh-CN,\
EXPECTED:https://support-stage.allizom.org/t5/-/-/ta-p/36756,\
ACTUAL:https://support-stage.allizom.org/t5/-/-/ta-p/27861
```
## 05April2017
### 05April2017 - redirect tests blocked by Lithium certificate bustage
* 1\. added code to not verify certificates but then we get a net timeout
* 2\. run 4 with net timeoout
```bash
./test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2> run4-2exceptions-stderr-05april2017-all-6000urls.txt \
> run4-2exceptions-stdout-05april2017-all-6000urls.txt
```
```bash
cat run4-2exceptions-stderr-05april2017-all-6000urls.txt 
./test6000-redirects.rb:16: warning: already initialized constant OpenSSL::SSL::VERIFY_PEER
Net::ReadTimeout exception, message:Net::ReadTimeout, retry:1
Net::ReadTimeout exception, message:Net::ReadTimeout, retry:2
Net::ReadTimeout exception, message:Net::ReadTimeout, retry:3
Net::ReadTimeout exception, message:Net::ReadTimeout, retry:4
Net::ReadTimeout exception, message:Net::ReadTimeout, retry:5
Net::ReadTimeout exception, message:Net::ReadTimeout, RETRY FAILED
/Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/protocol.rb:158:in `rbuf_fill': Net::ReadTimeout (Net::ReadTimeout)
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/protocol.rb:136:in `readuntil'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/protocol.rb:146:in `readline'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http/response.rb:40:in `read_status_line'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http/response.rb:29:in `read_new'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http.rb:1437:in `block in transport_request'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http.rb:1434:in `catch'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http.rb:1434:in `transport_request'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http.rb:1407:in `request'
	from ./test6000-redirects.rb:38:in `block (2 levels) in <main>'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http.rb:853:in `start'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/net/http.rb:584:in `start'
	from ./test6000-redirects.rb:32:in `block in <main>'
	from ./test6000-redirects.rb:19:in `foreach'
	from ./test6000-redirects.rb:19:in `<main>'
```
* 3\. Run 5: added another exception: ```Net::OpenTimeout```, fixed to use stage redirects
```bash
./test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2>run5-2exceptions-stderr-05april2017-all-6000urls.txt \
>run5-2exceptions-stdout-05april2017-all-6000urls.txt &
```
## 03April2017
### 03April2017 - 1 CSV to rule them all :-)
* 1\. get all the urls that are valid in the original file
```bash
head -2369 Localized\ Redirects\ -\ Desktop\ -\ Locale\ Redirects.csv \
>03April2017-one-csv-file-to-rule-them-all.csv
```
* 2\. We want lines 2-1446 of 1st-2368-deleted-Localized-redirects.txt which are the valid URLs in this file
```bash
sed -n 2,1446p 1st-2368-deleted-Localized-redirects.txt \
>> 03April2017-one-csv-file-to-rule-them-all.csv
```
* 3\. we want all the lines in 1st-3820-deleted-Localized-redirects.txt
```bash
cat 1st-3820-deleted-Localized-redirects.txt \
>> 03April2017-one-csv-file-to-rule-them-all.csv
```

* 4\. Fix script to follow redirects and to check for stage not production URIs.

* 5\. test all 6000 urls (started this test run at approximately 2:50pm 03April2017 Berlin time)
```bash
./test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2>stderr-03april2017-all-6000urls.txt \
>03april2017-all6000urls.txt &
```
* 6\. Added Errno::ECONNREFUSED
```bash
./test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2> run2-2exceptions-stderr-03april2017-all-6000urls.txt \
> run2-2exceptions-03april2017-all6000urls.txt &
```
* 7\. delay by 10 seconds 40% of the time
```bash
./test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2> run3-2exceptions-stderr-03april2017-all-6000urls.txt \
> run3-2exceptions-03april2017-all6000urls.txt &
```
## 31 March 2017
### 31 March 2017 - Desktop Redirects
* 1\.run it on file with first 3820 removed
```sh
./test6000-redirects.rb 1st-3820-deleted-Localized-redirects.txt \
2>stderr-31march2017-1st-3820-deleted-Localized-redirects.txt \
>31march2017-1st-3820-deleted-Localized-redirects.txt &
```
* 2\. the result of 1. is that URLs with spaces have have the spaces changed to %20 but the same results\
nameley:\
i) unicode urls still break\
ii) there are 1 line files with REDIRECT aka the "transactional redirects" which we hopefully\
will get a fix for 

## 30March2017
### 30March2017 Firefox for iOS What's new in 7.0 Redirects
[Lithium Support Case 00137745](https://supportcases.lithium.com/5006100000AatyY)
* 1\. ```./test-ffios7-whats-new-redirects.rb Firefox\ for\ iOS\ 7\ -\ What\'s\ New\ \ -\ Overview\ article.csv >30march2017-firefox-ios7-whatsnew--report.txt```

### 30March2017 Firefox Focus Android Default Browser Redirects
[Lithium Support Case 00137745](https://supportcases.lithium.com/5006100000AatyY)
* 1\. ```./test-firefox-focus-android-redirects.rb Focus\ for\ Android\ -\ Default\ browser\ article.csv >30march2017-focus-android-default-browser-report.txt``` and they all PASS!!! YAY!!!!!!
### 30March2017 Firefox Focus Android Overview Redirects
[Lithium Support Case 00137745](https://supportcases.lithium.com/5006100000AatyY)
* 1\. ```./test-firefox-focus-android-redirects.rb Focus\ for\ Android\ -\ Overview\ article.csv >30march2017-focus-android-overview-report.txt``` and they all PASS!!!!! YAY!!!!!!

### 30March2017 NPAPI redirects

see [NPAPI Lithium Support Case 00137108](https://supportcases.lithium.com/5006100000A1zGe)

* 1\. test npapi
```sh
./test-npapi-redirects.rb NPAPI\ SUMO\ Article\ -\ URLs.csv >30march2017-npapi-redirect-test.txt &
```

* 2\. did the rest by hand at 1033p.m. and they PASSED (although there was inconsistency between support.mozilla.org and support-stage.allizom.org! full report https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/1033pm-30march2017-npapi.md
### 30March2017 Desktop redirects
*  1\. error message:
```
Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/rfc3986_parser.rb:21:in `split': \
URI must be ascii only \
"https://support.mozilla.org/t5/Procedures-to-diagnose-and-fix/Problemy-Firefox-diagnostic\xC4\x9Browa\xC4\x87-a-rozrisa\xC4\x87/ta-p/38687" (URI::InvalidURIError)
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/rfc3986_parser.rb:73:in `parse'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/common.rb:227:in `parse'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/common.rb:714:in `URI'
	from ./test6000-redirects.rb:24:in `block in <main>'
	from ./test6000-redirects.rb:16:in `foreach'
	from ./test6000-redirects.rb:16:in `<main>'
```
* 2\. fixed by:
  * going to the original Localized redirects file and loading \
  ```https://support.mozilla.org/t5/Procedures-to-diagnose-and-fix/Problemy-Firefox-diagnosticěrować-a-rozrisać/ta-p/38687``` \
  in Firefox
  * Firefox converts to meaningful URL: ```https://support.mozilla.org/t5/Procedures-to-diagnose-and-fix/Problemy-Firefox-diagnostic%C4%9Browa%C4%87-a-rozrisa%C4%87/ta-p/38687```
  * deleting the lines before 38687, fixing this url and creating a new file: ```1st-2368-deleted-Localized-redirects.txt``` 
* 3\.re-start test:
```sh
./test6000-redirects.rb 1st-2368-deleted-Localized-redirects.txt \
2>stderr-30march2017-1st-2368-deleted-Localized-redirects.txt \
>30march2017-1st-2368-deleted-Localized-redirects.txt &
```
* 4\. result after 1444 urls:
```sh
/Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/rfc3986_parser.rb:67:in `split': bad URI(is not URI?):\
https://support-stage.allizom.org/kb/Plugin crash reports-ach (URI::InvalidURIError)\
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/rfc3986_parser.rb:73:in `parse'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/common.rb:227:in `parse'
	from /Users/rtanglao/.rbenv/versions/2.3.0/lib/ruby/2.3.0/uri/common.rb:714:in `URI'
	from ./test6000-redirects.rb:22:in `block in <main>'
	from ./test6000-redirects.rb:16:in `foreach'
	from ./test6000-redirects.rb:16:in `<main>'
```

## 29March2017
* 1\. ```./test6000-redirects.rb Localized\ Redirects\ -\ Desktop\ -\ Locale\ Redirects.csv > 29march2017-test-6000-redirects-results.txt 2> stderr-29march2017.txt &```
  * errors due to
    * quotation marks in urls fixed by deleting quotation marks
    * ```ja linux``` - fixed by deleting ``` linux```
    * ```ja-mac osx``` - fixed by deleting ``` osx```
## 27March2017 Redirect Testing
* 1\. [What's new in Firefox for iOS 7.0 - PASS on stage](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/27march2017-firefox-ios-redirects-testing.md), thanks!
* 2\. [Firefox Focus on Android- FAIL - due to Mozilla giving bad spreadsheet to Lithium on stage](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/27march2017-focus-for-android-redirects-testing.md), aargh!

## PARTIAL NPAPI redirect testing 23March2017 - 12 strategic locales only

* 0\. English
    * https://support.mozilla.org/kb/npapi-plugins-en-US goes to:
https://support-stage.allizom.org/t5/Problems-with-add-ons-plugins-or/Why-do-Java-Silverlight-Adobe-Acrobat-and-other-plugins-no/ta-p/31069 - PASS
    * https://support-stage.allizom.org/kb/npapi-plugins-en-GB goes to:
https://support-stage.allizom.org/t5/Problems-with-add-ons-plugins-or/Why-do-Java-Silverlight-Adobe-Acrobat-and-other-plugins-no/ta-p/31069 - PASS
* 1\. German
  * https://support-stage.allizom.org/kb/npapi-plugins-de goes to
    https://support-stage.allizom.org/t5/Videos-Kl%C3%A4nge-Grafiken-und/Fehlerbehebung-bei-Plugins-wie-Flash-oder-Java-um-verbreitete/ta-p/14044 - PASS
* 2\. French
  * https://support-stage.allizom.org/kb/npapi-plugins-fr goes to
    https://support-stage.allizom.org/t5/Manage-preferences-and-add-ons/Comment-d%C3%A9sactiver-les-applets-Java/ta-p/13734 - PASS
* 3\. Chinese (simplified)
  * https://support-stage.allizom.org/kb/npapi-plugins-zh-CN goes to https://support-stage.allizom.org/t5/Problems-with-add-ons-plugins-or/Why-do-Java-Silverlight-Adobe-Acrobat-and-other-plugins-no/ta-p/31069 - PASS
* 4\. Hindu (India)
  * https://support-stage.allizom.org/kb/npapi-plugins-hi-IN- goes to https://support-stage.allizom.org/t5/Problems-with-add-ons-plugins-or/Why-do-Java-Silverlight-Adobe-Acrobat-and-other-plugins-no/ta-p/31069 - PASS
* 5\. Spanish
  * https://support-stage.allizom.org/kb/npapi-plugins-es-ES goes to https://support-stage.allizom.org/t5/Administrar-preferencias-y/C%C3%B3mo-desactivar-los-applets-de-Java/ta-p/8081 - PASS
    * https://support-stage.allizom.org/kb/npapi-plugins-es-AR goes to https://support-stage.allizom.org/t5/Administrar-preferencias-y/C%C3%B3mo-desactivar-los-applets-de-Java/ta-p/8081 - PASS
   * https://support-stage.allizom.org/kb/npapi-plugins-es-CL goes to https://support-stage.allizom.org/t5/Administrar-preferencias-y/C%C3%B3mo-desactivar-los-applets-de-Java/ta-p/8081 - PASS
   * https://support-stage.allizom.org/kb/npapi-plugins-es-MX goes to https://support-stage.allizom.org/t5/Administrar-preferencias-y/C%C3%B3mo-desactivar-los-applets-de-Java/ta-p/8081 - PASS
* 6\. Russian
  * https://support-stage.allizom.org/kb/npapi-plugins-ru goes to https://support-stage.allizom.org/t5/Mozilla-Support-Community/ct-p/Mozilla-EN - FAIL!<br />
  Should redirect to:<br /> https://support-stage.allizom.org/t5/%D0%A3%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5-%D0%BF%D1%80%D0%BE%D0%B1%D0%BB%D0%B5%D0%BC/%D0%9F%D0%BE%D1%87%D0%B5%D0%BC%D1%83-Java-Silverlight-Adobe-Acrobat-%D0%B8-%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D0%B5-%D0%BF%D0%BB%D0%B0%D0%B3%D0%B8%D0%BD%D1%8B-%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5-%D0%BD%D0%B5/ta-p/33171
* 7\. Japan
  * https://support-stage.allizom.org/kb/npapi-plugins-ja goes to https://support-stage.allizom.org/t5/Manage-preferences-and-add-ons/Java-%E337%E33%A9%E32%B0%E32%A4%E33%B3%E58%A9%E74%A8%E32%AC%E32%A4%E339/ta-p/9577 - FAIL! <br />
  Should redirect to:<br />
  https://support-stage.allizom.org/t5/Manage-preferences-and-add-ons/Java-%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E5%88%A9%E7%94%A8%E3%82%AC%E3%82%A4%E3%83%89/ta-p/9577 (probably just a typo)
  * https://support-stage.allizom.org/kb/npapi-plugins-ja-mac goes to https://support-stage.allizom.org/t5/Mozilla-Support-Community/ct-p/Mozilla-EN FAIL!<br />
  Should redirect to:<br /> https://support-stage.allizom.org/t5/Manage-preferences-and-add-ons/Java-%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E5%88%A9%E7%94%A8%E3%82%AC%E3%82%A4%E3%83%89/ta-p/9577
* 8\. Italian
  * https://support-stage.allizom.org/kb/npapi-plugins-it goes to https://support-stage.allizom.org/t5/Manage-preferences-and-add-ons/Informazioni-su-Java/ta-p/9445 - PASS!
* 9\. Portuguese
  * https://support-stage.allizom.org/kb/npapi-plugins-pt-BR goes to https://support-stage.allizom.org/t5/Conserte-os-problemas/Como-permitir-o-Java-em-sites-confi%C3%A1veis/ta-p/6989 - PASS!
  * https://support-stage.allizom.org/kb/npapi-plugins-pt-PT goes to https://support-stage.allizom.org/t5/Conserte-os-problemas/Como-permitir-o-Java-em-sites-confi%C3%A1veis/ta-p/6989 - PASS!
* 10\. Indonesian
  * https://support-stage.allizom.org/kb/npapi-plugins-id goes to https://support-stage.allizom.org/t5/Problems-with-add-ons-plugins-or/Why-do-Java-Silverlight-Adobe-Acrobat-and-other-plugins-no/ta-p/31069
* 11\. Polish
  * https://support-stage.allizom.org/kb/npapi-plugins-pl goes to https://support-stage.allizom.org/t5/Manage-preferences-and-add-ons/U%C5%BCywanie-wtyczki-Java-do-wy%C5Bwietlania-interaktywnej-tre%C5Bci-na/ta-p/11713 - FAIL!<br />
  Should redirect to:<br /> https://stage-support.allizom.org/t5/Manage-preferences-and-add-ons/U%C5%BCywanie-wtyczki-Java-do-wy%C5%9Bwietlania-interaktywnej-tre%C5%9Bci-na/ta-p/11713

