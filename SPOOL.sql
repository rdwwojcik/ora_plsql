spool D:\Programowanie\Oracle\result.txt
    select * from admin;
spool off;


set heading off
set pages 0
set colsep ","

spool D:\Programowanie\Oracle\tablename.csv

select * from admin;

spool off;



set colsep ,     -- separate columns with a comma
set pagesize 0   -- No header rows
set trimspool on -- remove trailing blanks
set headsep off  -- this may or may not be useful...depends on your headings.
set linesize X   -- X should be the sum of the column widths
set numw X       -- X should be the length you want for numbers (avoid scientific notation on IDs)

spool myfile.csv

select table_name, tablespace_name 
  from all_tables
 where owner = 'SYS'
   and tablespace_name is not null;