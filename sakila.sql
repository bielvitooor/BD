use sakila_ptbr;
describe filme;
select * from filme;
SELECT * FROM filme ORDER BY preco_da_locacao ASC;
SELECT DISTINCT recursos_especiais FROM filme;
SELECT titulo FROM filme WHERE titulo LIKE 'Z';
SELECT titulo FROM filme WHERE titulo like '_x%';
SELECT titulo FROM filme WHERE (titulo NOT LIKE'%a')AND(titulo NOT LIKE '%e%');
SELECT * FROM filme ORDER BY duracao_do_filme DESC LIMIT 10;
SELECT * FROM filme ORDER BY duracao_do_filme ASC limit 4;
SELECT * FROM filme WHERE classificacao = 'PG-13';
SELECT titulo, classificacao,custo_de_substituicao FROM filme WHERE (classificacao = 'R') OR (custo_de_substituicao <=10);
SELECT * FROM filme WHERE (classificacao = 'R') AND (custo_de_substituicao <10);
SELECT descricao,idioma_original_id FROM filme WHERE idioma_original_id IS NULL;
SELECT * FROM filme WHERE filme_id IN (1,2,7,10,16,182,921);
SELECT * FROM filme WHERE custo_de_substituicao BETWEEN 9.99 AND 14.99;
SELECT titulo, ultima_atualizacao FROM filme WHERE ultima_atualizacao BETWEEN 2022-01-01 AND'2022-03-31';


