-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sge
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sge` ;

-- -----------------------------------------------------
-- Schema sge
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sge` ;
USE `sge` ;

-- -----------------------------------------------------
-- Table `sge`.`Turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`Turma` ;

CREATE TABLE IF NOT EXISTS `sge`.`Turma` (
  `idTurma` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Ano` VARCHAR(45) NULL,
  PRIMARY KEY (`idTurma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`aluno` ;

CREATE TABLE IF NOT EXISTS `sge`.`aluno` (
  `idaluno` INT NOT NULL,
  `id_alunp` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Dt_nascimento` VARCHAR(45) NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `turma_id_turma` INT NOT NULL,
  `Disciplina_idDisciplina` INT NOT NULL,
  `Turma_idTurma` INT NOT NULL,
  PRIMARY KEY (`idaluno`, `turma_id_turma`, `Disciplina_idDisciplina`, `Turma_idTurma`),
  INDEX `fk_aluno_Turma_idx` (`Turma_idTurma` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_Turma`
    FOREIGN KEY (`Turma_idTurma`)
    REFERENCES `sge`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`professor` ;

CREATE TABLE IF NOT EXISTS `sge`.`professor` (
  `id_professor` INT NOT NULL,
  `flores` VARCHAR(45) NULL,
  `espeçialização_TI` VARCHAR(45) NULL,
  `e_mail` VARCHAR(45) NULL,
  PRIMARY KEY (`id_professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `sge`.`disciplina` (
  `idDisciplina` INT NOT NULL,
  `cod_Diciplina` VARCHAR(45) NULL,
  `carga_horaria` INT NULL,
  `ano` INT NULL,
  PRIMARY KEY (`idDisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`Leciona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`Leciona` ;

CREATE TABLE IF NOT EXISTS `sge`.`Leciona` (
  `professor_id_professor` INT NOT NULL,
  `Turma_idTurma` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `Turma_idTurma`),
  INDEX `fk_professor_has_Turma_Turma1_idx` (`Turma_idTurma` ASC) VISIBLE,
  INDEX `fk_professor_has_Turma_professor1_idx` (`professor_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_Turma_professor1`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `sge`.`professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_Turma_Turma1`
    FOREIGN KEY (`Turma_idTurma`)
    REFERENCES `sge`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`Ministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`Ministra` ;

CREATE TABLE IF NOT EXISTS `sge`.`Ministra` (
  `professor_id_professor` INT NOT NULL,
  `disciplina_idDisciplina` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `disciplina_idDisciplina`),
  INDEX `fk_professor_has_disciplina_disciplina1_idx` (`disciplina_idDisciplina` ASC) VISIBLE,
  INDEX `fk_professor_has_disciplina_professor1_idx` (`professor_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_disciplina_professor1`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `sge`.`professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_idDisciplina`)
    REFERENCES `sge`.`disciplina` (`idDisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge`.`Associada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge`.`Associada` ;

CREATE TABLE IF NOT EXISTS `sge`.`Associada` (
  `professor_id_professor` INT NOT NULL,
  `Turma_idTurma` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `Turma_idTurma`),
  INDEX `fk_professor_has_Turma_Turma2_idx` (`Turma_idTurma` ASC) VISIBLE,
  INDEX `fk_professor_has_Turma_professor2_idx` (`professor_id_professor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_Turma_professor2`
    FOREIGN KEY (`professor_id_professor`)
    REFERENCES `sge`.`professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_Turma_Turma2`
    FOREIGN KEY (`Turma_idTurma`)
    REFERENCES `sge`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
