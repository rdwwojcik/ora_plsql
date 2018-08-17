SELECT table_name, partition_name, high_value, tablespace_name, blocks, num_rows
  FROM user_tab_partitions;
  
select distinct data_prowizji from Pma_Active;

select count(*) from prowizje.sekcja_1 where s1_data >= '2017/01/01';

CREATE TABLE sekcja_1_part
 partition by range(s1_data)
(PARTITION nolessthe99 VALUES LESS THAN (to_date('2017/01/01', 'yyyy/mm/dd')))
as
select * from prowizje.sekcja_1 where s1_data >= '2017/01/01';

