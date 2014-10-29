
CP=/bin/cp
DIRS=js tax
DEST=/Library/WebServer/Documents

all:	install

install:
	$(CP) -r $(DIRS) $(DEST)
