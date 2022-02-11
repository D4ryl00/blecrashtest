BINARY := ble
SOURCEDIR := BleCrashTest
SOURCES := main.m BleManager.m
BUILDDIR := generated
OBJECTS := $(addprefix $(BUILDDIR)/,$(SOURCES:%.m=%.o))
CC := gcc
CFLAGS := -x objective-c -fno-objc-arc
LDFLAGS := -framework Foundation -framework CoreBluetooth

all: $(BINARY)
.PHONY: all

$(BINARY): $(OBJECTS)
	    $(CC) $(LDFLAGS) $(OBJECTS) -o $(BINARY)

$(BUILDDIR)/%.o: $(SOURCEDIR)/%.m | $(BUILDDIR)
	    $(CC) $(CFLAGS) -I$(dir $<) -c $< -o $@

$(BUILDDIR):
	mkdir -p $@

run: $(BINARY)
	./$(BINARY)
.PHONY: run

clean:
	rm -fr $(BUILDDIR)
	rm -f $(BINARY)
.PHONY: clean
