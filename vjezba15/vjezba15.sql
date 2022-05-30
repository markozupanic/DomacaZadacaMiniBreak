#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba15\vjezba15.sql

drop database if exists vjezba15;
create database vjezba15;
use vjezba15;

create table ostavljena(
    sifra int not null primary key auto_increment,
    gustoca decimal(16,7),
    stilfrizura varchar(31) not null,
    ogrlica int,
    maraka decimal(15,10)
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(30) not null,
    jmbag char(11) not null,
    dukserica varchar(45) not null,
    indiferentno bit,
    treciputa datetime not null
);

create table zarucnikostavljena(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    ostavljena int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    bojakose varchar(31) not null,
    modelnaocala varchar(40),
    zarucnik int
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(41) not null,
    vesta varchar(30),
    narukvica int not null,
    zarucnica int
);

create table decko(
    sifra int not null primary key auto_increment,
    vesta varchar(37) not null,
    bojakose varchar(45),
    gustoca decimal(18,7),
    prijatelj int not null
    );

create table brat (
    sifra int not null primary key auto_increment,
    bojakose varchar(49) not null,
    majica varchar(36),
    maraka decimal(17,9),
    vesta varchar(30) not null
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(30) not null,
    bojakose varchar(45),
    asocijalno bit not null,
    treciputa datetime not null,
    jmbag char(11) not null,
    vesta varchar(42) not null,
    brat int
);

alter table prijateljica add foreign key (brat) references brat(sifra);

alter table zarucnikostavljena add foreign key (ostavljena) references ostavljena(sifra);
alter table zarucnikostavljena add foreign key (zarucnik) references zarucnik(sifra);

alter table zarucnica add foreign key (zarucnik) references zarucnik(sifra);

alter table prijatelj add foreign key (zarucnica) references zarucnica(sifra);

alter table decko add foreign key (prijatelj) references prijatelj(sifra);

















