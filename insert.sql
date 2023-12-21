-- Insert para a tabela carro:
insert into carro (modelo, cor, versao, categoria, montadora) values
	('Focus', 'branco', 'Titanium', 'Hatch', 'Ford'),
	('HR-V', 'preto', 'EXL', 'SUV', 'Honda'),
	('Cruze', 'prata', 'Premier', 'Sedan Médio', 'Chevrolet'),
	('Compass', 'preto', 'Limited', 'SUV', 'Jeep'),
	('Fusion', 'branco', 'SE', 'Sedan Grande', 'Ford'),
	('Onix', 'prata', 'Sporting', 'Hatch', 'Chevrolet'),
	('Civic', 'branco', 'EX', 'Sedan Médio', 'Honda'),
	('Regenade', 'preto', 'Iconic', 'SUV', 'Jeep'),
	('Cruze', 'preto', 'LTZ', 'Sedan Médio', 'Chevrolet'),
	('Fiesta', 'preto', 'SEL', 'Hatch', 'Ford');

-- Insert para a tabela endereco:
insert into endereco (cep, rua, numero, bairro, complemento, cidade, estado) values
	('01234567', 'Rua A', '123', 'Centro', 'Apto 101', 'São Paulo', 'SP'),
	('12345678', 'Avenida B', '456', 'Jardins', 'Casa 2', 'Rio de Janeiro', 'RJ'),
	('23456789', 'Rua C', '789', 'Vila Madalena', 'Bloco 3', 'São Paulo', 'SP'),
	('34567890', 'Avenida D', '1011', 'Copacabana', 'Andar 5', 'Rio de Janeiro', 'RJ'),
	('45678901', 'Rua E', '1213', 'Bela Vista', 'Sala 7', 'São Paulo', 'SP'),
	('56789012', 'Avenida F', '1415', 'Ipanema', 'Casa 4', 'Rio de Janeiro', 'RJ'),
	('67890123', 'Rua G', '1617', 'Moema', 'Apartamento 20', 'São Paulo', 'SP'),
	('78901234', 'Avenida H', '1819', 'Leblon', 'Loja 6', 'Rio de Janeiro', 'RJ'),
	('89012345', 'Rua I', '2021', 'Pinheiros', 'Cobertura 8', 'São Paulo', 'SP'),
	('90123456', 'Avenida J', '2223', 'Botafogo', 'Piso 3', 'Rio de Janeiro', 'RJ');

-- Insert para tabela cliente:
insert into cliente (nome, email, telefone, id_endereco) values 
	('Ana Silva', 'ana.silva@example.com', '1234567890', 10),
	('Carlos Oliveira', 'carlos.oliveira@example.com', '9876543210', 4),
	('Mariana Santos', 'mariana.santos@example.com', '1112223333', 3),
	('Rafael Lima', 'rafael.lima@example.com', '5556667777', 9),
	('Beatriz Costa', 'beatriz.costa@example.com', '9998887777', 5),
	('Gabriel Pereira', 'gabriel.pereira@example.com', '3332221111', 6),
	('Larissa Oliveira', 'larissa.oliveira@example.com', '7778889999', 7),
	('Lucas Santos', 'lucas.santos@example.com', '2221113333', 8),
	('Carolina Lima', 'carolina.lima@example.com', '6665554444', 2),
	('Eduardo Cardoso', 'eduardo.costa@example.com', '4443332222', 1);

-- Insert para tabela franquia:
insert into franquia (nome, id_endereco) values 
	('Franquia Sul', 4),
	('Franquia Central', 7),
	('Franquia Copacabana', 2),
	('Franquia Pinheiros', 9),
	('Franquia Leblon', 8);

-- Insert para tabela aluguel:
insert into aluguel 
	(data_devolucao, km_inicial, franquia_aluguel, franquia_devolucao, id_cliente, id_carro) 
	values
    ('2024-01-25 10:30:00', 6200, 1, 3, 10, 3),
    ('2024-01-26 14:45:00', 7532, 2, 5, 5, 8),
    ('2024-01-28 08:15:00', 9120, 6, 1, 9, 12),
    ('2024-01-30 12:00:00', 6750, 4, 4, 4, 2),
    ('2024-01-02 09:30:00', 8001, 5, 2, 12, 15),
    ('2024-01-05 15:20:00', 9500, 4, 3, 14, 1),
    ('2024-01-08 11:45:00', 7700, 7, 5, 3, 3),
    ('2024-01-10 18:00:00', 8300, 8, 1, 8, 6),
    ('2024-01-12 07:00:00', 7200, 4, 4, 5, 7),
    ('2024-01-15 13:15:00', 8900, 8, 2, 6, 9);

-- 2. As cores de carro disponiveis são apenas branco, preto e prata:
	--tentando definir uma cor diferente de branco, preto e prata:
	update carro set cor = 'vermelho' where id = 5; 
		--saída: Erro SQL [1265] [01000]: Data truncated for column 'cor' at row 1

-- 6. Enquanto um carro estiver locado por um cliente não pode ser ofetado para outro:
	--tornando um carro indisponivel quando locado:
	update carro set is_available = 0 where id = 3;
	update carro set is_available = 0 where id = 8;
	update carro set is_available = 0 where id = 10;
	update carro set is_available = 0 where id = 2;

	--devolvendo o carro:
	update aluguel set km_final = 6500, km_total = km_final - km_inicial where id = 1;
	update aluguel set km_final = 7930, km_total = km_final - km_inicial where id = 2;
	update aluguel set km_final = 9940, km_total = km_final - km_inicial where id = 3;
	update aluguel set km_final = 8124, km_total = km_final - km_inicial where id = 4;

	--tornando o carro disponivel:
	update carro set is_available = 1 where id = 3;
	update carro set is_available = 1 where id = 8;
	update carro set is_available = 1 where id = 10;
	update carro set is_available = 1 where id = 2;

-- 8. O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros:
	--finalizando um aluguel:
	update aluguel set km_final = 6500, km_total = km_final - km_inicial where id = 1;
	update aluguel set km_final = 7930, km_total = km_final - km_inicial where id = 2;
	update aluguel set km_final = 9940, km_total = km_final - km_inicial where id = 3;
	update aluguel set km_final = 8124, km_total = km_final - km_inicial where id = 4;