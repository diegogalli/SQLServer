/*Criar novo banco de dados*/
CREATE DATABASE nome_do_banco_de_dados;

/*Deletar um banco de dados*/
DROP DATABASE nome_do_banco_de_dados;

/*SELECT Como funciona*/
SELECT coluna1,coluna2 /*COLUNA1 E COLUNA2 SÃO COLUNAS QUE ESTOU SELECIONANDO*/
FROM nome_da_tabela

/*OU*/

SELECT *			/*O * SELECIONA TODAS AS COLUNAS DA TABELA*/
FROM nome_da_tabela

/*---------------------------------------------------------------------------------------*/

/*DISTINCT = Trata-se de uma cláusula para eliminar repetições em consultas, considerando as colunas informadas na listagem de colunas do comando SELECT que contenham valores iguais como o mesmo registro 
Como usar: */

SELECT DISTINCT nomeColuna, nomeColuna1
FROM nomeTabela

/*---------------------------------------------------------------------------------------------*/

/* Comando WHERE = Usamos WHERE para filtrar dados em um comando SQL. Essa cláusula deve ser seguida por uma expressão lógica */

SELECT nomeColuna, nomeColuna1 , nomeColuna2
FROM nomeTabela
WHERE condicao;

/* EXEMPLO COM OPERADOR AND */

SELECT * 
FROM person.Person /* nomeTabela */
WHERE LastName = 'miller' and FirstName = 'Anna'
/*nomeColuna = 'condicao' E nomeColuna1 = 'condicao */

/* EXEMPLO COM OPERADOR OR */

SELECT *
FROM Production.Product /* nomeTabela */
WHERE Color = 'blue' or color = 'black';
/*nomeColuna = 'condicao' OU nomeColuna1 = 'condicao */

/* EXEMPLO COM OPERADORES MAIOR QUE > e MENOR QUE < */

SELECT *
FROM Production.Product /* nomeTabela */
WHERE ListPrice > 1500 AND ListPrice < 5000;
/*nomeColuna MAIOR QUE> valor E nomeColuna1 MENOR QUE< valor/

/* EXEMPLO COM OPERADOR <> DIFERENTE */

SELECT *
FROM Production.Product /* nomeTabela */
WHERE Color <> 'red';
/*nomeColuna DIFERENTE<> 'condicao'/

/* OPERADORES LOGICOS

OPERADOR 	-	DESCRIÇÃO
=				IGUAL
>				MAIOR QUE
<				MENOR QUE
>=				MAIOR QUE OU IGUAL
<=				MENOR QUE OU IGUAL
<>				DIFERENTE DE
AND				OPERADOR LOGICO E
OR				OPERADOR LOGICO OU

*/

/*------------------------------------- DESAFIOS -------------------------------------*/

/* DESAFIO 01 = A EQUIPE DE PRODUÇÃO DE PRODUTOS PRECISA DO NOME DE TODAS
AS PEÇAS QUE PESAM MAIS QUE 500KG MAS NÃO MAIS QUE 700KG PARA INSPEÇÃO */

SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight <= 700;


/* DESAFIO 02 = FOI PEDIDO PELO MARKETING UMA RELAÇÃO DE TODOS 
OS EMPREGADOS(EMPLOYESS) QUE SÃO CASADOS
(SINGLE=SOLTEIRO, MARRIED = CASADO) E SÃO ASALARIADOS(SALARIED) */

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' AND SalariedFlag = 1

/* DESAFIO 03 = UM USUARIO CHAMADO PETER KREBS ESTÁ DEVENDO UM PAGAMENTO,
CONSIGA O EMAIL DELE PARA QUE POSSAMOS ENVIAR UMA COBRANÇA! 
( VOCÊ VAI TER QUE USAR A TABELA person.person 
E DEPOIS A TABELA person.emailaddress) */

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs'

SELECT * 
FROM Person.EmailAddress
WHERE BusinessEntityID = 26;
 
/*-------------------------------------------------------------------------------------*/

/* COUNT = RETORNA O NUMERO DE LINHAS SOLICITADOS PELA CONDIÇÃO */

SELECT COUNT(*)
FROM nomeTabela;

/*------------------------------------- DESAFIOS -------------------------------------*/

/* DESAFIO 01 = QUERO SABER QUANTOS PRODUTOS TEMOS CADASTRADOS 
EM NOSSA TABELA DE PRODUTOS */

SELECT COUNT(ProductId)
FROM Production.Product;

/* DESAFIO 02 = QUERO SABER QUANTOS TAMANHOS DE PRODUTOS TEMOS
CADASTRADOS EM NOSSA TABELA */

SELECT COUNT(Size) 
FROM Production.Product;

/*------------------------------------- DESAFIOS -------------------------------------*/

/* TOP = A cláusula TOP da linguagem SQL é utilizada para limitar o número de registros retornados por uma consulta e é pode, por exemplo, garantir certo ganho de desempenho em algumas consultas que normalmente seriam compostas por uma quantidade muito grande de registros. */

SELECT TOP 10 *
FROM nomeTabela;

/* ORDER BY = ORDER BY organiza os resultados de acordo com uma ou mais colunas da tabela, podendo definir a ordem do resultados como crescente ou decrescente. */

SELECT nomeColuna, nomeColuna1
FROM nomeTabela
ORDER BY nomeColuna ASC / DESC /* ASC = CRESCENTE | DESC = DECRESCENTE */

/*------------------------------------- DESAFIOS -------------------------------------*/

/* DESAFIO 01 = OBTER O ProductId DOS 10 PRODUTOS MAIS CAROS 
CADASTRADOS NO SISTEMA, LISTANDO MAIS CARO PARA O MAIS BARATO */

SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice desc;

/* DESAFIO 02 = OBTER O NOME E NUMERO DO PRODUTO DOS PRODUTOS
QUE TEM O ProductId entre 1~4 */

SELECT TOP 4 Name,ProductNumber
FROM Production.Product
ORDER BY ProductID asc;

/*------------------------------------- DESAFIOS -------------------------------------*/

/* BETWEEN = É USADO PARA ENCONTRAR UM VALOR ENTRE O VALOR MÍNIMO E VALOR MÁXIMO */

select *
from Production.Product /* nomeTabela */
where ListPrice between 1000 and 1500;
/*nomeColuna ENTRE mínimo E máximo */

select *
from Production.Product
where ListPrice NOT between 1000 and 1500;
/*nomeColuna NÃO ESTEJA ENTRE mínimo E máximo */

/* BETWEEN COM DATA | DATA SEGUE O MODELO ANO/MES/DIA YYYY/MM/DD */

SELECT *
FROM HumanResources.Employee
WHERE HireDate Between '2009/01/01' and '2010/01/01';

/* IN = NÓS USAMOS O OPERADOR IN JUNTO COM O WHERE, PARA VERIFICAR SE UM VALOR CORRESPONDE COM QUALQUER VALOR PASSADO NA LISTA DE VALORES */

SELECT *
FROM Person.Person /* nomeTabela */
WHERE BusinessEntityID IN (2,7,13);
/* nomeColuna VALORES(2,7,13) */

/* LIKE = Em consultas SQL as expressões com strings mais usadas são as checagens para verificação de coincidências de pares, usando o operador LIKE combinado com os caracteres especiais porcentagem (%) e sublinhado (_). O caractere % é utilizado para indicar a posição (no início, em qualquer posição ou no final) que um conteúdo será procurado no valor string do campo especificado enquanto que o caractere _ indica o número de caracteres envolvidos na pesquisa.

Na Tabela 1 pode-se observar exemplos de expressões com strings usando o operador LIKE.


Expressão	Resultado
LIKE 'Juca%'	Qualquer string que iniciem com Juca.
LIKE '%Silva'	Qualquer string que terminem com Silva.
LIKE '%Santos%'	Qualquer string que tenha Santos em qualquer posição.
LIKE 'A_'	String de dois caracteres que tenham a primeira letra A e o segundo caractere seja qualquer outro.
LIKE '_A'	String de dois caracteres cujo primeiro caractere seja qualquer um e a última letra seja a letra A.
LIKE '_A_'	String de três caracteres cuja segunda letra seja A, independentemente do primeiro ou do último caractere.
LIKE '%A_'	Qualquer string que tenha a letra A na penúltima posição e a última seja qualquer outro caractere.
LIKE '_A%'	Qualquer string que tenha a letra A na segunda posição e o primeiro caractere seja qualquer outro caractere.
LIKE '___'	Qualquer string com exatamente três caracteres.
LIKE '___%'	Qualquer string com pelo menos três caracteres.
LIKE '%''%'	Qualquer string que tenha o caractere ' em qualquer posição.

Tabela 1: Expressões com strings usando o operador LIKE

É importante destacar que comparações com strings geralmente são sensíveis ao tamanho da letra; isto é, minúsculas não são iguais a maiúsculas, e vice-versa.

Para comparações que envolvam os caracteres especiais % e _, a SQL permite o uso de um caractere de escape (\). Esse caractere é usado imediatamente antes do caractere especial que deverá ser tratado como um caractere normal, como pode ser observado nos exemplos apresentados na Tabela 2.

Expressão	Resultado
LIKE 'ab\%cd%'	Qualquer string que comece por ab%cd.
LIKE 'ab\\cd%'	Qualquer string que comece por ab\cd.

Tabela 2: Outras expressões com strings usando o operador LIKE

A SQL permite pesquisar diferenças em vez de coincidências, por meio do uso do operador de comparação NOT LIKE. */

SELECT *
FROM Person.Person /*nomeTabela */
WHERE FirstName like 'ovi%'
/* nomeColuna LIKE 'palavraProcurada%'

/*------------------------------------- DESAFIOS -------------------------------------*/

/* DESAFIO 01 = QUANTOS PRODUTOS TEMOS CADASTRADOS NO SISTEMA
QUE CUSTAM MAIS QUE 1500 DOLARES? */

SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice > 1500

/* DESAFIO 02 = QUANTAS PESSOAS TEMOS COM O SOBRENOME QUE 
INICIA COM A LETRA P? */

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName like 'P%'

/* DESAFIO 03 = EM QUANTAS CIDADES ÚNICAS ESTÃO CADASTRADOS 
NOSSOS CLIENTES? */

SELECT COUNT(DISTINCT City)
FROM Person.Address;

/* DESAFIO 04 = QUAIS SÃO AS CIDADES ÚNICAS QUE TEMOS CADASTRADAS 
EM NOSSO SISTEMA? */

SELECT DISTINCT City
FROM Person.Address

/* DESAFIO 05 = QUANTOS PRODUTOS VERMELHOS TEM O PREÇO
ENTRE 500 A 1000 DOLARES? */

SELECT COUNT(Color)
FROM Production.Product
WHERE Color = 'Red' AND ListPrice between 500 and 1000;

/* DESAFIO 06 = QUANTOS PRODUTOS CADASTRADOS TEM A PALAVRA 
'ROAD' NO NOME DELES? */

SELECT COUNT(Name)
FROM Production.Product
WHERE Name like '%road%';

/*------------------------------------- DESAFIOS -------------------------------------*/
<<<<<<< HEAD

/* Principais funções de agregação MIN, MAX, SUM e AVG 
Funções de agregação basicamente agregam ou combinam dados de uma tabela em 1 só resultado.
SUM = Soma */

SELECT TOP 10 SUM(Linetotal) as "SOMA" --Seleciona os 10 primeiros resultados e SUM(SOMA) de todos na coluna
FROM Sales.SalesOrderDetail	;		   -- Linetotal e acrescenta um apelido AS com descrição "SOMA"
/*nomeTabela*/

/*MIN = Minimo */

SELECT TOP 10 MIN(Linetotal) --Seleciona o valor MIN(Mínimo) dos 10 primeiros da coluna Linetotal
FROM Sales.SalesOrderDetail;
/*nomeTabela*/

/*MAX = Máximo */

SELECT TOP 10 MAX(Linetotal) --Seleciona o valor MAX(Máximo) dos 10 primeiros da coluna Linetotal
FROM Sales.SalesOrderDetail;
/*nomeTabela*/

/*AVG = Média*/

SELECT TOP 10 avg(Linetotal) --Seleciona o valor AVG(Médio) dos 10 primeiros da coluna Linetotal
FROM Sales.SalesOrderDetail
/*nomeTabela*/

