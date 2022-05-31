#mysql -uroot <C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba3\vjezba3.sql

drop database if exists vjezba3;
create database vjezba3;
use vjezba3;

create table svekar(
    sifra int not null primary key auto_increment,
    novcic decimal(16,8)  not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prsten int,
    narukvica int not null,
    cura int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiput datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

alter table svekar add foreign key (cura) references cura(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6)  not null,
    eura decimal(12,9)  not null,
    treciput datetime,
    ostavljena int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijlno bit,
    kratkamajica varchar(44) not null,
    kuna decimal(13,8) not null,
    vesta varchar(32)not null,
    snasa int
    );

alter table punica add foreign key (snasa) references snasa(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6) not null,
    majica varchar(36) not null,
    modelnaocala varchar(31) not null,
    prijatelj int
);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

create table prijateljbrat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);

alter table prijateljbrat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijateljbrat add foreign key (brat) references brat(sifra);

insert into ostavljena(sifra,lipa,majica,modelnaocala) values
(null,10.0,'kratka','zelena'),
(null,20.0,'duga','crna'),
(null,5.5,'duga','plava');

insert into snasa(sifra,kuna,eura,ostavljena) values
(null,15.6,14.6,1),
(null,1.6,11.6,2),
(null,9.4,2.4,3);

insert into prijatelj (sifra,indiferentno) values
(null,null),
(null,null),
(null,null);

insert into brat (sifra,ogrlica,ekstroventno) values
(null,1,null),
(null, 2,null),
(null, 3,null);

insert into prijateljbrat(sifra,prijatelj,brat) values 
(null,1,1),
(null,3,2),
(null,2,3);



insert into cura (sifra,ogrlica) values
(null,1),
(null,2),
(null,3);

insert into svekar(sifra,novcic,suknja,narukvica,cura) values
(null,15.9,'plava' ,1,1),
(null,9.6,'roza' ,2,2),
(null,1.5,'bijela' ,3,3);


update svekar set suknja='Osijek';


insert into punica (sifra,kratkamajica,kuna,vesta) values
(null,'ab',15.6,'plava'),
(null,'plava',1.6,'crna'),
(null,'anarb',15.9,'zuta');

delete from punica where kratkamajica like '%a%b%';

select majica from ostavljena where not lipa(9,10,20,30,35);

select a.ekstroventno ,b.vesta ,c.kuna ,d.lipa ,e.haljina 
from brat as a inner join punica as b
inner join snasa as c 
inner join ostavljena as d 
inner join prijatelj as e 
where not d.lipa=91 and e.haljina like '%ba%'
order by c.kuna DESC;

select a.haljina, a.lipa 
from prijatelj as a inner join prijateljbrat as b a.sifra=b.prijatelj
where a.sifra not in (select sestra from prijateljbrat);








