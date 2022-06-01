#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba19\vjezba19.sql

drop database if exists vjezba19;
create database vjezba19;
use vjezba19;


create table decko(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(42) not null,
    gustoca decimal(16,10) not null,
    dukserica varchar(47) not null,
    stilfrizura varchar(40),
    novcica decimal(14,7) not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    indiferentno bit not null,
    suknja varchar(37) not null,
    drugiputa datetime,
    kuna decimal(13,6) not null,
    decko int
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    hlace varchar(41),
    ekstroventno bit not null,
    narukvica int,
    eura decimal(17,6) not null,
    kratkamajica varchar(46)
);

create table punica(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(39) not null,
    maraka decimal(15,6) not null,
    jmbag char(11) not null
);

create table punicaostavljena(
    sifra int not null primary key auto_increment,
    punica int not null,
    ostavljena int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    maraka decimal(12,7),
    treciputa datetime,
    ekstroventno bit,
    hlace varchar(32),
    punica int not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    ekstroventno bit,
    carape varchar(42),
    gustoca decimal(13,10) not null,
    stilfrizura varchar(34) not null,
    punac int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    drugiputa datetime not null,
    gustoca decimal(16,7),
    maraka decimal(16,9),
    ogrlica int not null,
    svekrva int 
);


alter table svekar add foreign key (decko) references decko(sifra);

alter table punicaostavljena add foreign key (punica) references punica(sifra);
alter table punicaostavljena add foreign key (ostavljena) references ostavljena(sifra);

alter table punac add foreign key (punica) references punica(sifra);

alter table svekrva add foreign key (punac) references punac(sifra);

alter table muskarac add foreign key (svekrva) references svekrva(sifra);



insert into ostavljena(sifra,ekstroventno,eura) values
(null,null,15.6),(null,null,1.6),(null,null,5.6);

insert into punica(sifra,stilfrizura,maraka,jmbag) values
(null,'krtka',18.9,12345678901),(null,'duga',18.9,12345672901),
(null,'krtka',18.9,12345678911);

insert into punicaostavljena(sifra,punica,ostavljena) values
(null,1,1),(null,2,3),(null,3,2);

insert into punac (sifra,punica) values
(null,1),(null,2),(null,3);

insert into svekrva(sifra,gustoca,stilfrizura,punac) values
(null,15.9,'duga',1),(null,5.9,'kratka',2),(null,1.9,'duga',3);

insert into muskarac(sifra,drugiputa,ogrlica) values
(null,2022-06-06,3),(null,2021-06-06,12),(null,2002-06-06,8);

insert into svekar(sifra,nausnica,indiferentno,suknja,kuna) values
(null,3,null,'plava',17.9),(null,18,null,'bijela',7.9),
(null,6,null,'crna',1.9);

update svekar set indiferentno='false';

delete from muskarac where gustoca=14.92;

select ekstroventno from punac where treciputa=null:

select a.narukvica,b.ogrlica,c.carape,d.treciputa,e.maraka
from ostavljen as a inner join muskarac as b 
inner join svekrva as c 
inner join punac as d 
inner join punica as e 
where d.treciputa and where not e.maraka=21
order by c.carape DESC;

select a.maraka,a.jmbag 
from punica as a inner join punicaostavljena as b on a.sifra=b.punica
where a.sifra not in (select punica from punicaostavljena);
