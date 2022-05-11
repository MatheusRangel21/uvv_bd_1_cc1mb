/* QUEST�O 01 */
SELECT nome_departamento AS Departamento, AVG(salario) AS M�dia_salarial
FROM departamento d INNER JOIN funcionario f
WHERE f.numero_departamento = d.numero_departamento
GROUP BY nome_departamento;

/* QUEST�O 02 */
SELECT sexo AS Sexo, AVG(salario) AS M�dia_salarial 
FROM funcionario GROUP BY Sexo;

/* QUEST�O 03 */
SELECT nome_departamento AS Departamento, CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, 
data_nascimento AS Data_de_nascimento, 
FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
salario AS Sal�rio 
FROM departamento d INNER JOIN funcionario f
WHERE d.numero_departamento = f.numero_departamento
ORDER BY nome_departamento;

/* QUEST�O 04 */
SELECT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
salario AS Sal�rio, salario*1.2 AS Novo_sal�rio FROM funcionario f
WHERE salario < '35000'
UNION
SELECT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
salario AS Sal�rio, salario*1.15 AS Novo_sal�rio FROM funcionario f
WHERE salario >= '35000';

/* QUEST�O 05 */
SELECT nome_departamento AS Departamento, g.primeiro_nome AS Gerente, f.primeiro_nome AS Funcion�rio, 
salario AS Sal�rio
FROM departamento d INNER JOIN funcionario f, 
(SELECT primeiro_nome, cpf FROM funcionario f INNER JOIN departamento d WHERE f.cpf = d.cpf_gerente) AS g
WHERE f.numero_departamento = d.numero_departamento AND g.cpf = d.cpf_gerente
ORDER BY d.nome_departamento ASC, f.salario DESC;

/* QUEST�O 06 */
SELECT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, depart.nome_departamento AS Departamento,
dpd.nome_dependente AS Dependente, FLOOR(DATEDIFF(CURDATE(), dpd.data_nascimento)/365.25) AS Idade_dependente,
CASE WHEN dpd.sexo = 'M' THEN 'Masculino' WHEN dpd.sexo = 'F' THEN 'Feminino' END AS Sexo_dependente
FROM funcionario f 
INNER JOIN departamento depart ON f.numero_departamento = depart.numero_departamento
INNER JOIN dependente dpd ON dpd.cpf_funcionario = f.cpf;

/* QUEST�O 07 */
SELECT DISTINCT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, depart.nome_departamento AS Departamento,
salario AS Sal�rio FROM funcionario f
INNER JOIN departamento depart
INNER JOIN dependente dpd
WHERE depart.numero_departamento = f.numero_departamento AND
f.cpf NOT IN (SELECT dpd.cpf_funcionario FROM dependente dpd);

/* QUEST�O 08 */
SELECT d.nome_departamento AS Departamento, p.nome_projeto AS Projeto,
CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, tbem.horas AS Horas
FROM funcionario f INNER JOIN projeto p INNER JOIN departamento d INNER JOIN trabalha_em tbem
WHERE p.numero_departamento = d.numero_departamento AND
f.cpf = tbem.cpf_funcionario AND
p.numero_projeto = tbem.numero_projeto 
ORDER BY p.numero_projeto;

/* QUEST�O 09 */
SELECT d.nome_departamento AS Departamento, p.nome_projeto AS Projeto, SUM(tbem.horas) AS Total_horas
FROM departamento d INNER JOIN projeto p INNER JOIN trabalha_em tbem
WHERE p.numero_projeto = tbem.numero_projeto AND d.numero_departamento = p.numero_departamento
GROUP BY p.nome_projeto;

/* QUEST�O 10 */
SELECT nome_departamento AS Departamento, AVG(salario) AS M�dia_salarial
FROM departamento d INNER JOIN funcionario f
WHERE f.numero_departamento = d.numero_departamento
GROUP BY d.nome_departamento;

/* QUEST�O 11 */
SELECT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, p.nome_projeto AS Projeto,
tbem.horas*50 AS Valor_ganho
FROM funcionario f INNER JOIN trabalha_em tbem INNER JOIN projeto p
WHERE f.cpf = tbem.cpf_funcionario AND p.numero_projeto = tbem.numero_projeto
GROUP BY primeiro_nome;

/* QUEST�O 12 */
SELECT d.nome_departamento AS Departamento, p.nome_projeto AS Projeto,
CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo, tbem.horas AS Horas
FROM funcionario f  INNER JOIN projeto p INNER JOIN departamento d INNER JOIN trabalha_em tbem
WHERE f.cpf = tbem.cpf_funcionario AND p.numero_projeto = tbem.numero_projeto AND (tbem.horas = NULL OR tbem.horas = 0)
GROUP BY primeiro_nome;

/* QUEST�O 13 */
SELECT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome,
CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'F' THEN 'Feminino' END AS Sexo,
FLOOR(DATEDIFF(CURDATE(), f.data_nascimento)/365.25) AS Idade
FROM funcionario f
UNION
SELECT d.nome_dependente AS Nome,
CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'F' THEN 'Feminino' END AS Sexo,
FLOOR(DATEDIFF(CURDATE(), d.data_nascimento)/365.25) AS Idade
FROM dependente d
ORDER BY Idade;

/* QUEST�O 14 */
SELECT d.nome_departamento AS Departamento, COUNT(f.numero_departamento) AS Qtd_funcionarios
FROM funcionario f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento
GROUP BY d.nome_departamento;

/* QUEST�O 15 */
SELECT DISTINCT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo,
d.nome_departamento AS Departamento, 
p.nome_projeto AS Projeto
FROM departamento d INNER JOIN trabalha_em tbem INNER JOIN projeto p INNER JOIN funcionario f 
WHERE d.numero_departamento = f.numero_departamento AND p.numero_projeto = tbem.numero_projeto AND
tbem.cpf_funcionario = f.cpf
UNION
SELECT DISTINCT CONCAT(primeiro_nome, ' ', nome_meio, ' ', ultimo_nome) AS Nome_completo,
d.nome_departamento AS Departamento, 
'Sem projeto' AS Projeto
FROM departamento d INNER JOIN trabalha_em tbem INNER JOIN projeto p INNER JOIN funcionario f 
WHERE d.numero_departamento = f.numero_departamento AND p.numero_projeto = tbem.numero_projeto AND
(f.cpf NOT IN (SELECT tbem.cpf_funcionario FROM trabalha_em tbem));



