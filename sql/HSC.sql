-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database:
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1


--
-- Current Database: `HSC`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `HSC` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `HSC`;


--
-- Table structure for table `Permissao`
--

DROP TABLE IF EXISTS `Permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Permissao` (
  `idPermissao` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPermissao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paciente` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sobreNome` varchar(45) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `CPF` varchar(45) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `dataCadastro` date DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `Permissao_idPermissao` int(11) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `fk_Paciente_Permissao1_idx` (`Permissao_idPermissao`),
  CONSTRAINT `fk_Paciente_Permissao1` FOREIGN KEY (`Permissao_idPermissao`) REFERENCES `Permissao` (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Exame`
--

DROP TABLE IF EXISTS `Exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Exame` (
  `idExame` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `local` varchar(30) DEFAULT NULL,
  `protocolo` varchar(20) DEFAULT NULL,
  `dataExame` date DEFAULT NULL,
  `medicoSolicitado` varchar(30) DEFAULT NULL,
  `informacoes` varchar(300) DEFAULT NULL,
  `Paciente_idPaciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idExame`),
  KEY `_fk_Exame_Paciente_idPaciente` (`Paciente_idPaciente`),
  CONSTRAINT `_fk_Exame_Paciente_idPaciente` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `Paciente` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Medico`
--

DROP TABLE IF EXISTS `Medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medico` (
  `idMedico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) DEFAULT NULL,
  `CRM` varchar(12) NOT NULL,
  `UF` varchar(10) NOT NULL,
  `especializacao` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `informacoes` varchar(100) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `idPermissao_Permissao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMedico`),
  KEY `fk_Medico_Permissao` (`idPermissao_Permissao`),
  CONSTRAINT `fk_Medico_Permissao` FOREIGN KEY (`idPermissao_Permissao`) REFERENCES `Permissao` (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Compartilhado`
--

DROP TABLE IF EXISTS `Compartilhado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compartilhado` (
  `idCompartilhado` int(11) NOT NULL AUTO_INCREMENT,
  `idExame_Exame` int(11) DEFAULT NULL,
  `idMedico_Medico_Comp` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCompartilhado`),
  UNIQUE KEY `Compartilhado_idCompartilhado_uindex` (`idCompartilhado`),
  KEY `_fk_idExame_Exame` (`idExame_Exame`),
  KEY `_fk_idMedico_Medico_Comp` (`idMedico_Medico_Comp`),
  CONSTRAINT `_fk_idExame_Exame` FOREIGN KEY (`idExame_Exame`) REFERENCES `Exame` (`idExame`),
  CONSTRAINT `_fk_idMedico_Medico_Comp` FOREIGN KEY (`idMedico_Medico_Comp`) REFERENCES `Medico` (`idMedico`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Imagem`
--

DROP TABLE IF EXISTS `Imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagem` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `Exame_idExame` int(11) DEFAULT NULL,
  `img` mediumblob NOT NULL,
  `name` varchar(100) NOT NULL,
  `mimetype` varchar(100) NOT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `fk_Imagem_Exame_idExame` (`Exame_idExame`),
  CONSTRAINT `fk_Imagem_Exame_idExame` FOREIGN KEY (`Exame_idExame`) REFERENCES `Exame` (`idExame`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Endereco`
--

DROP TABLE IF EXISTS `Endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(10) NOT NULL,
  `Numero` int(11) NOT NULL,
  `CEP` varchar(8) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `endereço` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Paciente_has_Endereco`
--

DROP TABLE IF EXISTS `Paciente_has_Endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paciente_has_Endereco` (
  `Paciente_idUsuario` int(11) NOT NULL,
  `Endereco_idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`Paciente_idUsuario`,`Endereco_idEndereco`),
  KEY `fk_Paciente_has_Endereco_Endereco1_idx` (`Endereco_idEndereco`),
  KEY `fk_Paciente_has_Endereco_Paciente1_idx` (`Paciente_idUsuario`),
  CONSTRAINT `fk_Paciente_has_Endereco_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Endereco` (`idEndereco`),
  CONSTRAINT `fk_Paciente_has_Endereco_Paciente1` FOREIGN KEY (`Paciente_idUsuario`) REFERENCES `Paciente` (`idPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Paciente_has_Medico`
--

DROP TABLE IF EXISTS `Paciente_has_Medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paciente_has_Medico` (
  `idPaciHasMedico` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente_Paciente` int(11) DEFAULT NULL,
  `idMedico_Medico` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPaciHasMedico`),
  UNIQUE KEY `Paciente_has_Medico_idPaciHasMedico_uindex` (`idPaciHasMedico`),
  KEY `_fk_idMedico_Medico` (`idMedico_Medico`),
  KEY `_fk_idPaciente_Paciente_PHM` (`idPaciente_Paciente`),
  CONSTRAINT `_fk_idMedico_Medico` FOREIGN KEY (`idMedico_Medico`) REFERENCES `Medico` (`idMedico`),
  CONSTRAINT `_fk_idPaciente_Paciente_PHM` FOREIGN KEY (`idPaciente_Paciente`) REFERENCES `Paciente` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `RX`
--

DROP TABLE IF EXISTS `RX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RX` (
  `idRX` int(11) NOT NULL AUTO_INCREMENT,
  `nomeExame` varchar(45) NOT NULL,
  `nomeMedico` varchar(45) NOT NULL,
  `dataRealizado` date NOT NULL,
  `clinica` varchar(45) NOT NULL,
  `Paciente_idPaciente` int(11) NOT NULL,
  PRIMARY KEY (`idRX`),
  KEY `fk_RX_idPaciente1_idx` (`Paciente_idPaciente`),
  CONSTRAINT `fk_RX_Paciente_idPaciente1` FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `Paciente` (`idPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


-- Dump completed on 2023-11-27 10:44:42
