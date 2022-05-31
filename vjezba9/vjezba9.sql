#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba9\vjezba9.sql


drop database if exists vjezba9;
create database vjezba9;
use vjezba9;


create table prijateljica(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    novcica decimal(16,7),
    kuna decimal(14,10) not null,
    drugiputa datetime,
    haljina varchar(45),
    kratkamajica varchar(49)
);

create table punac(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    modelnaocala varchar(30),
    kuna decimal(12,8),
    bojaociju varchar(33),
    suknja varchar(45)
);

create table punacprijateljica(
    sifra int not null primary key auto_increment,
    punac int not null,
    prijateljica int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    vesta varchar(49) not null,
    ekstroventno bit,
    carape varchar(37),
    suknja varchar(37) not null,
    punac int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    novcica decimal(18,9) not null,
    ekstroventno bit,
    vesta varchar(32) not null,
    cura int
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    gustoca decimal(17,6),
    haljina varchar(40),
    kratkamajica varchar(48) not null,
    nausnica int not null,
    brat int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(34) not null,
    suknja varchar(32),
    eura decimal(18,7) not null,
    lipa decimal(15,7) not null,
    treciputa datetime not null,
    drugiputa datetime not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    prstena int,
    drugiputa datetime not null,
    haljina varchar(38) not null,
    ostavljena int
);

alter table punacprijateljica add foreign key (prijateljica) references prijateljica(sifra);
alter table punacprijateljica add foreign key (punac) references punac(sifra);


alter table cura add foreign key (punac) references punac(sifra);

alter table brat add foreign key (cura) references cura(sifra);

alter table zarucnik add foreign key (brat) references brat(sifra);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);


insert into prijateljica (sifra,kuna) values
(null,15.8),(null,5.8),(null,78.6);

insert into punac(sifra,narukvica) values
(null,6),(null,25),(null,1);

insert into punacprijateljica(sifra,punac,prijateljica) values
(null,1,3),(null,2,1),(null,3,2);


insert into cura(sifra,vesta,suknja,punac) values
(null,'plava' ,'zelena',1),(null,'crvena' ,'zuta',2),
(null,'crna' ,'plava',3);

insert into brat(sifra,novcica,vesta) values
(null,15.6,'plava'),(null,26.7,'zelena'),(null,1.5,'zuta');

insert into snasa (sifra,drugiputa,haljina) values
(null,2022-06-06,'zelena'),(null,2002-06-06,'crna'),
(null,2020-07-06,'plava');

update snasa set drugiputa=2020-04-24;

delete from zarucnik where haljina='%a%b%';

select carape from cura where ekstroventno=null;


