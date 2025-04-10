CREATE DATABASE IF NOT EXISTS LocadoraVeiculos;
USE LocadoraVeiculos;

CREATE TABLE Cliente (
idCliente INT NOT NULL AUTO_INCREMENT,
CPF VARCHAR(14) NOT NULL UNIQUE,
nome VARCHAR(50) NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL UNIQUE,
endereco VARCHAR(100) NOT NULL,
PRIMARY KEY (idCliente)
) ENGINE = InnoDB;

CREATE TABLE Veiculo (
idVeiculo INT NOT NULL AUTO_INCREMENT,
modelo VARCHAR(50) NOT NULL,
marca VARCHAR(50) NOT NULL,
ano INT NOT NULL,
placa VARCHAR(10) NOT NULL UNIQUE,
valorDiaria DECIMAL(7,2) NOT NULL,
estado ENUM('Disponível', 'Alugado', 'Manutenção') NOT NULL,
PRIMARY KEY (idVeiculo)
) ENGINE = InnoDB;

CREATE TABLE Pagamento (
idPagamento INT NOT NULL AUTO_INCREMENT,
forma ENUM('Cartão', 'Pix', 'Dinheiro') NOT NULL,
dataPagamento DATE NOT NULL,
valorTotal DECIMAL(7,2) NOT NULL,
estado ENUM('Pago', 'Pendente') NOT NULL,
PRIMARY KEY (idPagamento)
) ENGINE = InnoDB;

CREATE TABLE Locacao (
idLocacao INT NOT NULL AUTO_INCREMENT,
idCliente INT NOT NULL,
idPagamento INT NOT NULL,
dataInicio DATE NOT NULL,
dataFim DATE NOT NULL,
PRIMARY KEY (idLocacao),
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento) ON
DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE LocacaoVeiculo (
idLocacao INT NOT NULL,
idVeiculo INT NOT NULL,
PRIMARY KEY (idLocacao, idVeiculo),
FOREIGN KEY (idLocacao) REFERENCES Locacao(idLocacao) ON DELETE
CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo) ON DELETE NO
ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE Manutencao (
idManutencao INT NOT NULL AUTO_INCREMENT,
idVeiculo INT NOT NULL,
descricao VARCHAR(100) NOT NULL,
dataManutencao DATE NOT NULL,
custo DECIMAL(7,2) NOT NULL,
PRIMARY KEY (idManutencao),
FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo) ON DELETE
CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;