drop database if exists proy;
create database proy;
use proy;

create table usuario(
id_usuario varchar (2)primary key not null,
perfil varchar (200),
contra varchar(20)
);

create table cliente(
id_cliente int primary key not null,
nom_cliente varchar(100)
);

create table reporte(
id_reporte int auto_increment primary key not null,
id_user varchar(100),
id_cliente int,
cliente varchar(100),
descR varchar (900),
fecha_creacion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
ingA varchar(100),
estado varchar(100),
solucion varchar(200),
/*
id_usuario varchar(2),
foreign key (id_usuario) references usuario(id_usuario) on update cascade on delete cascade,*/
foreign key (id_cliente) references cliente(id_cliente) on update cascade on delete cascade
);

CREATE TABLE faqs (
  id int(11) NOT NULL AUTO_INCREMENT,
  question varchar(255) NOT NULL,
  answer varchar(255) NOT NULL,
  estado varchar(255),
  PRIMARY KEY (id)  
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into cliente (id_cliente,nom_cliente) values
("1","Juan Picasso Lopez"),
("2","Bruce Wayne Palacios"),
("3","Ricardo Gonzalez Hernandez"),
("4","Santiago Elizondo Figueroa "),
("5","Diego Cabrera Aquino"),
("6","Ivan Salinas Zamacona"),
("7","Valeria Chavez Grajales"),
("8","Vania Esparza Parga"),
("9","Axel Martinez Granados");

insert into usuario (id_usuario,perfil,contra) values
("1","asis","asis02"),
("2","gSop","gsop03"),
("3","gMan","gman04"),
("4","iSop","isop05"),
("5","iMan","iman06"),
("6","editor","editor07"),
("7","gMan2","gman08"),
("8","iSop2","isop09"),
("9","iMan2","iman10");

/*insert into reporte (id_reporte, id_cliente, cliente, descR, fecha_creacion, estado, solucion) values
("1","1","Juan Picasso Lopez","no me carga el sitio web",now(), "" ,"","");*/


select * from usuario;
select * from reporte;
select * from cliente;
select * from faqs;