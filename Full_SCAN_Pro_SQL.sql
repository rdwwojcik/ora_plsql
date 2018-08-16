select count(*) from t2;

select blocks from user_segments where segment_name = 'T2';
select count(distinct (dbms_rowid.rowid_block_number(rowid))) block_ct from t2 ;

select min(dbms_rowid.rowid_block_number(rowid)) min_blk,
       max(dbms_rowid.rowid_block_number(rowid)) max_blk from t2 ;