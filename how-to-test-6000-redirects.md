# How to Test 60000 redirects
From [Case 00137762](https://supportcases.lithium.com/5006100000AawTs)
* 1\. For each of the approximately 6100 rows in the spreadsheet at: \
https://docs.google.com/spreadsheets/d/1bqoCUqsCvdrGTXssavzdadTRF38l8JoIjuEJxqc2QiU/edit#gid=277128454
  * A\. Please test the redirection of the links in Column D to the Target URL in Column G as follows:
    * i\. Copy the URL from Column D e.g. ```https://support.mozilla.org/kb/Page Info window#General-fy-NL```
    * ii\. In the URL replace "support.mozilla" with "support-stage.allizom" -> 
    ```https://support.mozilla.org/kb/Page Info window#General-fy-NL``` \
    and load that URL into your browser (e.g. ```https://support-stage.allizom.org/kb/Page Info window#General-fy-NL```)
    * iii\. Verify that the browser redirects to the URL in 
