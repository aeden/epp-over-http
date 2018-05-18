build:
	mmark -xml2 -page epp-over-http.markdown epp-over-http.xml && xml2rfc --text epp-over-http.xml	

clean:
	rm -f epp-over-http.txt 
	rm -f epp-over-http.xml
