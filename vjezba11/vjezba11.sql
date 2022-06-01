#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba11\vjezba11.sql


drop database if exists vjezba11;
create database vjezba11;
use vjezba11;

create table mladic(
    sifra int not null primary key auto_increment,
    ogrlica int not null,
    stilfrizura varchar(35),
    drugiputa datetime not null,
    hlace varchar(41) not null
);

create table punac(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    kuna decimal(16,5) not null,
    vesta varchar(45) not null
);

create table punacmladic(
    sifra int not null primary key auto_increment,
    punac int not null,
    mladic int not null
);


create table svekrva(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    carape varchar(39) not null,
    haljina varchar(31),
    punac int not null
);

create table djevojka(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(45) not null,
    prstena int,
    ekstroventno bit not null,
    majica varchar(42) not null,
    introvertno bit not null,
    svekrva int
);

create table punica(
    sifra int not null primary key auto_increment,
    carape varchar(33) not null,
    drugiputa datetime,
    majica varchar(40) not null,
    haljina varchar(30) not null,
    bojakose varchar(37) not null,
    djevojka int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    novcica decimal(12,8) not null,
    bojakose varchar(39) not null,
    gustoca decimal(14,10),
    introvertno bit not null,
    asocijalno bit
);

create table muskarac(
    sifra int not null primary key auto_increment,
    maraka decimal(16,5),
    novcica decimal(13,10),
    nausnica int,
    narukvica int not null,
    gustoca decimal(12,6),
    neprijatelj int not null
);

alter table muskarac add foreign key (neprijatelj) references neprijatelj(sifra);

alter table punacmladic add foreign key (mladic) references mladic(sifra);
alter table punacmladic add foreign key (punac) references punac(sifra);

alter table svekrva add foreign key (punac) references punac(sifra);

alter table djevojka add foreign key (svekrva) references svekrva(sifra);

alter table punica add foreign key (djevojka) references djevojka(sifra);


insert into punac (sifra,kuna,vesta) values
(null,15.9,'zelena'),(null,1.9,'crna'),
(null,25.9,'plava');

insert into mladic(sifra,ogrlica,drugiputa,hlace) values
(null,3,2022-06-06,'plava'),(null,3,2021-06-06,'zelena'),
(null,3,2020-06-06,'crna');

insert into punacmladic(sifra,punac,mladic) values
(null,1,1),(null,2,2),(null,3,3);

insert into svekrva(sifra,narukvica,carape,punac) values
(null,3,'plava',1),(null,1,'crna',3),(null,18,'zelena',2);

insert into neprijatelj(sifra,narukvica,novcica,bojakose,introvertno) values
(null,2,15.3,'crna',null),(null,3,6.3,'crvena',null),(null,58,5.3,'plava',null);

insert into muskarac(sifra,narukvica,neprijatelj) values
(null,3,1),(null,2,31),(null,15,3);

insert into djevojka(sifra,kratkamajica,ekstroventno,majica,introvertno) values
(null,'plava',null,'plava',null),(null,'crna',null,'plava',null),
(null,'zelena',null,'crna',null);

insert into punica(sifra,carape,majica,haljina,bojakose,djevojka) values
(null,'zelena','plava','crna','zuta',1),
(null,'zelena','plava','crna','zuta',2),
(null,'zelena','plava','crna','zuta',3);

update muskarac set novcica=15.70;

delete from punica where drugiputa=2019-04-08;

select haljina from svekrva where carape='%a%n%a%';

select a.drugiputa ,b.haljina ,c.prstena ,d.carape ,e.kuna
from mladic as a inner join punica as b 
inner join djevojka as  c 
inner join svekrva as d 
inner join punac as e 
where d.carape='%a%' and where not e.kuna=21
order by c.prstena DESC;

select a.kuna ,a.vesta
from punac as a inner join punacmladic as b on a.sifra=b.punac
where a.sifra not in (select punac from from punacmladic);






