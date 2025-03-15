create database EMSIBDG22;

	USE EMSIBDG22;
	go
  create table classe(
   id_classe INT constraint PK_IC PRIMARY KEY,
   nom varchar(50)  constraint vc_nm  not null
   );
   go
   create table enseignant (
    id_enseignant INT constraint PK_IE PRIMARY KEY,
	nom varchar(50)  constraint vc_ne  not null,
	prenom varchar(50)  constraint vc_pe  not null,
	email varchar(80)  constraint vc_ee  UNIQUE
   );
   go
   create table cours(
    id_cours INT constraint PK_cours PRIMARY KEY,
	nom varchar(50)  constraint vc_ne  not null,
	id_enseignant INT constraint FK_IC FOREIGN KEY(id_enseignant) references enseignant(id_enseignant)
	);
	go
	create table eleve(
	id_eleve INT constraint PK_ele  PRIMARY KEY,
	nom varchar(50)  constraint vc_ele  not null,
	prenom varchar(50)  constraint vc_ele  not null,
	date_naissance date ,
	id_classe INT constraint FK_ele FOREIGN KEY (id_classe) references classe(id_classe)
	);
	go
	create table note (
    id_eleve int constraint fk_eleve foreign key (id_eleve) references eleve(id_eleve),
    id_cours int constraint fk_cours foreign key (id_cours) references cours(id_cours),
    note decimal(4,2) constraint nt_nt check (note >= 0 and note <= 20),
    constraint pk_note primary key (id_eleve, id_cours)
);


	go 
	--INSERTION DANS LES TABLES
insert into classe (id_classe,nom)
values 
(1, '3eme A'),
(2, '4eme B'),
(3, '5eme C');
go 
insert into enseignant(id_enseignant,nom,prenom,email)
values
(1,'Bekkari','Anas','Bek.anas@gmail.com'),
(2,'Baroudi','Meryam','Bar.meryam@gmail.com'),
(3,'Ammar','Mouncef','Am.mouncef@gmail.com');

go
insert into eleve(id_eleve,nom,prenom,date_naissance,id_classe)
values
(1,'Naciri','Amina','2000-02-14' ,3),
(2,'Amrani','Ahmed','2001-06-18' ,2),
(3,'Hassani','Karim','2001-12-05' ,1);
go
insert into cours(id_cours,nom,id_enseignant)
values
(1,'mathematiques',1),
(2,'francais',2),
(3,'histoire',3);
go
insert into note(id_eleve,id_cours,note)
values
(1,1,14.00),
(1,2,16.00),
(1,3,12.00),
(2,1,15.00),
(2,2,18.00),
(2,3,13.00),
(3,1,13.00),
(3,2,17.00),
(3,3,14.00);

--MODIFICATION DES DONNEES
go
update enseignant 
set email ='Bek.anas@emsi.ma' 
where id_enseignant=1;
go
update enseignant 
set email ='Bar.meryam@emsi.ma' 
where id_enseignant=2;
go
update enseignant 
set email ='Am.mounsef@emsi.ma'
where id_enseignant=3;
go