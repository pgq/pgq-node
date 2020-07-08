
create extension pgq;

create extension pgq_node;
select array_length(extconfig, 1) as dumpable from pg_catalog.pg_extension where extname = 'pgq_node';

