-- 6. Enquanto um carro estiver locado por um cliente não pode ser ofetado para outro:
    --select para exibição de carros disponiveis:
select * from carro where is_available = 1;

-- 7. O sistema deve manter o histórico dos clientes que locaram determinado carro:
select 	cliente.id, cliente.nome, 
		carro.modelo, carro.cor, carro.versao, 
		aluguel.km_inicial, aluguel.km_final, aluguel.data_aluguel, aluguel.data_devolucao 
    from aluguel 
	inner join cliente on aluguel.id_cliente = cliente.id
	inner join carro on aluguel.id_carro = carro.id
	order by cliente.id asc;

-- 8. O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros:
select 	cliente.id, cliente.nome, 
		carro.modelo, carro.cor,
		aluguel.km_total, aluguel.km_final as 'quilometragem_atual', aluguel.data_aluguel, aluguel.data_devolucao from aluguel 
		inner join cliente on aluguel.id_cliente = cliente.id
		inner join carro on carro.id = aluguel.id_carro
		order by aluguel.id asc;

-- 9. Existem várias unidades da fraquia CARLOCA o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo:
--ONDE O CARRO FOI LOCADO
select aluguel.id as 'id_aluguel', cliente.nome, carro.modelo, franquia.name as 'franquia_aluguel', endereco.* from aluguel
	inner join cliente on aluguel.id_cliente = cliente.id
	inner join carro on aluguel.id_carro = carro.id
	inner join franquia on aluguel.franquia_aluguel = franquia.id
	inner join endereco on franquia.id_endereco  = endereco.id
	order by aluguel.id asc;

--ONDE O CARRO FOI DEVOLVIDO
select aluguel.id, cliente.nome, carro.modelo, franquia.name as 'franquia_devolucao', endereco.* from aluguel
	inner join cliente on aluguel.id_cliente = cliente.id
	inner join carro on aluguel.id_carro = carro.id
	inner join franquia on aluguel.franquia_devolucao  = franquia.id
	inner join endereco on franquia.id_endereco  = endereco.id
	order by aluguel.id asc;