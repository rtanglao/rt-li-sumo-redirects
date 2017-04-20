# rt-li-sumo-redirects
Roland's fun redirects for support.mozilla.org on lithium
## 19April2017
### 19 April2017 - Create 1 spreadsheet of Lithium redirects, bug 1357985
[bug 1357985 [redirects] Create a single spreadsheet of all in-product URL redirects: desktop, FF iOS, Firefox Focus for Android, Firefox Focus for iOS, Firefox for Android](bugzil.la/1357985)
## 17April2017
### 17April2017 - testing spreadsheet 1 and spreadsheet 2 - ON STAGE
* 1\. spreadsheet 1 testing, tl;dr [7 failures which is unchanged](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-stdout.17april2017-spreadsheet1.md) from [11april2017](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-stdout.12april2017-production-spreadsheet1.md):
```bash
./stage-test-797-redirects.rb \
11april2017-google-drive-download-of-10April2017-corrected-by-vesper-mismatchedlinks-spreadsheet1.csv \
> stdout.17april2017-spreadsheet1.md
rt-li-sumo-redirects rtanglao$ grep FAIL stdout.17april2017-spreadsheet1.md  | wc -l
       7
```
* 2\. spreadsheet 2; tl;dr [469 i.e. ALL PASS, YAY](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/STAGE-stdout.17april2017-spreadsheet2.md)
```bash
./stage-test-797-redirects.rb \
11april2017-google-drive-download-of-sumo-correct-approx-600links-spreadsheet2.csv \
> STAGE-stdout.17april2017-spreadsheet2.txt 2> STAGE-stderr.17april2017-spreadsheet2.md
```
## 13April2017
## 13April2017 Testing NPAPI on production
* 1\. [All 92 pass](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/13april2017-npapi-redirect-test.md)!
```bash
./production-test-npapi-redirects.rb NPAPI\ SUMO\ Article\ -\ URLs.csv \
>13april2017-npapi-redirect-test.md
```
### 13April2017 Testing iOS on production
* 1\. [all 60 pass](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/PRODUCTION-stdout.13april2017-case-00138883-ios-inproduct-links.md)! yay!
```bash
./production-test-797-redirects.rb \
11apri2017-case-00138883-ios\ inproduct\ links\ -\ iOS.csv \
>PRODUCTION-stdout.13april2017-case-00138883-ios-inproduct-links.md
```
```bash
wc -l PRODUCTION-stdout.13april2017-case-00138883-ios-inproduct-links.md
      60 PRODUCTION-stdout.13april2017-case-00138883-ios-inproduct-links.md
```
```bash
grep PASS PRODUCTION-stdout.13april2017-case-00138883-ios-inproduct-links.md | wc -l
      60
```
## 12April2017
### 12April2017 Testing NPAPI redirects
* 1\. [2 errors](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/PRODUCTION-12april2017-npapi-redirect-test.txt) - Lithium is should redirect to 9577 instead of 38206 
```bash
./production-test-npapi-redirects.rb \
NPAPI\ SUMO\ Article\ -\ URLs.csv \
>PRODUCTION-12april2017-npapi-redirect-test.txt
```
```bash
grep FAIL PRODUCTION-12april2017-npapi-redirect-test.txt 
FAIL,301,https://support.mozilla.org/kb/npapi-plugins-ja,\
https://support.mozilla.org/t5/-/-/ta-p/38206,\
EXPECTED:https://support.mozilla.org/t5/Manage-preferences-and-add-ons/Java-%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E5%88%A9%E7%94%A8%E3%82%AC%E3%82%A4%E3%83%89/ta-p/9577
FAIL,301,https://support.mozilla.org/kb/npapi-plugins-ja-mac,\
https://support.mozilla.org/t5/-/-/ta-p/38206,\
EXPECTED:https://support.mozilla.org/t5/Manage-preferences-and-add-ons/Java-%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E5%88%A9%E7%94%A8%E3%82%AC%E3%82%A4%E3%83%89/ta-p/9577
```
### 12April2017 Testing Spreadsheet 1 and 2 on production
#### 12April2017 Spreadsheet 1
* 1\. fingers crossed :-) for spreadsheet 1
```bash
./production-test-797-redirects.rb \
11april2017-google-drive-download-of-10April2017-corrected-by-vesper-mismatchedlinks-spreadsheet1.csv \
> stdout.12april2017-production-spreadsheet1.txt \
2> stderr.12april2017-productionspreadsheet1
```
* 2\. YAY! [7 failures](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-stdout.12april2017-production-spreadsheet1.md) instead of [yesterday's 18](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-STAGE-stdout.11april2017-spreadsheet1.md)
```bash
grep FAIL stdout.12april2017-production-spreadsheet1.txt | wc -l
       7
grep FAIL stdout.12april2017-production-spreadsheet1.txt > \
FAIL-stdout.12april2017-production-spreadsheet1.md
```
## 11April2017
### 11April2017 Testing iOS in product links - case 00138883 aka bug 1355701
* 1\. [all 60 pass on stage](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/STAGE-stdout.11april2017-case-00138883-ios-inproduct-links.md), yay!
```bash
./stage-test-797-redirects.rb 11apri2017-case-00138883-ios\ inproduct\ links\ -\ iOS.csv  \
>STAGE-stdout.11april2017-case-00138883-ios-inproduct-links.txt \
2>STAGE-stderr.11april2017-case-00138883-ios-inproduct-links.txt &
wc -l STAGE-stdout.11april2017-case-00138883-ios-inproduct-links.txt
60
grep PASS STAGE-stdout.11april2017-case-00138883-ios-inproduct-links.txt
60
```
### 11April2017 - testing spreadsheet 1 and spreadsheet 2
* 1\. spreadsheet 1 testing, tl;dr [18 failures](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-STAGE-stdout.11april2017-spreadsheet1.md):
```bash
./stage-test-797-redirects.rb \
11april2017-google-drive-download-of-10April2017-corrected-by-vesper-mismatchedlinks-spreadsheet1.csv \
> stdout.11april2017-spreadsheet1.txt
```
* 2\. spreadsheet 2; tl;dr [4 PASS](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/PASS-STAGE-stdout.11april2017-spreadsheet2.md), rest i .e. [465 fail](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-STAGE-stdout.11april2017-spreadsheet2.md) ?!? Maybe Lithium didn't run spreadsheet2?
```bash
./stage-test-797-redirects.rb \
11april2017-google-drive-download-of-sumo-correct-approx-600links-spreadsheet2.csv \
> STAGE-stdout.11april2017-spreadsheet2.txt 2> STAGE-stderr.11april2017-spreadsheet2.txt
```
## 10April2017
### 10 April 2017 -- fresh 2 column spreadsheet 2
* 1\. create CSV file
```bash
cat 08april2017-stdout-test-id-mismatches.md | cut -d ',' -f4 \
> 10April2017-id-mismatch-failures-markdown-link-syntax.txt
ggrep -oP 'https[^\]]+' 10April2017-id-mismatch-failures-markdown-link-syntax.txt \
>10April2017-id-mismatch-links-twice.txt
awk 'NR % 2 == 1' 10April2017-id-mismatch-links-twice.txt > 10April2017-id-mismatch-links-once.csv
```
* 2\. upload to Google Spreadsheeet: https://docs.google.com/spreadsheets/d/1oyIVIk5BZUvrHUPPu8LOHXYsfoZ3W_0GBF4PV8bVwIE/edit#gid=255038899
## 09April2017
### 09April2017 - script to get other language URLs
* 1\. wrote script to login and get other languages from English language URLs
```bash 
# syntax: ./get-other-language-urls.rb <english-language-kb-article-url>
cd /Users/rtanglao/Dropbox/GIT/rt-li-sumo-redirects/OTHER-LANGUAGE
./get-other-language-urls.rb \
https://support.mozilla.org/t5/Manage-preferences-and-add-ons/How-to-change-your-default-browser-in-Windows-10/ta-p/35222 \
>manage-prefs-addons-35222
```
### 09April2017 - less manual process to fix spreadsheet input errors
* 2\. 1st error is row 8:
* 2a) https://support.mozilla.org/t5/Fix-slowness-crashing-error/How-to-troubleshoot-the-error-code-quot-SEC-ERROR-UNKNOWN-ISSUER/ta-p/35844 i.e. **```35844```is the wrong guid**
* 2b) so [search for sec eror unknown issuer in the English kb](https://support.mozilla.org/t5/forums/searchpage/tab/message?filter=location,includeTkbs&q=sec%20eror%20unknown%20issuer&include_tkbs=true&location=category:Mozilla-EN). This yields the english KB url: https://support.mozilla.org/t5/Fix-slowness-crashing-error/How-to-troubleshoot-the-error-code-quot-SEC-ERROR-UNKNOWN-ISSUER/ta-p/35758 i.e. **```35758``` is the right guid**
* 2c) Feed that into the script and open field 2 so we are ready to fix the spreadsheet:
```bash
./get-other-language-urls.rb \
https://support.mozilla.org/t5/Fix-slowness-crashing-error/How-to-troubleshoot-the-error-code-quot-SEC-ERROR-UNKNOWN-ISSUER/ta-p/35758 \
> troubleshoot-sec-error-unknown-issuer-35758 
cat troubleshoot-sec-error-unknown-issuer-35758 | cut -d ',' -f2 | xargs -n 1 open 
```
## 08April2017
### 08April2017 - test last 797 redirects
* 1\. test hash mismatches - result: [all 98 japanese URLs PASS](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/PASS-08april2017-stdout-hash-issues.md), [all 230 non japanese fail](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-08april2017-stdout-test-id-mismatches.md)
```bash
./production-test-797-redirects.rb Link\ Errors\ -\ Hash\ issues\ only.csv \
2> 08april2017-stderr-hash-issues.txt \
> 08april2017-stdout-hash-issues.md  &
```
* 1a. possible bug in ROW 8, i.e. first bullet point of [FAIL-08april2017-stdout-hash-issues.md](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/FAIL-08april2017-stdout-hash-issues.md)
https://support.mozilla.org/t5/Fix-slowness-crashing-error/How-to-troubleshoot-the-error-code-quot-SEC-ERROR-UNKNOWN-ISSUER/ta-p/35844 has the wrong GUID! It should be ```35758``` NOT ```35844```
i.e. the URL should be:\
https://support.mozilla.org/t5/Fix-slowness-crashing-error/How-to-troubleshoot-the-error-code-quot-SEC-ERROR-UNKNOWN-ISSUER/ta-p/35758

* 2\. test id mismatches
```bash
./production-test-797-redirects.rb Link\ Errors\ -\ ID\ Mismatches\ only.csv \
2> 08april2017-stderr-test-id-mismatches.txt  \
>08april2017-stdout-test-id-mismatches.md &
```
## 07April2017
### 07April2017 - Focus Android redirects
* 1\. kludge test for default browser article - needs to be changed for guids
```bash
./production-test-firefox-focus-android-redirects.rb Focus\ for\ Android\ -\ Default\ browser\ article.csv  \
> 07april2017-focus-redirects-test-report.txt
```
* 2\. they all PASS ! don't be deceived by lines like (no time to update the ruby script to handle GUID redirection):
```csv
FAIL,301,https://support.mozilla.org/kb/focus-default-android-en,\
https://support.mozilla.org/t5/-/-/ta-p/1381503,\
EXPECTED:\
https://support.mozilla.org/t5/Firefox-Focus-for-Android/Set-Firefox-Focus-as-default-browser-on-Android/ta-p/1381503
```
* 3\. kludge test for overview browser article - needs to be changed for guids
```bash
./production-test-firefox-focus-android-redirects.rb \
Focus\ for\ Android\ -\ Overview\ article.csv \
> 07april2017-focus-overview-redirects.txt
```
* 4\. they all PASS ! don't be deceived by lines like (no time to update the ruby script to handle GUID redirection):
```csv
FAIL,301,\
https://support.mozilla.org/kb/focus-android-en,\
https://support.mozilla.org/t5/-/-/ta-p/1381437,\
EXPECTED:\
https://support.mozilla.org/t5/Get-Started/What-is-Firefox-Focus-for-Android/ta-p/1381437
```
### 07April2017 - what's new in Firefox for iOS 7 redirect
* 1\.all pass on staging for ios!
```bash
./test-ffios7-whats-new-redirects.rb \
Firefox\ for\ iOS\ 7\ -\ What\'s\ New\ \ -\ Overview\ article.csv \
>07april2017-firefox-ios7-whatsnew--report.txt
```
Full report [07april2017-firefox-ios7-whatsnew--report.txt](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/07april2017-firefox-ios7-whatsnew--report.txt)
* 2\. All pass on production for ios
```bash
./production-test-ffios7-whats-new-redirects.rb \
Firefox\ for\ iOS\ 7\ -\ What\'s\ New\ \ -\ Overview\ article.csv \
>07april2017-production-firefox-ios7-whatsnew--report.txt
```
## 06April2017
### 06April2017 - production testing
* 1\. new script
```bash
./production-test6000-redirects.rb 03April2017-one-csv-file-to-rule-them-all.csv \
2>production-run1-06april2017-stderr.txt \
> production-run1-06april2017-stdout.txt &
```
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
grep "locale:ja" FAIL-run6-stdout-06april2017-all-6000urls.txt \
> FAIL-ja-run6-stdout-06april2017-all-6000urls.txt
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

