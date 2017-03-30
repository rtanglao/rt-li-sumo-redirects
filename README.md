# rt-li-sumo-redirects
Roland's fun redirects for support.mozilla.org on lithium

## 30March2017
## 30March2017 Firefox for iOS What's new in 7.0 Redirects
[Lithium Support Case 00137745](https://supportcases.lithium.com/5006100000AatyY)
* 1\. ```./test-ffios7-whats-new-redirects.rb Firefox\ for\ iOS\ 7\ -\ What\'s\ New\ \ -\ Overview\ article.csv >30march2017-firefox-ios7-whatsnew--report.txt```

## 30March2017 Firefox Focus Android Default Browser Redirects
[Lithium Support Case 00137745](https://supportcases.lithium.com/5006100000AatyY)
* 1\. ```./test-firefox-focus-android-redirects.rb Focus\ for\ Android\ -\ Default\ browser\ article.csv >30march2017-focus-android-default-browser-report.txt``` and they all PASS!!! YAY!!!!!!
## 30March2017 Firefox Focus Android Overview Redirects
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

