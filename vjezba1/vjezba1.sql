#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba1\vjezba1.sql

drop database if exists vjezba1;
create database vjezba1;
use vjezba1;

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41)
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6)not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int 
);

alter table cura add foreign key (punac) references punac(sifra);


create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46)not null,
    narukvica int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiput datetime,
    asocijalno bit,
    ekstroventno bit not null,
    dukserica varchar(48) not null,
    muskarac int 
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);


insert into sestra (sifra,haljina,hlace,narukvica) values
(null,'zelena' ,'kratke', 3),
(null,'plava' ,'duge', 1),
(null,'žuta' ,'široke', 4);

insert into zena (sifra,kratkamajica,jmbag,bojaociju,sestra,hlace) values
(null,'zelena' , 1234567891 ,'plava',1,'lijepe'),
(null,'zuta' , 1234561891 ,'smeđa',2,'narančaste'),
(null,'crvena' , 1204567891 ,'zelena',3,'roze');



insert into muskarac(sifra,bojaociju,maraka,zena) values
(null,'Plava' ,14.5,1),
(null,'Smedja' ,4,2),
(null,'zelena' ,9.4,3);

insert into svekar(sifra,bojaociju) values
(null,'zelena'),
(null, 'plava'),
(null,'smeđa');


insert into sestra_svekar(sifra,sestra,svekar) values
(null,1,1),
(null,1,3),
(null,1,2);

insert into cura(sifra,novcica,gustoca,ogrlica) values
(null,11.2,1.4,1),
(null,1.4,5.7,1),
(null,1.2,13.4,1),
(null,8.2,10.4,1),
(null,18.2,14,1);


update cura set gustoca=15.77;

insert into mladic(sifra,suknja,kuna,ekstroventno,dukserica) values
(null,'kratka',18.9,null,'plava'),
(null,'duga',20.1,null,'crvena'),
(null,'prozirna',5.9,null,'zuta'),
(null,'poderana',89.1,null,'ljubicasta'),
(null,'kratka',7.6,null,'zelena');

delete from mladic where kuna>15.78;

select kratkamajica from zena where hlace like '%a%n%a%';




select a.dukserica, b.asocijalno, c.hlace, d.hlace, e.haljina
    from svekar as a inner join mladic as b
        inner join muskarac as c
            inner join zena as d 
                inner join sestra as e
where d.hlace like 'a%' and e.haljina like '%ba%'
order by c.hlace DESC;



select a.haljina, a.maraka
    from sestra as a inner join sestra_svekar as b on a.sifra = b.sestra
where a.sifra not in (select sestra from sestra_svekar);



