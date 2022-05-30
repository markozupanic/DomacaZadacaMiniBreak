#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba11\vjezba11.sql


drop database if exists vjezba11;
create database vjezba11;
use vjezba11;

create table mladic(
    sifra int not null primary key auto_increment,
    ogrlica int not null,
    stilfrizura varchar(35),
    drugiputa datetime not null,
    hlace varchar(41) not null
);

create table punac(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    kuna decimal(16,5) not null,
    vesta varchar(45) not null
);

create table punacmladic(
    sifra int not null primary key auto_increment,
    punac int not null,
    mladic int not null
);


create table svekrva(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    carape varchar(39) not null,
    haljina varchar(31),
    punac int not null
);

create table djevojka(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(45) not null,
    prstena int,
    ekstroventno bit not null,
    majica varchar(42) not null,
    introvertno bit not null,
    svekrva int
);

create table punica(
    sifra int not null primary key auto_increment,
    carape varchar(33) not null,
    drugiputa datetime,
    majica varchar(40) not null,
    haljina varchar(30) not null,
    bojakose varchar(37) not null,
    djevojka int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    novcica decimal(12,8) not null,
    bojakose varchar(39) not null,
    gustoca decimal(14,10),
    introvertno bit not null,
    asocijalno bit
);

create table muskarac(
    sifra int not null primary key auto_increment,
    maraka decimal(16,5),
    novcica decimal(13,10),
    nausnica int,
    narukvica int not null,
    gustoca decimal(12,6),
    neprijatelj int not null
);

alter table muskarac add foreign key (neprijatelj) references neprijatelj(sifra);

alter table punacmladic add foreign key (mladic) references mladic(sifra);
alter table punacmladic add foreign key (punac) references punac(sifra);

alter table svekrva add foreign key (punac) references punac(sifra);

alter table djevojka add foreign key (svekrva) references svekrva(sifra);

alter table punica add foreign key (djevojka) references djevojka(sifra);





