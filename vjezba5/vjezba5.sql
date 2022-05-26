#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba5\vjezba5.sql

drop database if exists vjezba5;
create database vjezba5;
use vjezba5;

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno bit,
    zarucnik int 
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);

alter table mladic add foreign key (zarucnik) references zarucnik(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    treciputa datetime not null,
    punac int not null
);

alter table ostavljena add foreign key (punica) references punica(sifra);

create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviput datetime not null,
    majica varchar(36),
    svekar int not null
);

alter table punica add foreign key (punac) references punac(sifra);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

alter table punac add foreign key (svekar) references svekar(sifra);

create table svekarcura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);

alter table svekarcura add foreign key (svekar) references svekar(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno bit,
    vesta varchar(47) not null
);

alter table svekarcura add foreign key (cura) references cura(sifra);

insert into mladic (sifra,kratkamajica,haljina) values
(null,'plava','zelena'),
(null,'crna','roza'),
(null,'bijela','plava');

insert into svekar(sifra,carape,eura) values
(null,'sportske',15.6),
(null,'zimske',1.6),
(null,'bijele',12.2);

insert into cura (sifra,carape,maraka) values
(null,'bijele',2.5),
(null,'crne',0.5),
(null,'roze',15.9);

insert into svekarcura(sifra,svekar,cura) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into punac (sifra,prviput,svekar) values
(null,2022-06-26,1),
(null,2021-06-26,2),
(null,2002-06-26,3);

insert into punica(sifra,hlace,nausnica,vesta,modelnaocala,treciputa,punac)
values (null,'plave',3,'dugacka','suncane',2022-06-06,1),
(null,'bijele',3,'kratka','dioptrijske',2022-03-06,2),
(null,'roze',3,'dugacka','suncane',2022-07-06,3);

insert into ostavljena (sifra,ogrlica,punica) values
(null,17,1),
(null,5,2),
(null,45,3);

update mladic set haljina='Osijek';

delete from ostavljena where ogrlica=17;

select majica from punac where prviput=null;

