drop database raz;
create database RAZ;
use RAZ;

create table usuarios_tb(
id_usu int primary key auto_increment,
nome_usu varchar(50) not null,
email_usu varchar(50),
login_usu varchar(50) unique not null,
senha_usu varchar(50)
);
insert into usuarios_tb(login_usu, senha_usu) values ("root","123");
CREATE TABLE marcas_tb (
id_marca INT PRIMARY KEY AUTO_INCREMENT,
Nome_marca VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE clientes_tb (
id_cli INT PRIMARY KEY auto_increment,
nome_cli VARCHAR(255),
email_cli VARCHAR(255),
cpf_cli VARCHAR(11) unique,
cnpj_cli VARCHAR(14) unique
);

create table veiculos_tb(
id_veic int auto_increment primary key,
nome_veic varchar(50),
ano_fabricacao_veic varchar(4),
ano_modelo_veic varchar(4),
cambio_veic varchar(6),
combustivel_veic varchar(20),

marca_veic int,
foreign key (marca_veic) references marcas_tb(id_marca)
);

create table cliente_veiculo(
id_cv int auto_increment primary key,
placa_veic varchar(7) unique,
cliente_cv int,
foreign key (cliente_cv) references clientes_tb(id_cli),
veiculo_cv int,
foreign key (veiculo_cv) references veiculos_tb(id_veic)
);

create table categorias_tb( -- categorias de produtos
id_categ int primary key auto_increment,
nome_categ varchar(100) not null
);
insert into categorias_tb(nome_categ) values
('Óleos'),
('Escapamentos'),
('Freios'),
('Pneus'),
('Amortecedores'),
('Motores'),
('Acessorios');

create table produtos_tb(
id_prod int primary key auto_increment,
nome_prod varchar(100) unique,
quant_prod int not null,
descricao_prod varchar(9999),
preco_prod int,
fornecedor_prod varchar(50),

categoria_prod int,
constraint Categ_prod_fk foreign key (categoria_prod) references categorias_tb(id_categ)

);

create table vendas_tb( -- essa é a tabela de relatorios, ela só armazena quando uma venda é feita
id_venda int primary key auto_increment,
quant_venda int not null,
preco_total_vendas int not null,
data_venda datetime,

produto_venda int,
constraint prod_id_fk foreign key (produto_venda) references produtos_tb(id_prod),

cliente_venda int,
constraint cliente_id_fk foreign key (cliente_venda) references clientes_tb(id_cli)
);

create Table prod_Veic(
id_pv int PRIMARY KEY auto_increment,

veiculo_pv int,
foreign key (veiculo_pv) references veiculos_tb(id_veic),

produto_pv int,
foreign key (produto_pv) references produtos_tb(id_prod)
);

select * from usuarios_tb;
select * from prod_veic;
select * from clientes_tb;
select * from veiculos_tb;
select * from vendas_tb;
select * from marcas_tb;
select * from cliente_veiculo;
select * from produtos_tb;