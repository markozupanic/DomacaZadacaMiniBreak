#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba6\vjezba6.sql

drop database if exists vjezba6;
create database vjezba6;
use vjezba6;


create table punac (
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviput datetime not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48)not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int 
);

alter table svekrva add foreign key (punac) references punac(sifra);


create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(35),
    prstena int not null,
    introvertno bit,
    stilfrizura varchar(36)
);

create table prijateljostavljena(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    ostavljena int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    prviput datetime not null,
    kratkamajica varchar(39) not null,
    drugiput datetime,
    maraka decimal(14,10)
);

alter table prijateljostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijateljostavljena add foreign key (ostavljena) references ostavljena(sifra);


create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int
);

alter table brat add foreign key (prijatelj) references prijatelj(sifra);

create table decko(
    sifra int not null primary key auto_increment,
    prviput datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null
);

alter table decko add foreign key (zena) references zena(sifra);
alter table zena add foreign key (brat) references brat(sifra);


insert into prijatelj(sifra,prstena,stilfrizura) values
(null,158,'kratka'),
(null,14,'celava'),
(null,48,'duga');

insert into brat(sifra,nausnica,treciputa,narukvica) values
(null,18,2022-11-18,2),
(null,48,2021-11-18,418),
(null,5,2002-11-18,48);

insert into zena (sifra,novcica,narukvica,dukserica,brat) values
(null,18.5,78,'plava',1),
(null,1827.8,17,'crna',2),
(null,1.8,4,'plava',3);

insert into decko(sifra,zena) values
(null,1),
(null,2),
(null,3);

insert into svekrva (sifra,hlace,suknja,ogrlica,treciputa,dukserica,narukvica)
values (null,'plave','zute' ,12,2022-05-06,'zelena',18),
(null,'zute','plave' ,155,2002-05-06,'crna',48),
(null,'proze','crne' ,1,2029-05-06,'bijela',10);


update svekrva set suknja='Osijek';

delete from decko where modelnaocala<'AB';

select narukvica from brat where treciputa=null;

select a.drugiputa ,b.zena ,c.narukvica ,d.treciput ,e.prstena
from ostavljena as a inner join decko as b 
inner join zena as c 
inner join brat as d 
inner join prijatelj as e
where d.treciputa and e.prstena=219
order by c.narukvica DESC;

select a.prstena ,a.introvertno 
from prijatelj as a inner join prijateljostavljena as b on a.sifra=b.prijatelj
where a.sifra not in (select prijatelj from prijateljostavljena);


