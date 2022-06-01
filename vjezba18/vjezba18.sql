#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba18\vjezba18.sql

drop database if exists vjezba18;
create database vjezba18;
use vjezba18;

create table djevojka(
    sifra int not null primary key auto_increment,
    bojaociju varchar(43) not null,
    treciputa datetime not null,
    carape varchar(32) not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    novcica decimal(18,9),
    drugiputa datetime not null,
    dukserica varchar(35),
    kratkamajica varchar(34),
    djevojka int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    novcica decimal(15,9),
    ekstroventno bit not null,
    bojakose varchar(30) not null,
    haljina varchar(37),
    narukvica int
);

create table muskarac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    nausnica int not null,
    drugiputa datetime not null,
    prstena int not null,
    modelnaocala varchar(34)
);

create table muskaracprijatelj(
    sifra int not null primary key auto_increment,
    muskarac int not null,
    prijatelj int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    carape varchar(50) not null,
    jmbag char(11),
    hlace varchar(50) not null,
    treciputa datetime,
    drugiputa datetime not null,
    muskarac int
);

create table sestra(
    sifra int not null primary key auto_increment,
    eura decimal(14,10),
    indiferentno bit,
    maraka decimal(13,8),
    ogrlica int,
    haljina varchar(31) not null,
    introvertno bit,
    mladic int
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    carape varchar(43),
    treciputa datetime not null,
    eura decimal(16,8),
    sestra int
);

alter table ostavljena add foreign key (djevojka) references djevojka(sifra);

alter table muskaracprijatelj add foreign key (prijatelj) references prijatelj(sifra);
alter table muskaracprijatelj add foreign key (muskarac) references muskarac(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table sestra add foreign key (mladic) references mladic(sifra);

alter table zarucnica add foreign key (sestra) references sestra(sifra);

insert into djevojka(sifra,bojaociju,treciputa,carape) values
(null,'zelena',2022-06-06,'crne',),(null,'crna',2020-06-06,'crvena',),
(null,'plava',2021-06-06,'bijela',);

insert into ostavljena(sifra,drugiputa,djevojka) values
(null,2022-06-06,1),(null,2002-06-06,2),
(null,2021-06-06,3);

insert into prijatelj(sifra,ekstroventno,bojakose) values
(null,null,'crna'),(null,null,'smeda'),(null,null,'crvena');

insert into muskarac(sifra,nausnica,drugiputa,prstena) values
(null,5,2022-06-06,8),(null,5,2002-06-06,4),(null,5,2021-06-06,1);

insert into muskaracprijatelj(sifra,muskarac,prijatelj) values
(null,1,1),(null,2,3),(null,3,2);

insert into mladic(sifra,carape,hlace,drugiputa) values
(null,'crne','zelene',2022-06-06),(null,'zuta','crvena',2002-06-06),
(null,'zuta','plava',2020-06-06);


insert into sestra(sifra,haljina) values
(null,'zuta'),(null,'plava'),(null,'crna');

insert into zarucnica(sifra,treciputa) values
(null,2022-06-06),(null,2021-06-06),(null,2002-06-06);

update ostavljena set drugiputa=2016-04-18;

delete from zarucnica where treciputa=2015-04-18;

select hlace from mladic where jmbag=null;

select a.bojakose,b.sestra,c.indiferentno,d.jmbag,e.nausnica
from prijatelj as a inner join zarucnica as b 
inner join sestra as c 
inner join mladic as d 
inner join muskarac as e 
where d.jmbag and e.nausnica=213
order by c.indiferentno DESC;

select a.nausnica,a.drugiputa 
from muskarac as a inner join muskaracprijatelj as b on a.sifra=b.muskarac
where a.sifra not in (select muskarac from muskaracprijatelj);




