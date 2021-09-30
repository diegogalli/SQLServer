# SQLServer
Curso SQL Completo 2019 [Iniciantes] + Desafios + Muita Prática

Downloads Banco de dados utilizado para o curso: https://drive.google.com/file/d/1LCofjYj-pV1asBLrxtgPDsbqMFRefHW5/view

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
## Principais funções de agregação MIN, MAX, SUM e AVG

* Funções de agregação basicamente agregam ou combinam dados de uma tabela em 1 só resultado.

**SUM = Soma**

``` sql
/*Exemplo SUM*/
SELECT TOP 10 SUM(Linetotal) as "SOMA" --Seleciona os 10 primeiros resultados e SUM(SOMA) de todos na coluna
FROM Sales.SalesOrderDetail	;		   -- Linetotal e acrescenta um apelido AS com descrição "SOMA"
/*nomeTabela*/
```
**MIN = Mínimo**
``` sql
/*Exemplo MIN*/
SELECT TOP 10 MIN(Linetotal) --Seleciona o valor MIN(Mínimo) dos 10 primeiros da coluna Linetotal
FROM Sales.SalesOrderDetail;
/*nomeTabela*/
```
**MAX = Máximo**
``` sql
/*Exemplo MAX*/
SELECT TOP 10 MAX(Linetotal) --Seleciona o valor MAX(Máximo) dos 10 primeiros da coluna Linetotal
FROM Sales.SalesOrderDetail;
/*nomeTabela*/
```
**AVG = Média**
``` sql
/*Exemplo AVG*/
SELECT TOP 10 avg(Linetotal) --Seleciona o valor AVG(Médio) dos 10 primeiros da coluna Linetotal
FROM Sales.SalesOrderDetail
/*nomeTabela*/
```
**GROUP BY = Basicamente divide o resultado da sua pesquisa em grupos**
``` sql
/*GROUP BY*/
SELECT nomeColuna, funcaoAgregacao(nomeColuna1)
FROM nomeTabela
GROUP BY nomeColuna;
```
``` sql
/*Exemplo GROUP BY*/
SELECT SpecialOfferId, SUM(UnitPrice) AS "SOMA" /*nomeColuna, funcaoAgregacao , apelido */
FROM Sales.SalesOrderDetail		/*nomeTabela*/
GROUP BY SpecialOfferID			/* agrupar por nomeColuna */
```

## Desafios Funções de agregação

* DESAFIO 01 = Quantas pessoas tem o mesmo Middlename agrupadas por Middlename?
* DESAFIO 02 = Preciso saber em média qual é a quantidade(quantity) que cada produto é 
vendido na loja
* DESAFIO 03 = Quais foram as 10 vendas que no total tiveram os maiores valores de venda
(linetotal) por produto, do maior valor para o menor?
* DESAFIO 04 = Quantos produtos e qual a quantidade media de produtos, temos cadastrados 
nas nossas ordem de serviço (WorkOrder), agrupados por productId ?

**Soluções Desafios**

``` sql
/*DESAFIO 01*/
SELECT MiddleName, COUNT(FirstName) as "Quantidade"
FROM Person.Person
Group by MiddleName
```
``` sql
/*DESAFIO 02*/
SELECT ProductID, avg(OrderQty) as "Média"
FROM Sales.SalesOrderDetail
GROUP BY ProductID 
```
``` sql
/*DESAFIO 03*/
SELECT TOP 10 ProductID, SUM(LineTotal) as "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(linetotal) DESC;
```
``` sql
/*DESAFIO 04*/
SELECT PRODUCTID, COUNT(PRODUCTID) as "Contagem", 
AVG(OrderQty) as "MediaProd"
FROM Production.WorkOrder
GROUP BY ProductID
```
## HAVING

* Usado em junção com o GROUP BY para filtrar resultados de um agrupamento.

``` sql
/*HAVING*/
SELECT coluna, funcaoAgregacao(coluna1)
FROM nomeTabela
GROUP BY coluna1
HAVING condicao ;
```
``` sql
/*Exemplo 01 HAVING*/
SELECT FirstName, COUNT(Firstname) as "quantidade" /* nomeColuna, funcaoAgregacao, apelido */
FROM Person.Person /* nomeTabela */
GROUP BY FirstName /* agrupar por nomeColuna */
HAVING COUNT(Firstname) > 10 /* filtrar quando o nomeColuna for maior que 10 > */
```
``` sql
/*Exemplo 02 HAVING*/
/* Quais produtos que no total de vendas, estão entre 162mil a 500mil */
SELECT PRODUCTID, sum(linetotal) as "Total"
FROM Sales.SAlesOrderDetail
GROUP BY ProductId
HAVING SUM(linetotal) between 162000 and 500000
```
``` sql
/*Exemplo 03 Where + HAVING*/
/* Quantos nomes no sistema tem ocorrencia maior que 10 vezes, porem somente onde o titulo seja por "Mr." */
SELECT FirstName, COUNT(Firstname) as "quantidade"
FROM Person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING COUNT(Firstname) > 10
```
**ATENÇÃO! A grande diferença entre HAVING e WHERE, o GROUP BY é aplicado depois que os dados já foram agrupados, enquanto o WHERE é aplicado antes dos dados serem agrupados.**

## Desafios HAVING

* Desafio 01 = Estamos querendo identificar as provincias(stateProvinceId) com o maior numero de cadastros no nosso sistema, então é preciso encontrar quais provincias (stateProvinceId) estão registradas no banco de dados mais que 1000 vezes.
* Desafio 02 = Os gerentes de uma multinacional, querem saber quais produtos (productId) não
estão trazendo, em média, no mínimo 1 milhão em total de vendas (lineTotal).

**Soluções Desafios**

``` sql
/*DESAFIO 01*/
SELECT StateProvinceID, COUNT(StateProvinceID) as Quantidade
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceId) > 1000
```
``` sql
/*DESAFIO 02*/
SELECT ProductId, AVG(LineTotal) as "MEDIA"
From Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000
```

## AS = Apelido

``` sql
/*AS*/
SELECT TOP 10 ListPrice as "Lista de Preços" /*TOP 10 nomeColuna apelido "Lista de Preços" */
FROM Production.Product /*nomeTabela*/
```

## Desafios AS

* DESAFIO 01 = Encontrar o FirstName e LastName da tabela Person.Person e alterar a descrição
* DESAFIO 02 = Renomear o ProductNumber da tabela production.product para "Numero do Produto
* DESAFIO 03 = Renomear na tabela Sales.SalesOrderDetail a coluna unitPrice para "Preço Unitario

**Soluções desafios**

``` sql
/*DESAFIO 01 AS*/
SELECT FirstName as "Nome" , LastName as "Sobrenome"
FROM Person.Person
```

``` sql
/*DESAFIO 02 AS*/
SELECT ProductNumber as "Numero do Produto"
FROM Production.Product
```

``` sql
/*DESAFIO 03 AS*/
SELECT UnitPrice as "Preço Unitario"
FROM Sales.SalesOrderDetail
```

## INNER JOIN

* A cláusula INNER JOIN permite usar um operador de comparação para comparar os valores de colunas provenientes de tabelas associadas. Por meio desta cláusula, os registros de duas tabelas são usados para que sejam gerados os dados relacionados de ambas. Usamos as cláusulas WHERE e FROM para especificar esse tipo de associação. 
Inner Join retorna apenas os resultados que correspondem (existem) tanto na tabela A como na tabela B

``` sql
/*Exemplo 01 : BusinessEntityID, FirstName, LastName, EmailAddress*/
SELECT P.BusinessEntityID, P.Firstname, P.LastName, PE.EmailAddress
FROM Person.Person as P
INNER JOIN Person.EmailAddress PE on P.BusinessEntityID = PE.BusinessEntityID
/* seleciona apelidoTabela.nomeColuna, apelidoTabela.nomeColuna1, apelidoTabela1.nomeColuna */
/* nomeTabela apelido P */
/* concatenar nomeTabela1 apelido PE quando ON nomeTabela.nomeColuna for igual nomeTabela1.nomeColuna */
```
``` sql
/* Eemplo 02 : ListPrice, Nome do Produto, Nome da Subcategoria */
SELECT TOP 10 *
FROM Production.Product

SELECT TOP 10 *
FROM Production.ProductSubcategory

SELECT PP.ListPrice, PP.Name, pps.Name
FROM Production.Product as PP
INNER JOIN Production.ProductSubcategory as PPS on PP.ProductSubcategoryID = PPS.ProductSubcategoryID
```
``` sql
/* Exemplo 03 = Unir informações de duas tabelas */
SELECT TOP 10 *
FROM Person.BusinessEntityAddress BEA
INNER JOIN Person.Address PA on PA.AddressID = BEA.AddressID
```

## Desafios INNER JOIN

* DESAFIO 01 = Nas tabelas person.PhoneNumberType e person.PersonPhone, precisamos das informações BusinessEntityId, Name, PhoneNumberTypeId e PhoneNumber
* DESAFIO 02 = Nas tabelas person.StateProvince e person.Address, precisamos das informações AddressID,City, StateProvinceID, Nome do Estado

**Solucções Desafios**
``` sql
/* DESAFIO 01 */
select top 10 *
from person.PhoneNumberType

select top 10 *
from person.PersonPhone

SELECT PP.BusinessEntityID, PT.Name, PT.PhoneNumberTypeID, PP.PhoneNumber
FROM Person.PhoneNumberType PT
INNER JOIN Person.PersonPhone PP on PT.PhoneNumberTypeID = PP.PhoneNumberTypeID 
```
``` sql
/* DESAFIO 02 */
SELECT TOP 10 PA.AddressID, PA.City, PS.STATEMENT_ID, PS.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PS ON PS.StateProvinceID = PA.StateProvinceID
```


