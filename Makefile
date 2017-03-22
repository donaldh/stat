
ORIGIN=https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/600489
XLSX=Feb17_Receipts_Table_Final.xlsx
CSV=raw-receipts.csv
DATA=tax/data.csv

CP=/bin/cp
MKDIR=/bin/mkdir -p
DIRS=js
DEST=/Library/WebServer/Documents
COLUMNS=0,3,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,33

all:	$(DATA)

$(XLSX):
	curl -o $(XLSX) "$(ORIGIN)/$(XLSX)"

head::
	curl -I "$(ORIGIN)/$(XLSX)"

$(CSV):	$(XLSX)
	source /Users/donaldh/dev/.stat/bin/activate && xlsx2csv $(XLSX) $(CSV)

$(DATA)::	$(CSV) Makefile
	./csv-filter.p6 $(CSV) $(COLUMNS) > $(DATA)

install:
	$(CP) -r $(DIRS) $(DEST)
	$(MKDIR) $(DEST)/tax
	$(CP) tax/index.html $(DEST)/tax
	$(CP) tax/data.csv $(DEST)/tax
	$(CP) tax/infl.csv $(DEST)/tax

server::
	python -m SimpleHTTPServer

clean:
	rm $(XLSX) $(CSV)
