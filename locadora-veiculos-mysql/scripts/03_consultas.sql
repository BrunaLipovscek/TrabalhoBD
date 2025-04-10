SELECT descricao, dataManutencao, custo
FROM Manutencao;

SELECT SUM(valorTotal) AS total_arrecadado
FROM Pagamento
WHERE estado = 'Pago';

SELECT Veiculo.modelo, Veiculo.marca, COUNT(LocacaoVeiculo.idLocacao) AS
total_locacoes
FROM Veiculo
JOIN LocacaoVeiculo ON Veiculo.idVeiculo = LocacaoVeiculo.idVeiculo
GROUP BY Veiculo.idVeiculo
ORDER BY total_locacoes DESC;

SELECT Cliente.nome, SUM(Pagamento.valorTotal) AS valor_devido
FROM Cliente
JOIN Locacao ON Cliente.idCliente = Locacao.idCliente
JOIN Pagamento ON Locacao.idPagamento = Pagamento.idPagamento
WHERE Pagamento.estado = 'Pendente'
GROUP BY Cliente.idCliente
ORDER BY Cliente.nome ASC;