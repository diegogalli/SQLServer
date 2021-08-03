# SQLServer
Curso SQL SERVER Youtube

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
