--nom:elmouden 
--prenom:badre
--classe:3/g22
--emsi les orangers
use EMSIBD
go
--mannipulation 1
--question1
create procedure sp_inserteleve
@nom varchar(50),
@prenom varchar(50),
@date_naissance date,
@id_classe int  ,
@id_eleve int
as
begin
insert into Eleve
values
(@id_eleve,@nom,@prenom,@date_naissance ,@id_classe)
end;
go
EXEC sp_inserteleve 
    @nom = 'jjj', 
    @prenom = 'Doe', 
    @date_naissance = '2004-05-15', 
    @id_classe = 1, 
    @id_eleve = 5;
go
--question 2
create procedure sp_updateenseignantemail
@id_enseignant int,
@email varchar(50)
as
begin
update Enseignant
set email=@email
where id_enseignant=@id_enseignant;
end;
EXEC sp_updateenseignantemail @id_enseignant=1,
@email='jjj@hll';
go
--manipulation 2
--question 3:
create function fn_NbElevesParClass (@id_classe int)
returns int
as begin
declare
@cpt int;
select @cpt=count(id_eleve)
from Eleve
where id_classe=@id_classe
return @cpt;
end;
GO
SELECT dbo.fn_NbElevesParClass(3) AS KK;
go
--question 4
create function fn_moyennenoteeleve (@id_eleve int)
returns decimal
as begin
declare
@mo decimal;
select @mo=avg(note)
from Note
where id_eleve=@id_eleve
return @mo;
end;
GO
SELECT dbo.fn_moyennenoteeleve(3) AS KK;
go
--question 5
create function fn_coursparenseigent (@id_enseignent int)
returns table
as 

return (
select id_cours,nom
from cours
where id_enseignant=@id_enseignent

);

GO
SELECT * from fn_coursparenseigent(3);
go
--manipulation 3
--question 1
create function nb_total(@id_classe int)
returns int
as
begin
declare
@su int;
select @su=count(e.id_eleve)
from Eleve e
inner join Classe c on c.id_classe=e.id_classe
where c.id_classe=@id_classe;
return @su

end;
--question 2

create function ls_eleve(@val int)
returns table
as
return(
select id_eleve,note
from note
where note>@val
);
--question 3
create procedure jj_proc @id_eleve int
as
begin
declare
@nom varchar(50),
@prenom varchar(50),
@moyennenote decimal;
select @nom=e.nom,@prenom=e.prenom,@moyennenote=avg(n.note)
from Eleve e
inner join note n on n.id_eleve=e.id_eleve
where e.id_eleve=@id_eleve
group by e.nom,e.prenom
print @nom
print @prenom
print @moyennenote
end;
EXEC jj_proc
    @id_eleve = 3;
go
--question 4
create procedure jjc_proc @id_cours int as
begin
delete from cours

where id_cours=@id_cours;
delete from note

where id_cours=@id_cours;

end;























+
