# Projeto CARLOCA

## Visão Geral

O  sistema CARLOCA é um projeto desenvolvido como parte do módulo de Banco de Dados da plataforma ADA. O projeto visa gerenciar veículos, clientes e locações em uma rede de franquias, abordando requisitos funcionais específicos sem adentrar em questões relacionadas a pagamentos.

## Requisitos Funcionais

1. **Modelagem de Carro:**
    <br>[x] Um carro possui modelo, montadora, cor e versão.

2. **Cores Disponíveis:**
   <br>[x] As cores de carro disponiveis são apenas branco, preto e prata.

3. **Categorias de Veículos:**
   <br>[x] Existem várias categorias de veiculos (hatch, sedam compacto, sedam médio, SUV, etc...).

4. **Modalidade de Locação:**
   <br>[x] Um cliente pode alugar um carro somente na modalidade "diária".

5. **Restrição de Locação por Cliente:**
   <br>[x] Um cliente não pode alugar mais de um carro por vez.

6. **Exclusividade de Locação:**
   <br>[x] Enquanto um carro estiver locado por um cliente não pode ser ofertado para outro.

7. **Histórico de Locações por Cliente:**
   <br>[x] O sistema deve manter o histórico dos clientes que locaram determinado carro.

8. **Registro de Quilometragem:**
   <br>[x] O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros.

9. **Rastreamento de Localização:**
   <br>[x] Existem várias unidades da fraquia **CARLOCA** o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo.

## Estrutura do Banco de Dados

O banco de dados foi projetado considerando os princípios de normalização de dados. As principais tabelas incluem:

- **`carro`**: Contém informações sobre os veiculos;
- **`endereco`**: Essa tabela centraliza informações como 'rua', 'cidade', 'cep', sendo referenciada nas tabelas **`cliente`** e **`franquia`** de forma que os dados fiquem mais consistentes;
- **`cliente`**: Contém informações dos clientes, não inclui campos de endereço diretamente na tabela, visando a normalização dos dados.
- **`franquia`:** Contém informações das franquias, não inclui campos de endereço diretamente na tabela, visando a normalização dos dados.
- **`aluguel`:** Mantém todas as informações necessarias sobre um determinado aluguel.

## Instruções de Uso

- Para criar o banco de dados, execute os scripts SQL fornecidos no arquivo `create.sql`;
- Para inserção de dados execute os scripts SQL fornecidos no arquivo `insert.sql`, esse arquivo inclue informações ficticias apenas para implementação prática;
- Para validar cada requisito funcional utilize as consultas de exemplo fornecidas no arquivo `select.sql`.