ANALYZE INDEX PREMIA_SPRZ_ID_SEKCJI_IDX COMPUTE STATISTICS;
Alter index PREMIA_SPRZ_ID_SEKCJI_IDX rebuild;
select * from index_stats;

select DATA_PROWIZJI_ZWIN AS Data, V_BILLING_D2D_NEW.*
  from V_BILLING_D2D_NEW
 where DATA_PROWIZJI_ZWIN >= '2016/10/01'
--   and Id_Zdarzenia_Zwin = '1773973332'
--   and ID_KONTRAKTU_ZWIN = 'INS111036267'
--   and KOD_PRODUKTU like '%Super Nova%'
--  and NUMER_ABONENCKI = '511725576'
--   and NUMER_SPRZEDAWCY = 'RM110.00002';
--   and MODEL_TERMINALA like 'TV%'
--   and ID_KONTRAKTU like 'TEL000109351048%'
--   and KOD_PRODUKTU like 'Migracja - Tele%'
   and GLOBAL_ID IN('101754314')
--   and id_sso_zwin = 39133
--   and rodzaj_premii like '%ortfel%'
--   and ID_RODZAJ_PREMII_ZWIN IN(1215558,1215559)
order by nazwa_sso, DATA_PROWIZJI_ZWIN, WERSJA_ROZLICZENIA, GLOBAL_ID, ROZLICZENIE_LIDER_ZWIN;

select count(*) from kontrah

select *
  from D2d
 where d2d_data = '2018/03/01'
--   and d2d_rodzaj_raportu is not null;
--   and d2d_id = 2223869;
--   d2d_global_id = '101754314';

SELECT * FROM PLAN_TABLE;

--alter table d2d add constraint d2d_id_pk primary key(d2d_id);

--EXPLAin plan set statement_id = 'd2d' for
select *
  from v_active_raport_d2d
 where d2d_data = to_date('2018/03/01')
   and d2d_rodzaj_raportu is not null;