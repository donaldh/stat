
CP=/bin/cp
MKDIR=/bin/mkdir -p
DIRS=js
DEST=/Library/WebServer/Documents

all:	install

install:
	$(CP) -r $(DIRS) $(DEST)
	$(MKDIR) $(DEST)/tax
	$(CP) tax/index.html $(DEST)/tax
	$(CP) tax/data.csv $(DEST)/tax
	$(CP) tax/infl.csv $(DEST)/tax
