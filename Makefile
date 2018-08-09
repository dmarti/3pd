all : li-ers.txt

data/consensu/vendorlist.json :
	mkdir -p `dirname $@`
	wget -O $@ https://vendorlist.consensu.org/vendorlist.json

data/disconnect/services.json :
	mkdir -p `dirname $@`
	wget -O $@ https://raw.githubusercontent.com/disconnectme/disconnect-tracking-protection/master/services.json

data : data/consensu/vendorlist.json data/disconnect/services.json

li-ers.txt : data/consensu/vendorlist.json scripts/li-ers
	scripts/li-ers < $< > $@

clean : 
	rm -f li-ers.txt

pristine : clean
	rm -rf data

.PHONY : all clean data pristine

