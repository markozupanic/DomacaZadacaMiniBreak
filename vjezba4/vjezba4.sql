#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba4\vjezba4.sql

drop database if exists vjezba4;
create database vjezba4;
use vjezba4;

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);
 
create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introvertno bit,
    kuna decimal(14,10)
    );

alter table punac add foreign key (ostavljen) references ostavljen(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

alter table prijatelj add foreign key (becar) references becar(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

alter table becar add foreign key (snasa) references snasa(sifra);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prsten int not null
);

alter table snasa add foreign key (zena) references zena(sifra);

create table zenamladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);

alter table zenamladic add foreign key (zena) references zena(sifra);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

alter table zenamladic add foreign key (mladic) references mladic(sifra);

insert into zena (sifra,suknja,prsten) values
(null,'duga',1),
(null,'kratka',2),
(null,'duga',3);

insert into snasa (sifra,haljina,zena) values
(null,'plava',1),
(null,'zelena',2),
(null,'roza',3);

insert into becar (sifra,kratkamajica,bojaociju,snasa) values
(null,'plava','zelena',1),
(null,'duga','plava',2),
(null,'kratka','smeda',3);



insert into mladic (sifra,vesta) values
(null,'debela'),
(null,'prozirna'),
(null,'tanka');

insert into zenamladic(sifra,zena,mladic) values
(null,1,1),
(null,2,2),
(null,3,3);



insert into ostavljen(sifra) values
(null),
(null),
(null);

insert into punac(sifra,jmbag,novcica,maraka,ostavljen) values
(null,12345678901,15.5,87.2,1),
(null,12345678901,15.5,87.2,1),
(null,12345678901,15.5,87.2,1);



update punac set majica='Osijek';

insert into prijatelj(sifra,prstena,jmbag,suknja,becar) values
(null,19,12345678902,'plava',1),
(null,15,12345678902,'plava',2),
(null,18,12345678902,'plava',3);

delete from prijatelj where prstena>17;

select haljina from snasa where treciputa=null;


select a.nausnica ,b.jmbag ,c.kratkamajica ,d.treciput ,e.lipa
from mladic as a inner join prijatelj as b
inner join becar as c 
inner join snasa as d
inner join zena as e
where d.treciputa and where not e.lipa=29
order by c.kratkamajica DESC;

select a.lipa ,a.prstena 
from zena as a inner join zenamladic as b on a.sifra=b.zena
where a.sifra not in (select zena from zenamladic);