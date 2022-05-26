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
