#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba14\vjezba14.sql


drop database if exists vjezba14;
create database vjezba14;
use vjezba14;

create table muskarac(
    sifra int not null primary key auto_increment,
    carape varchar(36),
    ogrlica int not null,
    vesta varchar(44) not null,
    ekstroventno bit
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    prstena int not null,
    gustoca decimal(17,7),
    bojakose varchar(48) not null,
    ogrlica int not null,
    stilfrizura varchar(47) not null
);

create table neprijateljmuskarac(
    sifra int not null primary key auto_increment,
    neprijatelj int not null,
    muskarac int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    eura decimal(15,10) not null,
    gustoca decimal(14,5) not null,
    kuna decimal(15,6),
    haljina varchar(38) not null,
    bojakose varchar(39),
    prstena int,
    neprijatelj int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    majica varchar(39),
    drugiputa datetime not null,
    asocijalno bit not null,
    brat int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,7),
    hlace varchar(45),
    suknja varchar(36),
    dukserica varchar(36),
    kratkamajica varchar(47) not null,
    gustoca decimal(12,10) not null,
    ostavljen int
);

create table mladic(
    sifra int not null primary key auto_increment,
    drugiputa datetime not null,
    narukvica int,
    bojaociju varchar(49) not null,
    modelnaocala varchar(41)
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(39) not null,
    kratkamajica varchar(32),
    treciputa datetime,
    modelnaocala varchar(32) not null,
    prviputa datetime,
    mladic int not null
);


alter  table prijatelj add foreign key (mladic) references mladic(sifra);

alter table neprijateljmuskarac add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijateljmuskarac add foreign key (muskarac) references muskarac(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

alter table ostavljen add foreign key (brat) references brat(sifra);

alter table ostavljena add foreign key (ostavljen) references ostavljen(sifra);















