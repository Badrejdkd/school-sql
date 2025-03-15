--nom:elmouden
--prenom:badre
--classe:3em/g22 emsi les orangers 

use EMSIBD;
go
--manipulation 1
--question 1
begin
declare
@note int,
@idcours int,
@ideleve int;
set @ideleve=8;
set @idcours=2;
select @note=note
from note
where id_cours=2 and id_eleve=8;
if @note>=16
begin
print 'ececellent'
end
else if @note>=12
begin
print'bien'
end
else
begin 
print'peut mieux faire'
end;
end;
go
--question 2
begin
declare
@n int,
@id int,
@nom varchar(50),
@prenom varchar(50);
set @id=1;
select @n=min(n.note),@nom=e.nom,@prenom=e.prenom
from Eleve e
inner join Note n on e.id_eleve=n.id_eleve
where e.id_eleve=@id
group by e.nom,e.prenom;
if @n<16
begin
print 'besoin amelioration'
end
else
begin
print 'Bon travaille'
end;
print 'eleve du nom:'+@nom
print 'eleve du prenom:'+@prenom
print 'la note la plus basse est:'+cast(@n as varchar)
end;
--manipulation 3
--question 1:
begin
declare
@idd int,
@nomm varchar(50),
@prenomm varchar(50);
set @idd=1;
while @idd<6
begin
select @nomm=nom,@prenomm=prenom
from Eleve
where id_eleve=@idd
set @idd=@idd+1;
print 'nom:'+@nomm
print 'prenom'+@prenomm
end;
end;
go
--question 2
begin
declare
@iddd int,
@nomc varchar(50),
@cnt int;
set @iddd=1;
while @iddd<=3
begin
select @nomc=nom,@cnt=count(id_classe)
from Classe
where id_classe=@iddd
group by nom;
set @iddd=@iddd+1;
print 'nom classe:'+@nomc
print 'nombre du classe:'+cast(@cnt as varchar)
end;
end;
go
--manipulation 4
--question1
begin
declare
@avg float,
@i int,
@nm varchar(50),
@pr varchar(50),
@m varchar(50),
@nco varchar(50),
@avgm float;
set @i=1;
while @i<=3
begin

select @nm=e.nom,@pr=e.prenom,@avg=avg(n.note),
@m=case 
    when @avg >=10 then 'superieure ou egale a 10'
    else 'module non validé'
end 
from eleve e
inner join note n on e.id_eleve=n.id_eleve
inner join cours c on c.id_cours=n.id_cours
where e.id_eleve=@i
group by e.nom,e.prenom,c.nom;

select @nco=c.nom,@avgm=avg(n.note)
from note n
inner join cours c on c.id_cours=n.id_cours
where c.id_cours=@i
group by c.nom;

print 'eleve du nom:'+@nm
print 'eleve du prenom:'+@pr
print 'la moyenne generale:'+cast(@avg as varchar)
print 'info module:'+@m
print '---------------------------------------------'
print 'nom matiere:'+@nco
print 'moyenne matiere:'+cast(@avgm as varchar)


set @i=@i+1;
end
end;

go
--question2
begin
declare
@avgg float,
@ii int,
@mm varchar(50),
@na varchar(50),
@p varchar(50);
set @ii=1;
while @ii<=3
begin

select @na=e.nom,@p=e.prenom,@avgg=avg(n.note),
@mm=case 
    when @avgg >=16 then 'excellent'
	when @avgg >=14 and @avgg<16 then 'tres bien'
	when @avgg >=12 and @avgg<14 then 'bien'
	when @avgg >=10 and @avgg<12 then 'assez bien'
    else 'insuffisant'
end 
from eleve e
inner join note n on e.id_eleve=n.id_eleve
where n.id_eleve=@ii
group by e.nom,e.prenom;
print 'eleve du nom:'+@na
print 'eleve du prenom:'+@p
print 'la moyenne generale:'+cast(@avgg as varchar)
print @mm;

set @ii=@ii+1
end
end;