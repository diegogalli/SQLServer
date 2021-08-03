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
