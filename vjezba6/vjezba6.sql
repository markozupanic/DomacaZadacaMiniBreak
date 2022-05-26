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

