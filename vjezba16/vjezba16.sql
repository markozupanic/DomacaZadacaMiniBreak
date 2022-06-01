#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba16\vjezba16.sql


drop database if exists vjezba16;
create database vjezba16;
use vjezba16;

create table zarucnik(
    sifra int not null primary key auto_increment,
    novcica decimal(13,9) not null,
    bojakose varchar(41) not null,
    kuna decimal(16,8) not null,
    prstena int not null,
    kratkamajica varchar(44) not null,
    nausnica int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(45),
    bojakose varchar(41),
    novcica decimal(16,8),
    treciputa datetime not null
);

create table punaczarucnik(
    punac int not null,
    zarucnik int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    vesta varchar(44) not null,
    dukserica varchar(34),
    prstena int,
    majica varchar(36) not null,
    punac int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    haljina varchar(30),
    lipa decimal(12,8),
    kratkamajica varchar(33),
    kuna decimal(12,10),
    treciputa datetime not null,
    brat int not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int,
    bojakose varchar(40) not null,
    drugiputa datetime not null,
    mladic int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(49),
    asocijalno bit not null,
    hlace varchar(42)
);

create table zena(
    sifra int not null primary key auto_increment,
    gustoca decimal(12,8),
    liap decimal(16,6),
    ogrlica int,
    carape varchar(32),
    nausnica int not null,
    modelnaocala varchar(46) not null,
    prijatelj int
);

alter table zena add foreign key (prijatelj) references prijatelj(sifra);

alter table punaczarucnik add foreign key (punac) references punac(sifra);
alter table punaczarucnik add foreign key (zarucnik) references zarucnik(sifra);

alter table brat add foreign key (punac) references punac(sifra);

alter table mladic add foreign key (brat) references brat(sifra);
alter table svekrva add foreign key (mladic) references mladic(sifra);


insert into zarucnik(sifra,novcica,bojakose,kuna,prstena,kratkamajica,nausnica) values
(null,1.3,'crna',19.6,6,'zuta',9),(null,19.3,'bijela',19.6,2,'crvena',1),
(null,13.3,'zuta',19.6,19,'crna',19);

insert into punac(sifra,treciputa) values
(null,2022-06-06),(null,2012-06-06),
(null,2002-06-06);

insert into punaczarucnik(sifra,punac,zarucnik) values
(null,1,1),(null,2,3),(null,3,2);

insert into brat(sifra,vesta,majica,punac) values
(null,'zelena','crna',1),(null,'plava','bijela',2),
(null,'zuta','crvena',3);

insert into mladic(sifra,treciputa,brat) values
(null,2022-06-06,1),(null,2012-06-06,2),
(null,2021-06-06,3);

insert into svekrva(sifra,bojakose,drugiputa,mladic) values
(null,'zuta',2022-06-06,1),(null,'crvena',2020-06-06,2),
(null,'crna',2002-06-06,3);

insert into prijatelj(sifra,asocijalno) values
(null,null),(null,null),(null,null);

insert into zena(sifra,nausnica,modelnaocala) values
(null,3,'zelena'),(null,47,'zuta'),(null,2,'plava');

update zena set lipa=13.77;

delete from svekrva where not ogrlica=18;

select prstena from brat where dukserica='%a%n%a%';

select a.kuna,b.drugiputa,c.lipa,d.dukserica,e.bojakose
from zarucnica as a inner join svekrva as b 
inner join mladic as c 
inner join brat as d 
inner join punac as e
where d.dukserica='%a%' and where e.bojakose='%ba%'
order by c.lipa DESC;

select a.bojakose,a.novcica
from punac as a inner join punaczarucnik as b on a.sifra=b.punac
where a.sifra not in (select punac from punaczarucnik);







