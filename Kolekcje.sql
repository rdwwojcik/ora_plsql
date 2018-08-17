
create TYPE sql_table IS TABLE OF VARCHAR2(20);
/

SELECT column_value AS "Dnedain"
  FROM TABLE(sql_table('Aragorn','Faramir','Boromir'))
ORDER BY 1;
/

-------------Przykad_1 Tabele zagniezdzone
---Przechodzenie po indeksach rzadkich

DECLARE
    /* Deklaracja zmiennej o zrozumia³ej nazwie (zauwa¿, ¿e w nazwie nie ma przedrostka lv_). */
    current INTEGER;    
    /* Deklaracja lokalnej tabeli zagnie¿d¿onej. */
    lv_table SQL_TABLE := sql_table('Aragorn','Faramir','Boromir');
BEGIN
    /* Usuwanie pierwszego elementu kolekcji. */
    lv_table.DELETE(1);
    
    /* Ustawianie punktu pocz¹tkowego. */
    current := lv_table.FIRST;
    
    /* Sprawdzanie, czy bie¿¹cy indeks nie jest wiêkszy od ostatniego indeksu. */
    WHILE (current <= lv_table.LAST) LOOP
        /* Wyœwietlanie bie¿¹cej wartoœci. */
        dbms_output.put_line('Indeks ['||current||']['||lv_table(current)||']');
        
        /* Przesuwa indeks do nastêpnej wartoœci*/
        current := lv_table.NEXT(current);
    END LOOP;
END;
/

-------------Przykad_1 Tabele zagniezdzone

SELECT column_value AS "Dnedain"
 FROM TABLE(add_element(sql_table('Faramir','Boromir') ,'Aragorn'))
ORDER BY 1;

---Funkcja do aktualizowania tabeli zagniezdzonej - dodawanie nowego elementu
CREATE FUNCTION add_element ( pv_table SQL_TABLE, pv_element VARCHAR2 ) RETURN SQL_TABLE IS
    /* Deklaracja lokalnej tabeli zagnie¿d¿onej. */
    lv_table SQL_TABLE := sql_table();
BEGIN

    /* Sprawdzanie, czy kolekcja przekazana jako parametr jest zainicjowana. */
    IF pv_table.EXISTS(1) THEN -- Nieoptymalne porównanie.
    lv_table := pv_table;
    END IF;
    
    /* Sprawdzanie, czy element jest ró¿ny od null przed dodaniem go. */
    IF pv_element IS NOT NULL THEN
    /* Zajmowanie pamiêci i dodawanie elementu. */
    lv_table.EXTEND;
    lv_table(lv_table.COUNT) := pv_element;
    END IF;
    
    /* Zwracanie tabeli zagnie¿d¿onej z nowym elementem. */
    RETURN lv_table;
END;
/

UPDATE TABLE (SELECT e.home_address
                FROM employee e
               WHERE e.employee_id = 1) e
    SET e.street_address = add_element(e.street_address, 'Nr 622')
       ,e.city = 'Opole'
WHERE e.address_id = 1;

-----------------------------------TABELE ZAGNIEZDZONE

-----------------------------------VARRAY

CREATE OR REPLACE TYPE sql_varray IS VARRAY(3) OF VARCHAR2(20);

SELECT column_value AS "Three Stooges"
 FROM TABLE(sql_varray('Moe','Larry','Curly'));
 
-------------Przykad_2 VARRAY
Create Type Linia_W_Fakturze2 Is Object(
        Nr Number,
        Nazwa Varchar2(400),
        Pkwiu Varchar2(10),
        Cena_Netto Number
        );
/

create type produkty_w_fakturze2 is varray(50) of linia_w_fakturze2;
/

Create Table Faktury2 (
    Nr_Faktury Varchar2(20) Primary Key,
    Data_Wystawienia Date,
    Termin_Platnosci Date,
    Data_Sprzedazy Date,
    Produkty Produkty_W_Fakturze2
); 
/

Insert Into Faktury2 Values ('01/12/2011',Sysdate,Sysdate,Sysdate,
                            Produkty_W_Fakturze2( Linia_W_Fakturze2(1,'migomat','365635',1000) )
                            );
Insert Into Faktury2 Values('02/12/2011',Sysdate,Sysdate,Sysdate,
                            Produkty_W_Fakturze2( Linia_W_Fakturze2(1,'migomat','365635',1000) )
                            );
Insert Into Faktury2 Values('04/12/2011',Sysdate,Sysdate,Sysdate,
                            Produkty_W_Fakturze2( Linia_W_Fakturze2(1,'migomat','365635',1000),
                                                  Linia_W_Fakturze2(1,'migomat lepszy','1111111',1500),
                                                  Linia_W_Fakturze2(1,'spawarka','222222',100))
                            );
select * from faktury2 f, table(Produkty) p where p.nazwa like '%migomat%';

-------------Przykad_1 VARRAY
DECLARE
    type type_stooges is varray(5) of varchar(100);
    /* Deklaracja zmiennej typu kolekcji za pomoc¹ wywo³ania konstruktora. */
    lv_stooges type_stooges := type_stooges('Moe','Larry');
--  lv_stooges SQL_VARRAY := sql_varray('Moe','Larry');
BEGIN
    /* Wyœwietlanie aktualnej i maksymalnej liczby elementów. */
    dbms_output.put_line(
    'Aktualna liczba: ['||lv_stooges.COUNT||'] '||
    'Maksymalna liczba: ['||lv_stooges.LIMIT||']');

    /* Zajmowanie pamiêci i przypisywanie jej do nowego indeksu. */
    lv_stooges.EXTEND;

    /* Wyœwietlanie aktualnej i maksymalnej liczby elementów. */
    dbms_output.put_line(
    'Aktualna liczba: ['||lv_stooges.COUNT||'] '||
    'Maksymalna liczba: ['||lv_stooges.LIMIT||']');
    
    /* Przypisywanie nowej wartoœci. */
--  lv_collection(lv_stooges.COUNT) := 'Curly';
    lv_stooges(lv_stooges.COUNT) := 'Curly';
    
    /* Przechodzenie po kolekcji (liczba iteracji jest równa liczbie elementów). */
    FOR i IN 1..lv_stooges.COUNT LOOP
       dbms_output.put_line(lv_stooges(i));
    END LOOP;
END;
/