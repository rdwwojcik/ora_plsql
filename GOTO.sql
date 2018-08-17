--set Serveroutput On;

begin
    Dbms_Output.Put_line('Pocz¹tek');
    goto etykieta;
    Dbms_Output.Put_line('Po goto');
    
    <<etykieta>>
    Dbms_Output.Put_line('Po etykieta');
end;