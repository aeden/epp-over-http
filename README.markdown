This repository holds the files used to generate the Internet Draft describing EPP over HTTP. 

## Building

To build:

  go get github.com/miekg/mmark
  cd $GOPATH/src/github.com/miekg/mmark/mmark
  go install
  mmark -xml2 -page epp-over-http.markdown epp-over-http.xml

To create RFCs:

  pip install xml2rfc --upgrade
  mmark -xml2 -page epp-over-http.markdown epp-over-http.xml && xml2rfc --text epp-over-http.xml

You can also build with make once you have mmark and xml2rfc installed.

  make
