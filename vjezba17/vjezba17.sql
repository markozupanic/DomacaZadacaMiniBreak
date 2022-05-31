#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba17\vjezba17.sql



drop database if exists vjezba17;
create database vjezba17;
use vjezba17;

create table becar(
    sifra int not null primary key auto_increment,
    narukvica int,
    asocijalno bit not null,
    vesta varchar(48),
    kuna decimal(13,10),
    kratkamajica varchar(30) not null
);

create table brat(
    sifra int not null primary key auto_increment,
    bojaociju varchar(45),
    bojakose varchar(33),
    novcica decimal(16,7) not null,
    brat int not null
);

create table bratbecar(
    sifra int not null primary key auto_increment,
    brat int not null,
    becar int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    bojaociju varchar(45),
    bojakose varchar(33),
    novcica decimal(16,7) not null,
    brat int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    ogrlica int,
    kuna decimal(16,8),
    indiferentno bit,
    jmbag char(11),
    maraka decimal(12,7) not null,
    ostavljen int not null
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9),
    haljina varchar(37),
    maraka decimal(13,8) not null,
    modelnaocala varchar(41) not null,
    cura int
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    maraka decimal(13,6),
    narukvica int,
    nausnica int,
    lipa decimal(15,10),
    carape varchar(33) not null,
    stilfrizura varchar(35)
);

create table punica(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    narukvica int,
    gustoca decimal(18,10) not null,
    prijatelj int
);

alter table punica add foreign key (prijatelj) references prijatelj(sifra);

alter table bratbecar add foreign key (becar) references becar(sifra);
alter table bratbecar add foreign key (brat) references brat(sifra);

alter table ostavljen add foreign key (brat) references brat(sifra);

alter table cura add foreign key (ostavljen) references ostavljen(sifra);

alter table prijateljica add foreign key (cura) references cura(sifra);


insert into becar(sifra,asocijalno,kratkamajica) values
(null,null,'zelena'),(null,null,'crvena'),(null,null,'crna');

insert into brat(sifra,asocijalno,novcica,introvertno) values
(null,null,16.9,null),(null,null,1.9,null),(null,null,6.9,null);

insert into bratbecar(sifra,brat,becar) values
(null,1,1),(null,2,3),(null,3,2);

insert into ostavljen(sifra,novcica,brat) values
(null,15.9,1),(null,5.9,2),(null,1.9,3);

insert into cura(sifra,maraka,ostavljen) values
(null,15.9,1),(null,1.9,1),(null,89.9,3);

insert into prijateljica(sifra,maraka,modelnaocala) values
(null,8.6,'suncane'),(null,18.6,'dioptrijske'),(null,1.6,'suncane');

insert into prijatelj(sifra,carape) values
(null,'zelene'),(null,'crne'),(null,'plave');

insert into punica(sifra,gustoca) values
(null,19.6),(null,1.6),(null,9.6);

update punica set narukvica=11;

delete from prijateljica where not haljina='%a%b%';

select novcica from ostavljen where bojakose='%a%n%a%';






