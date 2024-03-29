
EXTENSION = pgq_node

EXT_VERSION = 3.5
EXT_OLD_VERSIONS = 3.2 3.2.5 3.3.1 3.4

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

