#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba19\vjezba19.sql

drop database if exists vjezba19;
create database vjezba19;
use vjezba19;


create table decko(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(42) not null,
    gustoca decimal(16,10) not null,
    dukserica varchar(47) not null,
    stilfrizura varchar(40),
    novcica decimal(14,7) not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    indiferentno bit not null,
    suknja varchar(37) not null,
    drugiputa datetime,
    kuna decimal(13,6) not null,
    decko int
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    hlace varchar(41),
    ekstroventno bit not null,
    narukvica int,
    eura decimal(17,6) not null,
    kratkamajica varchar(46)
);

create table punica(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(39) not null,
    maraka decimal(15,6) not null,
    jmbag char(11) not null
);

create table punicaostavljena(
    sifra int not null primary key auto_increment,
    punica int not null,
    ostavljena int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    maraka decimal(12,7),
    treciputa datetime,
    ekstroventno bit,
    hlace varchar(32),
    punica int not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    ekstroventno bit,
    carape varchar(42),
    gustoca decimal(13,10) not null,
    stilfrizura varchar(34) not null,
    punac int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    drugiputa datetime not null,
    gustoca decimal(16,7),
    maraka decimal(16,9),
    ogrlica int not null,
    svekrva int 
);


alter table svekar add foreign key (decko) references decko(sifra);

alter table punicaostavljena add foreign key (punica) references punica(sifra);
alter table punicaostavljena add foreign key (ostavljena) references ostavljena(sifra);

alter table punac add foreign key (punica) references punica(sifra);

alter table svekrva add foreign key (punac) references punac(sifra);

alter table muskarac add foreign key (svekrva) references svekrva(sifra);





