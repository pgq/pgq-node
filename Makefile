
EXTENSION = pgq_node

EXT_VERSION = 3.3.1
EXT_OLD_VERSIONS = 3.2 3.2.5

Extension_regress = pgq_node_init_ext   pgq_node_test
Contrib_regress   = pgq_node_init_noext pgq_node_test

include mk/common-pgxs.mk

#
# docs
#

dox: cleandox $(SRCS)
	mkdir -p docs/html
	mkdir -p docs/sql
	$(CATSQL) --ndoc structure/tables.sql > docs/sql/pgq_node.sql
	$(CATSQL) --ndoc structure/functions.sql > docs/sql/functions.sql
	$(NDOC) $(NDOCARGS)

deb:
	make -f debian/rules genfiles
	debuild -us -uc -b

debclean:
	make -f debian/rules debclean

TARNAME = $(EXTENSION)-$(EXT_VERSION)
dist:
	git archive --format=tar.gz --prefix=$(TARNAME)/ -o $(TARNAME).tar.gz HEAD

