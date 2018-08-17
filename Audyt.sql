audit select table by radek by access;

select * from dba_audit_trail;

select * from dba_audit_trail WHERE USERNAME = 'RADEK';

SELECT username,
       extended_timestamp,
       owner,
       obj_name,
       action_name
FROM   dba_audit_trail
WHERE  USERNAME LIKE 'RADEK'
and owner not like 'SYS'
ORDER BY timestamp;

SELECT username,
       extended_timestamp,
       owner,
       obj_name,
       action_name
FROM   dba_audit_trail
WHERE  owner LIKE 'RADEK'
ORDER BY timestamp;