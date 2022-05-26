#mysql -uroot < C:\Users\X\Documents\GitHub\DomacaZadacaMiniBreak\vjezba2\vjezba2.sql

drop database if exists vjezba2;
create database vjezba2;
use vjezba2;

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciput datetime not null,
    ekstroventno bit not null,
    prviput datetime,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table deckozarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiput datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);

alter table deckozarucnica add foreign key (decko) references decko(sifra);
alter table deckozarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table cura add foreign key (decko) references decko(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

insert into neprijatelj(sifra,haljina,modelnaocala,kuna) values
(null,'zuta' ,'suncane' ,15.6),
(null,'plava' ,'dioptrijske' ,15.6),
(null,'roza ','suncane' ,15.6),
(null,'zelena' ,'dioptrijske' ,15.6);

insert into cura(sifra,haljina,drugiput,majica) values
(null,'zelena' ,2022-05-12,'kratka'),
(null,'plava' ,2022-04-09,'kratka'),
(null,'crna' ,2019-01-01,'kratka'),
(null,'plava' ,2020-07-09,'kratka');

insert into decko(sifra,asocijalno) values
(null,null),
(null,null),
(null,null),
(null,null);

insert into zarucnica(sifra,bojakose,lipa,indiferentno) values
(null,'plava',15.8,null),
(null,'smeda',10.5,null),
(null,'crna',1.8,null),
(null,'crvena',5.9,null);

insert into deckozarucnica(sifra,decko,zarucnica) values
(null,1,1),
(null,2,3),
(null,4,2),
(null,3,4);
 
insert into svekar(sifra,ogrlica,asocijalno) values
(null,1,null),
(null,2,null),
(null,3,null);


insert into prijatelj(sifra,treciput,ekstroventno,svekar) values
(null,2022-10-15,null,1),
(null,2021-10-15,null,2),
(null,2020-10-15,null,3);

update prijatelj set treciput=2020-04-30;

#select * from cura where suknja=drugiput;



