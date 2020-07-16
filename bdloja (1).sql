-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/07/2020 às 03:23
-- Versão do servidor: 10.4.11-MariaDB
-- Versão do PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdloja`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `idCliente` int(11) NOT NULL,
  `nomeCliente` varchar(70) NOT NULL,
  `rgCliente` varchar(15) NOT NULL,
  `cpfCliente` varchar(15) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `senhaCliente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tbcliente`
--

INSERT INTO `tbcliente` (`idCliente`, `nomeCliente`, `rgCliente`, `cpfCliente`, `emailCliente`, `senhaCliente`) VALUES
(17, 'Mateus Araujo Nascimento', '111111111111', '222.222.222-22', 'araujonascimentosp@gmail.com', 'mateus123'),
(18, 'Ronalda Souza', '15689875', '50388288841', 'twocraft8@gmail.com', 'ronalda123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbitemvenda`
--

CREATE TABLE `tbitemvenda` (
  `idItemVenda` int(11) NOT NULL,
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `qnteItemVenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbproduto`
--

CREATE TABLE `tbproduto` (
  `idProduto` int(11) NOT NULL,
  `descricaoProduto` varchar(80) NOT NULL,
  `valorProduto` double NOT NULL,
  `qnteProduto` int(11) NOT NULL,
  `fotoProduto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `tbproduto`
--

INSERT INTO `tbproduto` (`idProduto`, `descricaoProduto`, `valorProduto`, `qnteProduto`, `fotoProduto`) VALUES
(9, 'a', 1, 1, ''),
(10, 'teste', 2, 2, ''),
(11, 'test', 33, 33, ''),
(12, 'aaaaaa', 23, 23, ''),
(13, 'aaaa', 23, 50, ''),
(14, 'aa2020', 12, 13, ''),
(15, 'maisumtesteeee', 23, 20, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvenda`
--

CREATE TABLE `tbvenda` (
  `idVenda` int(11) NOT NULL,
  `dataVenda` date NOT NULL,
  `valorTotalVenda` double NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices de tabela `tbitemvenda`
--
ALTER TABLE `tbitemvenda`
  ADD PRIMARY KEY (`idItemVenda`),
  ADD KEY `idVenda` (`idVenda`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices de tabela `tbvenda`
--
ALTER TABLE `tbvenda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tbitemvenda`
--
ALTER TABLE `tbitemvenda`
  MODIFY `idItemVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tbvenda`
--
ALTER TABLE `tbvenda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `tbitemvenda`
--
ALTER TABLE `tbitemvenda`
  ADD CONSTRAINT `tbitemvenda_ibfk_1` FOREIGN KEY (`idVenda`) REFERENCES `tbvenda` (`idVenda`),
  ADD CONSTRAINT `tbitemvenda_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `tbproduto` (`idProduto`);

--
-- Restrições para tabelas `tbvenda`
--
ALTER TABLE `tbvenda`
  ADD CONSTRAINT `tbvenda_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tbcliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
