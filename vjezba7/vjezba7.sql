#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba7\vjezba7.sql

drop database if exists vjezba7;
create database vjezba7;
use vjezba7;

create table mladic(
    sifra int not null primary key auto_increment,
    prstena int,
    lipa decimal(14,5)not null,
    narukvica int null,
    drugiputa datetime not null
);

create table zarucnikmladic(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    mladic int not null
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    vesta varchar(34),
    asocijalno bit not null,
    modelnaocala varchar(43),
    narukvica int not null,
    novcica decimal(15,5) not null
);

alter table zarucnikmladic add foreign key (mladic) references mladic(sifra);
alter table zarucnikmladic add foreign key (zarucnik) references zarucnik(sifra);


create table ostavljen(
    sifra int not null primary key auto_increment,
    lipa decimal(14,6),
    introvertno bit not null,
    kratkamajica varchar(38) not null,
    prsten int not null,
    zarucnik int 
);

alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);

create table prijateljica(
    sifra int not null primary key auto_increment,
    haljina varchar(45),
    gustoca decimal(15,10) not null,
    ogrlica int,
    novcica decimal(12,5),
    ostavljen int
);

alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);

create table sestra(
    sifra int not null primary key auto_increment,
    bojakose varchar(34) not null,
    hlace varchar(36) not null,
    lipa decimal(15,6),
    stilfrizura varchar(40) not null,
    maraka decimal(12,8) not null,
    prijateljica int
);

alter table sestra add foreign key (prijateljica) references prijateljica(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9) not null,
    introvertno bit,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,8)
);

create table punica(
    sifra int not null primary key auto_increment,
    majica varchar(40),
    eura decimal(12,6) not null,
    prsten int,
    cura int not null
);

alter table punica add foreign key (cura) references cura(sifra);


insert into mladic(sifra,lipa,narukvica,drugiputa) values
(null,14.5,45,2020-15-05),
(null,19.5,45,2021-09-05),
(null,1.8,45,2002-5-05);

insert into zarucnik(sifra,asocijalno,narukvica,novcica) values
(null,null,18,15.8),
(null,null,48,5.8),
(null,null,5,195.8);

insert into zarucnikmladic(sifra,zarucnik,mladic) values
(null,1,1),(null,2,3),(null,3,2);

insert into ostavljen(sifra,introvertno,kratkamajica,prsten) values
(null,null,'plava',18),
(null,null,'crna',5),
(null,null,'roza',56);

insert into prijateljica(sifra,gustoca) values
(null,18.6),(null,48.9),(null,5.9);

insert into sestra(sifra,bojakose,hlace,stilfrizura,maraka) values
(null,'plava','a','kratka',15.6),
(null,'crna','roza','duga',1.3),
(null,'bijela','crvena','kratka',78.2);

insert into cura(sifra,lipa) values
(null,48.6),
(null,15.6),
(null,5.3);

insert into punica(sifra,eura,cura) values
(null,45.6,1),
(null,1.6,2),
(null,14.3,3);

update punica set  eura=15.77;


delete from sestra where hlace<'ab';

select kratkamajica from ostavljen where introvertno=null;

select a.narukvica ,b.stilfrizura ,c.gustoca ,d.introvertno ,e.asocijalno
from mladic as a inner join sestra as b
inner join prijateljica as c
inner join ostavljen as d
inner join zarucnik as e
where d.introvertno add where e.asocijalno
order by c.gustoca DESC;

select a.asocijalno ,a.modelnaocala
from zarucnik as a inner join zarucnikmladic as b on a.sifra=b.zarucnik
where a.sifra not in (select zarucnik from zarucnikmladic);

