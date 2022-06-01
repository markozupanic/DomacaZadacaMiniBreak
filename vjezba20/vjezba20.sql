#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba20\vjezba20.sql

drop database if exists vjezba20;
create vjezba20;
use vjezba20;

create table zena(
    sifra int not null primary key auto_increment,
    asocijalno bit not null,
    nausnica int,
    jmbag char(11) not null,
    bojaociju varchar(41),
    kratkamajica varchar(30)
);

create table neprijateljica(
    sifra int not null primary key auto_increment,
    introvertno bit not null,
    nausnica int,
    gustoca decimal(17,8),
    lipa decimal(17,8),
    jmbag char(11) not null,
    zena int
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    suknja varchar(31),
    prstena int not null,
    modelnaocala varchar(46) not null,
    novcica decimal(17,5) not null,
    gustoca decimal(17,8)
);

create table mladic(
    sifra int not null primary key auto_increment,
    hlace varchar(47),
    suknja varchar(50),
    haljina varchar(50) not null,
    prstena int not null,
    treciputa datetime not null,
    introvertno bit not null
);

create table mladiczarucnik(
    sifra int not null primary key auto_increment,
    mladic int not null,
    zarucnik int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    ogrlica int,
    prviputa datetime,
    drugiputa datetime not null,
    introvertno bit,
    treciputa datetime,
    mladic int not null
);

create table decko(
    sifra int not null primary key auto_increment,
    kuna decimal(14,5),
    novcica decimal(15,7),
    indiferentno bit not null,
    maraka decimal(16,9) not null,
    punica int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(50),
    suknja varchar(49) not null,
    prviputa database,
    treciputa datetime,
    decko int
);

insert into neprijateljica(sifra,introvertno,jmbag) values
(null,null,12345678901),(null,null,12345678991),
(null,null,12345678951);

insert into zarucnik(sifra,prstena,modelnaocala,novcica) values
(null,5,'suncane',18.9),(null,1,'dioptrijske',8.9),
(null,9,'suncane',1.9);

insert into mladic(sifra,haljina,prstena,treciputa,introvertno) values
(null,'plava',5,2022-06-06,null),(null,'crna',5,2020-06-06,null),
(null,'zelena',5,2002-06-06,null);

insert into mladiczarucnik(sifra,mladic,zarucnik) values
(null,1,1),(null,2,3),(null,3,2);

insert into punica(sifra,drugiputa,mladic) values
(null,2022-06-06,1),(null,2002-06-06,2),
(null,2021-06-06,3);

insert into decko(sifra,indiferentno,maraka,punica) values
(null,null,18.7,1),(null,null,1.7,2),(null,null,8.7,3);

insert into zarucnica(sifra,suknja) values
(null,'plava'),(null,'crna'),(null,'zelena');

update neprijateljica set nausnica=10;

delete from zarucnica where suknja<'%ab%';

select drugiputa from punica where prviputa=null;

select a.modelnaocala,b.treciputa,c.novcica,d.prviputa,e.suknja
from zarucnik as a inner join zarucnica as b 
inner join decko as c 
inner join punica as d 
inner join mladic as e 
where d.prviputa and where e.suknja='%ba%'
order by c.novcica DESC;

select a.suknja,a.haljina
from mladic as a inner join mladiczarucnik as b on a.sifra=b.mladic
where a.sifra not in (select mladic from mladiczarucnik);







