#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba14\vjezba14.sql


drop database if exists vjezba14;
create database vjezba14;
use vjezba14;

create table muskarac(
    sifra int not null primary key auto_increment,
    carape varchar(36),
    ogrlica int not null,
    vesta varchar(44) not null,
    ekstroventno bit
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    prstena int not null,
    gustoca decimal(17,7),
    bojakose varchar(48) not null,
    ogrlica int not null,
    stilfrizura varchar(47) not null
);

create table neprijateljmuskarac(
    sifra int not null primary key auto_increment,
    neprijatelj int not null,
    muskarac int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    eura decimal(15,10) not null,
    gustoca decimal(14,5) not null,
    kuna decimal(15,6),
    haljina varchar(38) not null,
    bojakose varchar(39),
    prstena int,
    neprijatelj int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    majica varchar(39),
    drugiputa datetime not null,
    asocijalno bit not null,
    brat int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,7),
    hlace varchar(45),
    suknja varchar(36),
    dukserica varchar(36),
    kratkamajica varchar(47) not null,
    gustoca decimal(12,10) not null,
    ostavljen int
);

create table mladic(
    sifra int not null primary key auto_increment,
    drugiputa datetime not null,
    narukvica int,
    bojaociju varchar(49) not null,
    modelnaocala varchar(41)
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(39) not null,
    kratkamajica varchar(32),
    treciputa datetime,
    modelnaocala varchar(32) not null,
    prviputa datetime,
    mladic int not null
);


alter  table prijatelj add foreign key (mladic) references mladic(sifra);

alter table neprijateljmuskarac add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijateljmuskarac add foreign key (muskarac) references muskarac(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

alter table ostavljen add foreign key (brat) references brat(sifra);

alter table ostavljena add foreign key (ostavljen) references ostavljen(sifra);


insert into mladic(sifra,drugiputa,bojaociju) values
(null,2022-06-06,'plava'),(null,2012-06-06,'zuta'),
(null,2020-06-06,'crna');

insert into prijatelj(sifra,stilfrizura,modelnaocala,mladic) values
(null,'duga','plava',1),(null,'celava','zuta',2),
(null,'kratka','crna',3);

insert into muskarac(sifra,ogrlica,vesta) values
(null,3,'plava'),(null,10,'zuta'),(null,5,'crna');

insert into neprijatelj(sifra,prstena,bojakose,ogrlica,stilfrizura) values
(null,3,'plava',6,'duga'),(null,1,'zuta',9,'celava'),
(null,2,'crna',16,'krtka');

insert into neprijateljmuskarac(sifra,neprijatelj,muskarac) values
(null,1,1),(null,2,2),(null,3,3);

insert into brat(sifra,eura,gustoca,haljina,neprijatelj) values
(null,15.6,18.9,'zuta',1),(null,1.6,8.9,'zelena',2),
(null,5.6,1.9,'crna',3);

insert into ostavljen(sifra,drugiputa,asocijalno,brat) values
(null,2002-06-06,null,1),(null,2022-06-06,null,2),
(null,2000-06-06,null,3);

insert into ostavljena(sifra,kratkamajica,gustoca) values
(null,'zelena',18.9),(null,'bijela',1.9),
(null,'crna',8.9);

update prijatelj set kratkamajica='Osijek';

delete from ostavljena where hlace>'%a%b%';

select kuna from brat where not gustoca=(6,10,16,25,36);


select a.vesta ,b.dukserica ,c.drugiputa ,d.gustoca ,e.gustoca
from muskarac as a inner join ostavljena as b 
inner join ostavljen as c 
inner join brat as d 
inner join neprijatelj as e 
where d.gustoca>100 and where not e.gustoca=22
order by c.drugiputa DESC;

select a.gustoca ,a.bojakose
from neprijatelj as a inner join neprijateljmuskarac as b on a.sifra=b.neprijatelj
where a.sifra not in (select neprijatelj from neprijateljmuskarac);














