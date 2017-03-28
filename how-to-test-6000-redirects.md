# How to Test 60000 redirects
From [Case 00137762](https://supportcases.lithium.com/5006100000AawTs)
Note this is automatable I am 99% sure via ruby script. Here is a [proof of concept in Ruby](https://github.com/rtanglao/rt-li-sumo-redirects/blob/master/get-stage-url.rb).

* 1\. For each of the approximately 6100 rows in the spreadsheet at: \
https://docs.google.com/spreadsheets/d/1bqoCUqsCvdrGTXssavzdadTRF38l8JoIjuEJxqc2QiU/edit#gid=277128454
  * A\. Please test the redirection of the links in Column D to the Target URL in Column G as follows:
    * i) In the URL from Column D "Redirect this Link" e.g. row 2 ```https://support.mozilla.org/kb/insecure-password-warning-firefox-ach```\
    replace ```support.mozilla``` with ```support-stage.allizom```  e.g. row 2, Column D -> \
    ```https://support-stage.allizom.org/kb/insecure-password-warning-firefox-ach``` \
    Let's call this ```URL 1```
    * ii) In the URL from Column G "Target URL" e.g. row 2 ```https://support.mozilla.org/t5/Protect-your-privacy/Insecure-password-warning-in-Firefox/ta-p/27861```\
    replace ```support.mozilla``` with ```support-stage.allizom``` e.g. row 2 Column G ->  \
    ```https://support-stage.allizom.org/t5/Protect-your-privacy/Insecure-password-warning-in-Firefox/ta-p/27861``` \
    Let's call this ```URL 2```
    * iii) Load ```URL 1``` in Firefox
    * iv) If Firefox redirects to ```URL 2```, THEN test PASS ELSE test FAIL
