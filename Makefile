all : li-ers.txt

consensu/vendorlist.json :
	wget -O $@ https://vendorlist.consensu.org/vendorlist.json

disconnect/services.json :
	wget -O $@ https://raw.githubusercontent.com/disconnectme/disconnect-tracking-protection/master/services.json

li-ers.txt : vendorlist.json li-ers
	./li-ers < $< > $@

clean : 
	rm -f li-ers.txt

pristine : clean
	rm -f vendorlist.json

.PHONY : all clean pristine

