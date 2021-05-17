-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema loja_virtual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema loja_virtual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loja_virtual` DEFAULT CHARACTER SET utf8 ;
USE `loja_virtual` ;

-- -----------------------------------------------------
-- Table `loja_virtual`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_virtual`.`Categoria` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(85) NOT NULL,
  `descricao` VARCHAR(85) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_virtual`.`Fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_virtual`.`Fornecedores` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(85) NOT NULL,
  `cnpj` CHAR(18) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` CHAR(14) NOT NULL,
  `nomeRepresentante` VARCHAR(45) NOT NULL,
  `telefoneRepresentante` CHAR(14) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_virtual`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_virtual`.`Produtos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DOUBLE(9,2) NOT NULL,
  `descricao` TEXT NOT NULL,
  `quantidadeEstoque` INT NOT NULL,
  `foto` VARCHAR(45) NOT NULL,
  `Categoria_id` INT UNSIGNED NOT NULL,
  `Fornecedores_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Produtos_Categoria_idx` (`Categoria_id` ASC) ,
  INDEX `fk_Produtos_Fornecedores1_idx` (`Fornecedores_id` ASC) ,
  CONSTRAINT `fk_Produtos_Categoria`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `loja_virtual`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_Fornecedores1`
    FOREIGN KEY (`Fornecedores_id`)
    REFERENCES `loja_virtual`.`Fornecedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja_virtual`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja_virtual`.`Clientes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `cpf` CHAR(14) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` CHAR(14) NOT NULL,
  `email` VARCHAR(85) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
