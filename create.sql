create table carro (
	id int auto_increment not null primary key,
	modelo varchar(255) not null,
	cor enum('branco','preto','prata') null,
	versao varchar(255),
	categoria varchar(255),
	is_available tinyint
);

alter table carro modify column is_available tinyint default 1 null; --para determinar que por padrão o carro esta disponivel
alter table carro add montadora varchar(255) not null; 

-- // ============================== // --

create table endereco (
	id int auto_increment not null primary key,
	cep varchar(8) not null,
	rua varchar(255) not null,
	numero varchar(10),
	bairro varchar(255),
	complemento varchar(255)
);

alter table endereco add cidade varchar(255) not null;
alter table endereco add estado varchar(255) not null;

-- // ============================== // --

create table cliente (
	id int auto_increment not null,
	nome varchar(255) not null,
	email varchar(255) null,
	telefone varchar(12) null,
	id_endereco int not null,
	constraint cliente_pk primary key (id),
	constraint cliente_fk foreign key (id_endereco) references endereco(id)
);

alter table cliente add constraint cliente_un unique key (id_endereco);

-- // ============================== // --

create table franquia (
	id int auto_increment not null,
	nome varchar(255) not null,
	id_endereco int not null,
	constraint franquia_pk primary key (id),
	constraint franquia_fk foreign key (id_endereco) references endereco(id)
);

alter table franquia add constraint franquia_un unique key (id_endereco);

-- // ============================== // --

create table aluguel (
	id int auto_increment not null,
	data_aluguel datetime default now() not null,
	data_devolucao datetime null,
	km_inicial int not null,
	km_final int null,
	franquia_aluguel int not null,
	franquia_devolucao int not null,
	id_cliente int not null,
	id_carro int not null,
	constraint aluguel_pk primary key (id),
	constraint franquia_aluguel_fk foreign key (franquia_aluguel) references franquia(id),
	constraint franquia_devolucao_fk foreign key (franquia_devolucao) references franquia(id),
	constraint cliente_aluguel_fk foreign key (id_cliente) references cliente(id),
	constraint carro_fk foreign key (id_carro) references carro(id)
);

alter table aluguel add km_total int null;
