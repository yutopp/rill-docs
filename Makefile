.PHONY: build

build: bin/mdbook
	bin/mdbook build

serve: bin/mdbook
	bin/mdbook serve

# download mdBook.
# https://github.com/azerupi/mdBook
MDBOOK_VERSION="v0.0.14"
MDBOOK_ARCH="i686-unknown-linux-gnu"
bin/mdbook:
	if [ ! -e bin ]; then mkdir bin; fi
	cd bin && \
	wget https://github.com/azerupi/mdBook/releases/download/$(MDBOOK_VERSION)/mdBook-$(MDBOOK_VERSION)-$(MDBOOK_ARCH).tar.gz && \
	tar zxvf mdBook-$(MDBOOK_VERSION)-$(MDBOOK_ARCH).tar.gz
