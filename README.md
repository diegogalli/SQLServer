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

## FULL OUTER JOIN

* Retorna um conjunto de todos registros correspondentes da Tabela A e Tabela B quando são iguais. E além disso se não houver valores correspondentes, ele simplesmente irá preencher esse lado com "null"

``` sql
/*Exemplo 01 */
SELECT * FROM nomeTabelaA
FULL OUTER JOIN nomeTabelaB
ON nomeTabelaA.nomeColuna = nomeTabelaB.nomeColuna
```

## LEFT OUTER JOIN

* Retorna um conjunto de todos os registros da TABELA A, e alem disso, os registros correspondentes (quando disponíveis) na TABELA B. Se não houver registros correspondentes, ele simplesmente irá preencher com "null"

``` sql
/*Exemplo 01 */
SELECT * FROM nomeTabelaA
LEFT JOIN nomeTabelaB
ON nomeTabelaA.nomeColuna = nomeTabelaB.nomeColuna
```

## RIGHT OUTER JOIN

* Retorna um conjunto de todos os registros da TABELA B, e alem disso, os registros correspondentes (quando disponíveis) na TABELA A. Se não houver registros correspondentes, ele simplesmente irá preencher com "null"

``` sql
/*Exemplo 01 */
SELECT * FROM nomeTabelaA
RIGHT JOIN nomeTabelaB
ON nomeTabelaA.nomeColuna = nomeTabelaB.nomeColuna
```

## UNION 

* O operador UNION combina dois ou mais resultados de um SELECT em apenas um resultado
``` sql
/*Exemplo 01 */
SELECT nomeColuna, nomeColuna1
FROM nomeTabela1
UNION
SELECT nomeColuna, nomeColuna1
FROM nomeTabela2 
``` 
``` sql
/*Exemplo 02 */
SELECT ProductID ,Name, ProductNumber
FROM Production.Product
WHERE Name like '%Chain%'
UNION
SELECT ProductID ,Name, ProductNumber
FROM Production.Product
WHERE Name like '%Decal%'
```
``` sql
/*Exemplo 02 */
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE MiddleName = 'A'
```

## DATEPART

* Essa função retorna um inteiro que representa o datepart especificado do argumento date especificado. Mais informações em: Link: https://docs.microsoft.com/pt-br/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver15

``` sql
/*Exemplo 01 */
SELECT nomeColuna, DATEPART(nomeDatepart, nomeColuna1)
FROM nomeTabela
```
``` sql
/*Exemplo 02 */
SELECT SalesOrderID, DATEPART(month, OrderDate) as Mes
FROM Sales.SalesOrderHeader
```
``` sql
/*Exemplo 03 */
SELECT AVG(TotalDue) as Media, DATEPART(month,OrderDate) as Mes
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(month, orderdate)
ORDER BY Mes
```

## Operações em STRING

``` sql
SELECT CONCAT(FirstName, ' ', LastName) /*CONCAT = Concatena colunas */
FROM Person.Person

SELECT UPPER (FirstName), LOWER(Firstname) /*UPPER = todas as letras maiusculas | LOWER = Todas as letras minusculas */
FROM Person.Person

SELECT firstname,LEN(Firstname) /*LEN = Exibe a quantidade de caracteres da coluna informada) */
FROM Person.Person

SELECT FirstName, SUBSTRING(Firstname,1,3) /*SUBSTRING = O método substring() retorna a parte da string entre os índices inicial e final, ou até o final da string.*/
FROM Person.Person

SELECT productNumber,REPLACE(ProductNumber, '-','#') /* REPLACE = substitui uma informação por outra. */
FROM Production.Product
```

## Funções Matemáticas

* Link com todas as funções disponíveis: https://docs.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

``` sql
SELECT MAX(LineTotal) /* Valor maximo da coluna */
FROM Sales.SalesOrderDetail

SELECT MIN(LineTotal) /* Valor minimo da coluna */
FROM Sales.SalesOrderDetail

SELECT AVG(LineTotal) /* Valor médio da coluna */
FROM Sales.SalesOrderDetail

SELECT ROUND(LineTotal,2) /* Valor arredondado para as primeiras 2 casas decimas da coluna */
FROM Sales.SalesOrderDetail

SELECT SQRT(LineTotal) /* Raiz quadrada da coluna */
FROM Sales.SalesOrderDetail
```

## SUBQUERY ou SUBSELECT

``` sql
/* Exmplo 01: Monte um relatório de produtos cadastrados, onde o preço de venda está acima da média */
/* Não utilizando SUBQUERY */
SELECT *
FROM Production.Product

SELECT AVG(ListPrice) as Media
FROM Production.Product
```
``` sql
/* Utilizando SUBQUERY */
SELECT * /*Seleciona todos */
FROM Production.Product /* nomeTabela */
WHERE ListPrice > (Select AVG(listprice) from Production.Product) /* Onde nomeColuna maior (Selecionar Media(nomeColuna) da nomeTabela */
```
``` sql
/* Exemplo 02: Qual o nome dos funcionarios que tenham o cargo de "Design Engineer"? */
/* Sem SUBQUERY */
SELECT *
FROM Person.Person

SELECT *
FROM HumanResources.Employee

SELECT *
FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'
```
``` sql
/* Com SUBQUERY */
SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN (
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer')
```
``` sql
/*Utilizando o INNER JOIN no mesmo problema */
SELECT P.FirstName
FROM Person.Person P
INNER JOIN HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer'
```

## Desafio

* Desafio 01 = Desafio: Encontre todos os endereços que estejam no estado de 'Alberta', utilizando as tabelas Person.Address e Person.StateProvince 

**Solução desafio**
``` sql
/* Desafio 01 */
SELECT *
FROM Person.Address
WHERE StateProvinceID IN (
SELECT StateProvinceID FROM Person.StateProvince
WHERE Name = 'Alberta')
```

## SELF JOIN

* Self Joins ou auto-junção são junções de uma tabela com ela mesma.
* Diferença entre Joins:
* ![Diferenca entre joins](https://arquivo.devmedia.com.br/artigos/Fernanda_sallai/sql_join/image001.jpg)
* A partir deste ponto do artigo, iremos utilizar um novo banco de dados, segue o link: https://raw.githubusercontent.com/Microsoft/sql-server-samples/master/samples/databases/northwind-pubs/instnwnd.sql
* Para utilizarmos o banco acima, será necessário copiar o conteúdo, inserir em uma nova query e executar para criar o novo DataBase .

``` sql
/* Sintaxe */
SELECT nomeColuna
FROM nomeTabelaA, nomeTabelaB
WHERE condicao
```
``` sql
/*Exemplo 1: Informar todos os clientes que moram na mesma região */
SELECT A.ContactName, B.ContactName
FROM Customers A, Customers B
WHERE A.Region = B.Region
```
``` sql
/*Exemplo 2: Funcionarios que foram contratados no mesmo ano */
SELECT A.FirstName,A.HireDate,B.FirstName, B.HireDate
FROM Employees A, Employees B
WHERE DATEPART(year,A.Hiredate) = DATEPART(year,B.Hiredate)
```

## Desafio Self Join

* Desafio 01 = Na tabela Order Details, quais os produtos possuem o mesmo percentual de desconto?

**Solução desafio**

``` sql
/*Desafio 01*/
SELECT ODa.ProductID,ODa.Discount,ODb.ProductID,ODb.Discount
FROM [Order Details] ODa, [Order Details] ODb
WHERE ODa.Discount = ODb.Discount
```

## Tipos de Dados

1. Boleanos: Por padrão, o boleando é inicializado como nulo e pode receber tanto 1 ou 0, representado por BIT

2. Caracteres: Tamanho fixo, representado por CHAR, onde permite inserir até uma quantidade fixa de caracteres e sempre ocupa todo o espaço reservado. Por exemplo, se definirmos que o valor do espaço é de 50 caracteres e inserimos apenas 10, será reconhecido os 10 caracteres inseridos mais o restante para completar os 50 caracteres. 
   Podemos utilizar variaveis, representados por VARCHAR ou NVARCHAR, onde permite inserir até uma quantidade que for definida, porém só utiliza o espaço que for preenchido. Por exemplo, se definirmos que o valor do espaço é 50 caracteres e inserimos apenas 10, será reconhecido apenas os 10 inseridos.
   
3. Números - VALORES EXATOS:    
    
    3.1 - TINYINT não possui o valor fracionado, por exemplo, valores 1.43 , 24.23 , somente valores inteiros, como: 1 , 2 , 1212134 e etc.
    
    3.2 - SMALLINT: Mesma descrição que o TINYINT, porém com um limite maior
    
    3.3 - INT: Mesma descrição que o SMALLINT, porém com um limite maior
    
    3.4 - BIGINT: Mesma descrição que o INT, porém com um limite maior. Link com os limites dos valores exatos: https://docs.microsoft.com/pt-br/sql/t-sql/data-types/int-bigint-smallint-and-tinyint-transact-sql?view=sql-server-ver15
    
    3.5 - NUMERIC ou DECIMAL: Valores exatos, porém permite ter parte fracionados, que também podem ser especificados a precisão e escala (escala é o número de digitos na parte fracional), por exemplo: NUMERIC (5,2) 113,44 onde temos a precisão de 5 dígitos e 2 valores após a virgula.
   VALORES APROXIMADOS:
    
    3.6 - REAL: Tem precisão aproximada de até 15 dígitos
    
    3.7 - FLOAT: Mesmo conceito de REAL
   
4. Temporais :
   
   DATE: Armazena data no formato aaaa/mm/dd (ano/mes/dia)
   
   DATETIME: Armazena data e horas no formato aaaa/mm/dd:hh:mm:ss (ano/mes/dia:horas:minutos:segundos)
   
   DATETIME2: Armazena data e horas com adição de milissegundos no formato aaaa/mm/dd:hh:mm:sssssss (ano/mes/dia:horas:minutos:milissegundossegundos)
   
   SMALLDATETIME: Armazena data e hora respeitando o limite entre '1900-01-01:00:00:00' até '2079-06-06:23:59:59'
   
   TIME: Armazena horas, minutos, segundo e milissegundos respeitando o limite de '00:00:00.0000000' até '23:59:59.9999999'
   
   DATETIMEOFFSET: Permite armazenar informações de data e horas, incluindo o fuso horario
   
## CHAVE PRIMÁRIA E ESTRANGEIRA

* **CHAVE PRIMÁRIA** é basicamente uma coluna ou grupo de colunas, usada para identificar unicamente uma linha em uma tabela.
* Você consegue criar essas chaves primárias através das restrições (constraints termo em inglês), que são regras que você define quando está criando uma coluna .
* Utilizando as restrições, você está criando um índice único para aquela coluna ou grupo de colunas.

``` sql
/* Sintaxe */
CREATE TABLE nomeTabela (
	nomeColuna tipoDeDados PRIMARY KEY
	nomeColuna tipoDeDados ...
)
```

* **CHAVE ESTRANGEIRA** é uma coluna ou grupo de colunas em uma tabela, que identifica unicamente uma linha em outra tabela, ou seja, uma chave estrangeira é definida em uma tabela, onde ela é apenas uma referencia e não contém todos os dados ali.
* Então uma chave estrangeira, é simplesmente uma coluna ou grupo de colunas que é uma chave primária em outra tabela.
* A tabela que contem a chave estrangeira é chamada de tabela referenciadora ou tabela filho. E a tabela na qual a chave estrangeira é referenciada, é chamada de tabela referenciada ou tabela pai.
* Uma tabela pode ter mais de uma chave estrangeira, dependendo do seu relacionamento com as outras tabelas.
* No SQL SERVER você define uma chave estrangeira atravez de um "Foreign Key Constraint" ou Restrição de chave estrangeira . 
* Uma restrição de Chave Estrangeira, indica que os valores em uma coluna ou grupo de colunas na tabela filho, correspondem aos valores na tabela pai.
* Nós podemos entender que uma chave estrangeira mantém a "Integridade referencial"

``` sql
/* CREATE TABLE NA PRÁTICA */
/* Sintaxe */
CREATE TABLE nomeTabela (
	nomeColuna restricaoDaColuna,
	nomeColuna1 restricaoDaColuna,	/* se houver restrições */
	nomeColuna2 restricaoDaColuna , /* se houver restrições */
	...
);
```

* **Principais tipos de restrições que podem ser aplicadas:**
* **NOT NULL:** Não permite nulos ;
* **UNIQUE:** Força que todos os valores em uma coluna sejam diferentes ;
* **PRIMARY KEY:** Uma junção de NOT NULL e UNIQUE ;
* **FOREIGN KEY:** Identifica unicamente uma linha em outra tabela ;
* **CHECK:** Força uma condição específica em uma coluna ;
* **DEFAULT:** Força um valor padrão quando nenhum valor é passado .

``` sql
/* Exemplo 01: Criando tabela com Primary Key */
CREATE TABLE Canal (
CanalId INT PRIMARY KEY ,
Nome VARCHAR(150) NOT NULL,
ContagemInscritos INT DEFAULT 0 ,
DataCriacao DATETIME NOT NULL
);
```
``` sql
/* Exemplo 02: Criando tabela com Foreign Key, referenciada com o exemplo 01 */
CREATE TABLE Video (
VideoId INT PRIMARY KEY ,
Nome VARCHAR(150) NOT NULL,
Visualizacoes INT DEFAULT 0 ,
Likes INT DEFAULT 0 ,
Dislikes INT DEFAULT 0 ,
Duracao INT NOT NULL,
CanalId INT FOREIGN KEY REFERENCES Canal(CanalId)
);
```

## INSERT INTO

* Inserção de informações

``` sql
/* SINTAXE */
INSERT INTO nomeTabela(nomeColuna, nomeColuna1, ...)
VALUES(valor1,valor2)
VALUES(valor1,valor2)
VALUES(valor1,valor2)
```
``` sql
/* Inserir informações de outra tabela, dentro de uma tabela existente */
INSERT INTO nomeTabelaA (nomeColuna)
SELECT nomeColuna1
FROM nomeTabelaB
```
``` sql
/* Exemplo 03 */
/* Criando uma nova tabela e inserindo informações */
CREATE TABLE Aula (
Id INT PRIMARY KEY ,
Nome VARCHAR(200)
);
```
``` sql
/* Inserindo valores na tabela acima */
INSERT INTO Aula(Id,Nome)
VALUES(1,'Aula 1')
```
``` sql
/* Inserindo diversos valores na tabela criada */
INSERT INTO Aula(Id,Nome)
VALUES
(2,'Aula 2'),
(3,'Aula 3'),
(4,'Aula 4');
```
``` sql
/* Exemplo 04: Criando uma nova tabela e inserindo dados de outra tabela */
SELECT * INTO tabelaNova FROM Aula /* Criamos uma nova tabela, com os dados da tabela Aula */
```

## Desafios

* DESAFIO 01: Crie uma nova tabela
* DESAFIO 02: Insira uma linha na nova tabela
* DESAFIO 03: Insira 3 linhas de dados ao mesmo tempo
* DESAFIO 04: Crie uma segunda tabela
* DESAFIO 05: Insira uma linha na nova tabela
* DESAFIO 06: Copie os dados da segunda tabela para a primeira

**Soluções Desafios**
``` sql
/* Desafio 01 */
CREATE TABLE Tabela01 (
Id INT,
Nome VARCHAR(150),
Sobrenome VARCHAR(150),
);
```
``` sql
/* Desafio 02 */
INSERT INTO Tabela01(Id,Nome,Sobrenome)
VALUES(1,'Fulano','Silva')
```
``` sql
/* Desafio 03 */
INSERT INTO Tabela01(Id,Nome,Sobrenome)
VALUES
(2,'Beltrano','Araujo'),
(3,'Ciclano','Silva'),
(4,'Joao','Silva')
```
``` sql
/* Desafio 04 */
CREATE TABLE Tabela02(
Id Int,
Nome varchar(150),
Sobrenome VARCHAR(150),
);
```
``` sql
/* Desafio 05 */
INSERT INTO Tabela02(Id,Nome,Sobrenome)
values (5,'Jose','Oliveira')
```
``` sql
/* Desafio 06 */
INSERT INTO Tabela01 (Id,Nome,Sobrenome)
SELECT Id,Nome,Sobrenome
FROM Tabela02
```
