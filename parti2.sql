use EMSIBD;
begin
declare 
@nomeleve varchar(50),
@prenomeleve varchar(50),
@ideleve int;
set @ideleve=17;
set @nomeleve='AMRAN';
set @prenomeleve='Hamza';
print 'id:'+cast(@ideleve as varchar)+'nom:'+@nomeleve+'prenom'+@prenomeleve;
end;
go
begin
declare
@nom varchar(50),
@prenom varchar(50),
@datenaissance date;
select
@nom=nom,
@prenom=prenom,
@datenaissance=date_naissance
from Eleve
where id_eleve=2;
print 'nom:'+@nom+'prenom'+@prenom+'datenaissance:'+cast(@datenaissance as varchar);
end;
go
begin
declare
@datenaissance date,
@ageeleve int
select
@datenaissance=date_naissance
from Eleve
where id_eleve=3;
 set @ageeleve=datediff(year,@datenaissance,getdate());
 print 'date de naissance'+cast(@datenaissance as varchar)+'difference'+cast(@ageeleve as varchar);
end;
go

begin
declare
@ideleve int,
@id int,
@nomeleve varchar(50),
@prenomeleve varchar(50),
@nomclasse varchar(50);
set @id=1;
set @ideleve=@id;
select @nomeleve=e.nom,@prenomeleve=e.prenom,@nomclasse=c.nom
from Eleve e
inner join Classe c on c.id_classe=e.id_eleve
where id_eleve=@ideleve;
print 'id:'+cast(@ideleve as varchar)+'nom:'+@nomeleve+'prenom:'+@prenomeleve+'nomclasse:'+@nomclasse;
end;
go
begin
declare
@id int,
@idcours int,
@nomcours varchar(50),
@nomensegnent varchar(50),
@prenomensegnent varchar(50);
set @id=1;
set @idcours=@id;
select @idcours=co.id_cours,
@nomcours=co.nom,
@nomensegnent=en.nom,
@prenomensegnent=en.prenom 
from cours co
inner join Enseignant en on en.id_enseignant=co.id_cours
where id_cours=@idcours;
print 'nom du cours:'+@nomcours+'nom ensseignent:'+@nomensegnent;
end;
go
begin
declare
@ideleve int,
@id int,
@nomeleve varchar(50),
@prenomeleve varchar(50),
@nomcours varchar(50),
@nomenseigent varchar(50),
@note int;
set @id=3;
set @ideleve=@id;
select @nomeleve=e.nom,
@prenomeleve=e.prenom,
@nomcours=c.nom,
@nomenseigent=en.nom,
@note=n.note
from Cours c
inner join Enseignant en on en.id_enseignant=c.id_enseignant
inner join Eleve e on e.id_eleve=c.id_enseignant
inner join Note n on n.id_eleve=c.id_enseignant and n.id_cours=c.id_cours
where e.id_eleve=@ideleve;
print 'nom:'+@nomeleve;
print 'prenom:'+@prenomeleve;
print 'nom du cours:'+@nomcours;
print 'nom de lenseignant'+@nomenseigent;
print 'note de eleve:'+cast(@note as varchar);
end;






