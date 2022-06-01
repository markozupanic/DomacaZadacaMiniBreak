#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba13\vjezba13.sql


drop database if exists vjezba13;
create database vjezba13;
use vjezba13;

create table svekar(
    sifra int not null primary key auto_increment,
    suknja varchar(40),
    stilfrizura varchar(34) not null,
    gustoca decimal(15,10) not null,
    carape varchar(35) not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(35),
    ogrlica int,
    ekstroventno bit not null,
    narukvica int
);

create table svekrvasvekar(
    sifra int not null primary key auto_increment,
    svekrva int not null,
    svekar int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(34),
    drugiputa datetime,
    asocijalno bit not null,
    stilfrizura varchar(40),
    svekrva int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    drugiputa datetime not null,
    carape varchar(48) not null,
    ogrlica int,
    kratkamajica varchar(42) not null,
    introvertno bit not null,
    asocijalno bit not null,
    ostavljen int
);

create table cura(
    sifra int not null primary key auto_increment,
    ogrlica int,
    hlace varchar(42),
    vesta varchar(31) not null,
    majica varchar(50),
    mladic int
);

create table muskarac(
    sifra int not null primary key auto_increment,
    dukserica varchar(34),
    gustoca decimal(13,10),
    haljina varchar(42) not null,
    majica varchar(39),
    suknja varchar(50) not null,
    kuna decimal(17,9) not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    bojakose varchar(32),
    novcica decimal(12,6) not null,
    prviputa datetime,
    indiferentno bit not null,
    suknja varchar(44),
    jmbag char(11),
    muskarac int not null
);


alter table neprijatelj add foreign key (muskarac) references muskarac(sifra);

alter table svekrvasvekar add foreign key (svekar) references svekar(sifra);
alter table svekrvasvekar add foreign key (svekrva) references svekrva(sifra);

alter table ostavljen add foreign key (svekrva) references svekrva(sifra);

alter table mladic add foreign key (ostavljen) references ostavljen(sifra);

alter table cura add foreign key (mladic) references mladic (sifra);


insert into muskarac(sifra,haljina,suknja,kuna) values
(null,'zelena','plava',15.6),(null,'zuta','plava',5.6),
(null,'crna','bijela',1.6);

insert into neprijatelj(sifra,novcica,indiferentno,muskarac) values
(null,15.9,null,1),(null,5.9,null,1),(null,1.9,null,1);

insert into svekar(sifra,stilfrizura,gustoca,carape) values
(null,'duga',15.6,'plave'),(null,'duga',1.6,'crne'),
(null,'duga',5.6,'zute');

insert into svekrva(sifra,ekstroventno) values
(null,null),(null,null),(null,null);

insert into svekrvasvekar(sifra,svekrva,svekar) values
(null,1,1), (null,3,2), (null,2,3),;

insert into ostavljen(sifra,asocijalno,svekrva) values
(null,null,1),(null,null,2),(null,null,3);

insert into mladic(sifra,drugiputa,carape,kratkamajica,introvertno,asocijalno) values
(null,2022-06-06,'zelene','plava',null,null),
(null,2021-06-06,'plava','zuta',null,null),
(null,2020-06-06,'crna','crvena',null,null);

insert into cura(sifra,vesta) values
(null,'plava'),(null,'zuta'),(null,'crna');

update neprijatelj set novcica=13.77;

delete from cura where not hlace='%a%b%';

select asocijalno from ostavljen where drugiputa=null;


select a.gustoca ,b.majica ,c.carape ,d.drugiputa ,e.ogrlica
from svekar as a inner join cura as b 
inner join mladic as c 
inner join ostavljen as d 
inner join svekrva as e 
where d.drugiputa and e.ogrlica=193
order  by c.carape DESC;

select a.ogrlica ,a.ekstroventno 
from svekrva as a inner join svekrvasvekar as b on a.sifra=b.svekrva
where a.sifra not in (select svekrva from svekrvasvekar);




