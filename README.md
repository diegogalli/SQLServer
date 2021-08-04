# SQLServer
Curso SQL Completo 2019 [Iniciantes] + Desafios + Muita Prática

# Comandos
### Criar novo banco de dados:
``` sql
CREATE DATABASE nome_do_banco_de_dados;
```
### Deletar um banco de dados
``` sql
DROP DATABASE nome_do_banco_de_dados;
```
## SELECT
``` sql
SELECT coluna1,coluna2 /*COLUNA1 E COLUNA2 SÃO COLUNAS QUE ESTOU SELECIONANDO*/
FROM nome_da_tabela

/*OU*/

SELECT *			/* O * SELECIONA TODAS AS COLUNAS DA TABELA*/
FROM nome_da_tabela
```
## DISTINCT

* Trata-se de uma cláusula para eliminar repetições em consultas, considerando as colunas informadas na listagem de colunas do comando SELECT que contenham valores iguais como o mesmo registro.

Como usar: 
``` sql
SELECT DISTINCT nomeColuna, nomeColuna1
FROM nomeTabela
```
## WHERE

* Usamos WHERE para filtrar dados em um comando SQL. Essa cláusula deve ser seguida por uma expressão lógica.

``` sql
SELECT nomeColuna, nomeColuna1 , nomeColuna2
FROM nomeTabela
WHERE condicao;
```
* WHERE com operador AND
``` sql
SELECT * 
FROM person.Person /* nomeTabela */
WHERE LastName = 'miller' and FirstName = 'Anna'
/*nomeColuna = 'condicao' E nomeColuna1 = 'condicao */
```
* WHERE com operador OR 
``` sql
SELECT *
FROM Production.Product /* nomeTabela */
WHERE Color = 'blue' or color = 'black';
/*nomeColuna = 'condicao' OU nomeColuna1 = 'condicao */
```
* WHERE com operadores MAIOR QUE > e MENOR QUE <
``` sql
SELECT *
FROM Production.Product /* nomeTabela */
WHERE ListPrice > 1500 AND ListPrice < 5000;
/*nomeColuna MAIOR QUE> valor E nomeColuna1 MENOR QUE< valor/
```
* WHERE com operador <> DIFERENTE 
``` sql
SELECT *
FROM Production.Product /* nomeTabela */
WHERE Color <> 'red';
/*nomeColuna DIFERENTE<> 'condicao'/
```
### OPERADORES LOGICOS
*	DESCRIÇÃO  -  OPERADOR
* IGUAL         =
* MAIOR QUE     >
* MENOR QUE     <
* MAIOR QUE OU IGUAL >=
* MENOR QUE OU IGUAL <=
* DIFERENTE DE       <>
* OPERADOR LOGICO E **AND**
* OPERADOR LOGICO OU  **OR**

### DESAFIOS
* DESAFIO 01 = A equipe de produção de produtos precisa do nome de todas as peças que pesam mais que 500kg mas não mais que 700kg para inspeção.
* DESAFIO 02 = Foi pedido pelo marketing uma relação de todos os empregados(employess) que são casados (single=solteiro, married = casado) e são asalariados(salaried).
* DESAFIO 03 = Um usuario chamado peter krebs está devendo um pagamento, consiga o email dele para que possamos enviar uma cobrança! Você vai ter que usar a tabela person.person e depois a tabela person.emailaddress

**Soluções dos Desafios**
``` sql
/*Desafio 01*/
SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight <= 700;
```
``` sql
/*Desafio 02*/
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' AND SalariedFlag = 1
```
``` sql
/*Desafio 03*/
SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs'

SELECT * 
FROM Person.EmailAddress
WHERE BusinessEntityID = 26;
```

## COUNT
* RETORNA O NUMERO DE LINHAS SOLICITADOS PELA CONDIÇÃO 

``` sql
SELECT COUNT(*)
FROM nomeTabela;
```

### Desafios COUNT

* DESAFIO 01 = Quero saber quantos produtos temos cadastrados 
em nossa tabela de produtos
* DESAFIO 02 = Quero saber quantos tamanhos de produtos temos
cadastrados em nossa tabela

**Soluções dos Desafios**

``` sql
/*DESAFIO 01*/
SELECT COUNT(ProductId)
FROM Production.Product;
```
``` sql
/*DESAFIO 02*/
SELECT COUNT(Size) 
FROM Production.Product;
```
## TOP

* A cláusula TOP da linguagem SQL é utilizada para limitar o número de registros retornados por uma consulta e é pode, por exemplo, garantir certo ganho de desempenho em algumas consultas que normalmente seriam compostas por uma quantidade muito grande de registros.

``` sql
SELECT TOP 10 *
FROM nomeTabela;
```
## ORDER BY
* ORDER BY organiza os resultados de acordo com uma ou mais colunas da tabela, podendo definir a ordem do resultados como crescente ou decrescente.

``` sql
SELECT nomeColuna, nomeColuna1
FROM nomeTabela
ORDER BY nomeColuna ASC / DESC /* ASC = CRESCENTE | DESC = DECRESCENTE */
```
### Desafios ORDER BY

* DESAFIO 01 = Obter o productid dos 10 produtos mais caros 
cadastrados no sistema, listando mais caro para o mais barato
* DESAFIO 02 = Obter o nome e numero do produto dos produtos
que tem o productid entre 1~4

**Soluções dos Desafios**

``` sql
/*Desafio 01*/
SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice desc;
```
``` sql
/*Desafio 02 */
SELECT TOP 4 Name,ProductNumber
FROM Production.Product
ORDER BY ProductID asc;
```
## BETWEEN

* BETWEEN: Usado para encontrar um valor entre o valor mínimo e valor máximo

``` sql
select *
from Production.Product /* nomeTabela */
where ListPrice between 1000 and 1500;
/*nomeColuna ENTRE mínimo E máximo */
```
``` sql
select *
from Production.Product
where ListPrice NOT between 1000 and 1500;
/*nomeColuna NÃO ESTEJA ENTRE mínimo E máximo */
```
``` sql
/* BETWEEN COM DATA | DATA SEGUE O MODELO ANO/MES/DIA YYYY/MM/DD */
SELECT *
FROM HumanResources.Employee
WHERE HireDate Between '2009/01/01' and '2010/01/01';
```
## IN

* Usamos o operador in junto com o where, para verificar se um valor corresponde com qualquer valor passado na lista de valores.

``` sql
SELECT *
FROM Person.Person /* nomeTabela */
WHERE BusinessEntityID IN (2,7,13);
/* nomeColuna VALORES(2,7,13) */
```
## LIKE

* Em consultas SQL as expressões com strings mais usadas são as checagens para verificação de coincidências de pares, usando o operador LIKE combinado com os caracteres especiais porcentagem (%) e sublinhado (_). O caractere % é utilizado para indicar a posição (no início, em qualquer posição ou no final) que um conteúdo será procurado no valor string do campo especificado enquanto que o caractere _ indica o número de caracteres envolvidos na pesquisa.

``` sql
SELECT *
FROM Person.Person /*nomeTabela */
WHERE FirstName like 'ovi%'
/* nomeColuna LIKE 'palavraProcurada%'
```
## Desafios BETWEEN , IN e LIKE

* DESAFIO 01 = Quantos produtos temos cadastrados no sistem que custam mais que 1500 dolares?
* DESAFIO 02 = Quantas pessoas temos com o sobrenome que inicia com a letra P?
* DESAFIO 03 = Em quantas cidades únicas estão cadastrados nossos clientes?
* DESAFIO 04 = Quais são as cidades únicas que temos cadastradas em nosso sistema?
* DESAFIO 05 = Quantos produtos vermelhos tem o preço entre 500 a 1000 dolares?
* DESAFIO 06 = Quantos produtos cadastrados tem a palavra 'road' no nome deles? 

**Soluções Desafios**
``` sql
/*Desafio 01*/
SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice > 1500
```
``` sql
/*Desafio 02*/
SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName like 'P%'
```
``` sql
/*Desafio 03*/
SELECT COUNT(DISTINCT City)
FROM Person.Address;
```
``` sql
/*Desafio 04*/
SELECT DISTINCT City
FROM Person.Address
```
``` sql
/*Desafio 05*/
SELECT COUNT(Color)
FROM Production.Product
WHERE Color = 'Red' AND ListPrice between 500 and 1000;
```
``` sql
/*Desafio 06*/
SELECT COUNT(Name)
FROM Production.Product
WHERE Name like '%road%';
```
