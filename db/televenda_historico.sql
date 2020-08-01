CREATE TABLE `televenda_historico` (
  `numero` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vendedor` varchar(50) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `grupo` varchar(60) NOT NULL,
  PRIMARY KEY (`numero`,`data_hora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1