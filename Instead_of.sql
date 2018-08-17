


----------------------------------------------------

create view v_admin as
    select ad_id as admin_id
          ,ad_imie as imie
          ,ad_nazwisko as nazwisko
      from admin;
/
insert into v_admin(imie, nazwisko) values('gal', 'anonim');
select * from admin order by ad_czas_bazy desc;

