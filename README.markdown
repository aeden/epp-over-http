This repository holds the files used to generate the Internet Draft describing EPP over HTTP. 

## Building

To build, first install mmark (you will need Go) and xml2rfc (you will need Python PIP).

To install mmark:

```
go get github.com/miekg/mmark
cd $GOPATH/src/github.com/miekg/mmark/mmark
go install
```

Install xml2rfc:

```
pip install xml2rfc --upgrade
```

To build the RFC in text and HTML formats:

```
make
```
