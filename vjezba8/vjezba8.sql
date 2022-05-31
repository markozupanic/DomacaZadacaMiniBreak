#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba8\vjezba8.sql

drop database if exists vjezba8;
create database vjezba8;
use vjezba8;

create table prijateljica(
    sifra int not null primary key auto_increment,
    vesta varchar(50),
    nausnica int not null,
    introvertno bit not null
);

create table cura(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    indiferentno bit,
    ogrlica int not null,
    gustoca decimal(12,6),
    drugiputa datetime,
    vesta varchar(33),
    prijateljica int
);

alter table cura add foreign key (prijateljica) references prijateljica(sifra);

create table decko(
    sifra int not null primary key auto_increment,
    kuna decimal(12,10),
    lipa decimal(17,10),
    bojakose varchar(44),
    treciputa datetime not null,
    ogrlica int not null,
    ekstroventno bit 
);

create table muskaracdecko(
    sifra int not null primary key auto_increment,
    muskarac int not null,
    decko int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    haljina varchar(47),
    drugiputa datetime not null,
    treciputa datetime
);

alter table muskaracdecko add foreign key (decko) references decko(sifra);
alter table muskaracdecko add foreign key (muskarac) references muskarac(sifra);

create table becar(
    sifra int not null primary key auto_increment,
    eura decimal(15,10),
    treciputa datetime,
    prviputa datetime,
    muskarac int not null
);

alter table becar add foreign key (muskarac) references muskarac(sifra);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(44),
    introvertno bit,
    indiferentno bit,
    ogrlica int not null,
    becar int not null
);

alter table neprijatelj add foreign key (becar) references becar(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    introvertno bit,
    novcica decimal(14,7) not null,
    treciputa datetime,
    neprijatelj int
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);


insert into prijateljica(sifra,nausnica,introvertno) values
(null,18,null),(null,789,null),(null,8,null);

insert into cura(sifra,nausnica,ogrlica) values
(null,78,26),(null,14,24),(null,7,6);

insert into decko(sifra,treciputa,ogrlica,ekstroventno) values
(null,2020-03-06,4,null),(null,2020-04-01,48,null),
(null,2022-04-06,78,null);

insert into muskarac(sifra,drugiputa) values
(null,2022-04-06),(null,2020-04-06),(null,2015-04-06);

insert into muskaracdecko(sifra,muskarac,decko) values
(null,1,2),(null,3,1),(null,2,3);

insert into becar(sifra,eura,muskarac) values
(null,15.6,1),(null,1.9,2),(null,78.9,3);

insert into neprijatelj(sifra,ogrlica,becar) values
(null,45,1),(null,9,3),(null,18,2);

insert into brat(sifra,novcica) values
(null,59.3),(null,6.5),(null,14.9);

insert into prijateljica(sifra,nausnica,introvertno) values
(null,45,null),(null,21,null),(null,7,null);

insert into cura(sifra,nausnica,ogrlica) values
(null,4,47),(null,19,14),(null,78,3);

update cura set indiferentno='false';

delete from brat where not novcica=12.75;

select prviputa from becar where treciputa=null;

