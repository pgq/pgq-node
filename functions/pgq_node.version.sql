
create or replace function pgq_node.version()
returns text as $$
-- ----------------------------------------------------------------------
-- Function: pgq_node.version(0)
--
--      Returns version string for pgq_node.
-- ----------------------------------------------------------------------
declare
    _vers text;
begin
    select extversion from pg_catalog.pg_extension
        where extname = 'pgq_node' into _vers;
    return _vers;
end;
$$ language plpgsql;

