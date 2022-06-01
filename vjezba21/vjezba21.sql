#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba21\vjezba21.sql


drop database if exists vjezba21;
create database vjezba21;
use vjezba21;


create table mladic(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(40) not null,
    treciputa datetime not null,
    asocijalno bit not null,
    majica varchar(34) not null
);

create table djevojka(
    sifra int not null primary key auto_increment,
    bojakose varchar(31),
    maraka decimal(18,7),
    indiferentno bit not null,
    kratkamajica varchar(30),
    ogrlica int not null,
    mladic int 
);

create table brat(
    sifra int not null primary key auto_increment,
    gustoca decimal(14,10),
    prviputa datetime not null,
    hlace varchar(31) not null,
    stilfrizura varchar(38),
    novcica decimal(13,5),
    indiferentno bit
);

create table zena(
    sifra int not null primary key auto_increment,
    kuna decimal(12,7) not null,
    drugiputa datetime,
    asocijalno bit not null,
    jmbag char(11),
    prviputa datetime,
    maraka decimal(17,5)
    );

create table zenabrat(
    sifra int not null primary key auto_increment,
    zena int not null,
    brat int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(45),
    bojakose varchar(35),
    nausnica int not null,
    ogrlica int,
    dukserica varchar(43) not null,
    stilfrizura varchar(39) not null,
    zena int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    bojakose varchar(50),
    ekstroventno bit not null,
    kratkamajica varchar(34) not null,
    kuna decimal(13,5) not null,
    maraka decimal(18,9),
    vesta varchar(38),
    cura int,
);

create table svekrva (
    sifra int not null primary key auto_increment,
    treciputa datetime,
    jmbag char(11),
    gustoca decimal(18,9) not null,
    ostavljen int not null
);


alter table djevojka add foreign key (mladic) references mladic(sifra);

alter table zenabrat add foreign key (brat) references brat(sifra);
alter table zena add foreign key (zena) references zena(sifra);

alter table cura add foreign key (zena) references zelena(sifra);

alter table ostavljen add foreign key (cura) references cura(sifra);

alter table svekrva add foreign key (ostavljen) references ostavljen(sifra);

insert into djevojka(sifra,indiferentno,ogrlica,) values
(null,null,2),(null,null,5),(null,null,8);

insert into brat(sifra,prviputa,hlace,) values
(null,2022-06-06,'plave'),(null,2021-06-06,'crne'),
(null,2002-06-06,'zelene');

insert into zena(sifra,kuna,asocijalno) values
(null,18.9,null),(null,1.9,null),(null,8.9,null);

insert into zenabrat(sifra,zena,brat) values
(null,1,1),(null,2,3),(null,3,2);

insert into cura(sifra,nausnica,dukserica,stilfrizura,zena) values
(null,5,'plava','duga',1),(null,1,'zelena','kratka',2),
(null,27,'crna','duga',3);

insert into ostavljen(sifra,ekstroventno,kratkamajica,kuna,) values
(null,null,'crna',29.3),(null,null,'bijela',9.3),(null,null,'crvena',2.3);

insert into svekrva(sifra,gustoca,ostavljen) values
(null,58.9,1),(null,5.9,1),(null,8.9,1);


update djevojka set maraka=15.74;

delete from svekrva where not jmbag=00000000007;

select nausnica from cura where bojakose='%a%n%a%';

select a.hlace,b.ostavljen,c.ekstroventno,d.bojakose,e.drugiputa
from brat as a inner join svekrva as b 
inner join ostavljen as c 
inner join cura as d 
inner join zena as e 
where d.bojakose='%a%' and where e.drugiputa=null
order by c.ekstroventno;

select a.drugiputa,a.asocijalno 
from zena as a inner join zenabrat as b on a.sifra=b.zelena
where a.sifra not in (select zena from zenabrat);


















