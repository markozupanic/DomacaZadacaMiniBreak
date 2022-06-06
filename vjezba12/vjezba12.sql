#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba12\vjezba12.sql


drop database if exists vjezba12;
create database vjezba12;
use vjezba12;

create table zena(
    sifra int not null primary key auto_increment,
    eura decimal(16,6) not null,
    indiferentno bit,
    novcica decimal(15,5)
);

create table decko(
    sifra int not null primary key auto_increment,
    hlace varchar(46),
    asocijalno bit,
    stilfrizura varchar(43) not null,
    indiferentno bit not null,
    ogrlica int,
    zena int not null
);

create table sestra(
    sifra int not null primary key auto_increment,
    lipa decimal(15,9),
    ogrlica int,
    kratkamajica varchar(43) not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    kratkamajica varchar(46) not null,
    jmbag char(11),
    nausnica int
);

create table zarucnicasestra(
    sifra int not null primary key auto_increment,
    zarucnica int not null,
    sestra int not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    maraka decimal(14,7),
    kuna decimal (15,8),
    vesta varchar(44),
    asocijalno bit not null,
    ekstroventno bit,
    zarucnica int
);

create table djevojka(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(34)not null,
    vesta varchar(40) not null,
    kratkamajica varchar(39) not null,
    suknja varchar(36) not null,
    bojaociju varchar(32) NOT null,
    prstena int not null,
    svekrva int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    lipa decimal(16,10),
    asocijalno bit,
    stilfrizura varchar(37),
    kuna decimal(14,6),
    modelnaocala varchar(38),
    djevojka int
);



alter table decko add foreign key (zena) references zena(sifra);

alter table zarucnicasestra add foreign key (zarucnica) references zarucnica(sifra);
alter table zarucnicasestra add foreign key (sestra) references sestra(sifra);

alter table svekrva add foreign key (zarucnica) references zarucnica(sifra);

alter table djevojka add foreign key (svekrva) references svekrva(sifra);

alter table prijatelj add foreign key (djevojka) references djevojka(sifra);

insert into zena(sifra,eura) values
(null,15.6),(null,5.6),(null,29.8);

insert into decko(sifra,stilfrizura,indiferentno,zena) values
(null,'kratka',null,1),(null,'celava',null,2),(null,'duga',null,3);

insert into sestra(sifra,kratkamajica) values
(null,'crna'),(null,'zelen'),(null,'plava');

insert into zarucnica(sifra,hlace,kratkamajica) values
(null,'plava','zelena'),(null,'zuta','crvena'),(null,'bijela','crna');

insert into zarucnicasestra(sifra,zarucnica,sestra) values
(null,1,1),(null,2,2),(null,3,3);

insert into svekrva(sifra,asocijalno) values
(null,null),(null,null),(null,null);

insert into djevojka(sifra,modelnaocala,vesta,kratkamajica,suknja,bojaociju,prstena,svekrva) values
(null,'plava','zelena','crna','zuta','bijela',3,1),
(null,'crna','zuta','bijela','bijela','crna',49,2),
(null,'zuta','plava','zelena','crna','zuta',6,3);

insert into prijatelj(sifra) values
(null),(null),(null);

update decko set asocijalno='false';

delete from prijatelj where asocijalno='false';

#select vesta from svekrva where not kuna=8,12,20,28,35;

select a.kratkamajica ,b.kuna ,c.vesta ,d.kuna , e.kratkamajica
from sestra as a inner join prijatelj as b
inner join djevojka as c 
inner join svekrva as d 
inner join zarucnica as e 
where d.kuna>87 and where e.kratkamajica='%ba%'
order by c.vesta DESC;

select a.kratkamajica ,a.jmbag 
from zarucnica as a inner join zarucnicasestra as b on a.sifra=b.zarucnica
where a.sifra not in (select zarucnica from zarucnicasestra);









