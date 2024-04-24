-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb2` DEFAULT CHARACTER SET utf8 ;
USE `mydb2` ;

-- -----------------------------------------------------
-- Table `mydb2`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Categoria` (
  `IDCategoria` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Descripción` VARCHAR(500) NOT NULL,
  `Imagen` VARCHAR(500) NULL,
  PRIMARY KEY (`IDCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Producto` (
  `IDProducto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(500) NULL,
  `DescripcionCorta` VARCHAR(100) NULL,
  `Productocol` VARCHAR(45) NULL,
  `Precio` DOUBLE NULL,
  `Imagen1` VARCHAR(500) NULL,
  `Imagen2` VARCHAR(500) NULL,
  `Imagen3` VARCHAR(500) NULL,
  `Imagen4` VARCHAR(500) NULL,
  `Imagen3d` VARCHAR(500) NULL,
  `IDCategoria` INT NOT NULL,
  PRIMARY KEY (`IDProducto`, `IDCategoria`),
  INDEX `fk_1_idx` (`IDCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_1`
    FOREIGN KEY (`IDCategoria`)
    REFERENCES `mydb2`.`Categoria` (`IDCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(100) NOT NULL,
  `ApellidoP` VARCHAR(100) NOT NULL,
  `ApellidoM` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Contrasenha` VARCHAR(100) NULL,
  `TipoDocumeto` INT NOT NULL,
  `Documento` VARCHAR(50) NULL,
  `Telefono` VARCHAR(50) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Cliente` (
  `IDCliente` INT NOT NULL AUTO_INCREMENT,
  `FechaCreacion` DATE NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`IDCliente`, `idUsuario`),
  INDEX `fk_Cliente_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Cargo` (
  `idCargo` INT NOT NULL AUTO_INCREMENT,
  `Nobre` VARCHAR(100) NOT NULL,
  `Descripcion` VARCHAR(500) NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Empleado` (
  `IDEmpleado` INT NOT NULL AUTO_INCREMENT,
  `FechaContrato` DATE NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`IDEmpleado`, `idUsuario`),
  INDEX `fk_Empleado_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`CargoEmpleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`CargoEmpleado` (
  `idEmpleado` INT NOT NULL,
  `idCargo` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`, `idCargo`),
  INDEX `fk_Empleado_has_Cargo_Cargo1_idx` (`idCargo` ASC) VISIBLE,
  INDEX `fk_Empleado_has_Cargo_Empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_has_Cargo_Empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `mydb2`.`Empleado` (`IDEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Cargo_Cargo1`
    FOREIGN KEY (`idCargo`)
    REFERENCES `mydb2`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Residuo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Residuo` (
  `idResiduo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Descrpcion` VARCHAR(500) NULL,
  `Imagen` VARCHAR(500) NULL,
  PRIMARY KEY (`idResiduo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`ProductoResiduo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`ProductoResiduo` (
  `idProducto` INT NOT NULL,
  `idResiduo` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `idResiduo`),
  INDEX `fk_Producto_has_Residuo_Residuo1_idx` (`idResiduo` ASC) VISIBLE,
  INDEX `fk_Producto_has_Residuo_Producto1_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_has_Residuo_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb2`.`Producto` (`IDProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Residuo_Residuo1`
    FOREIGN KEY (`idResiduo`)
    REFERENCES `mydb2`.`Residuo` (`idResiduo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Pais` (
  `idPais` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Ciudad` (
  `idCiudad` INT NOT NULL,
  `Nombre` VARCHAR(100) NULL,
  `idPais` INT NOT NULL,
  PRIMARY KEY (`idCiudad`, `idPais`),
  INDEX `fk_Ciudad_Pais1_idx` (`idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudad_Pais1`
    FOREIGN KEY (`idPais`)
    REFERENCES `mydb2`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Direccion` (
  `idDireccion` INT NOT NULL,
  `Direccion` VARCHAR(300) NOT NULL,
  `CodPostal` VARCHAR(50) NOT NULL,
  `Referencia` VARCHAR(100) NOT NULL,
  `Logitud` DECIMAL NOT NULL,
  `Latitud` DECIMAL NOT NULL,
  `idCiudad` INT NOT NULL,
  PRIMARY KEY (`idDireccion`, `idCiudad`),
  INDEX `fk_Direccion_Ciudad1_idx` (`idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Direccion_Ciudad1`
    FOREIGN KEY (`idCiudad`)
    REFERENCES `mydb2`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Entrega` (
  `idEntrega` INT NOT NULL,
  `FechaEntrega` DATETIME NULL,
  `Estado` INT NOT NULL,
  `idDireccion` INT NOT NULL,
  PRIMARY KEY (`idEntrega`, `idDireccion`),
  INDEX `fk_Entrega_Direccion1_idx` (`idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Entrega_Direccion1`
    FOREIGN KEY (`idDireccion`)
    REFERENCES `mydb2`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Pago` (
  `idPago` INT NOT NULL,
  `FechaPago` DATE NULL,
  `Estado` INT NOT NULL,
  `Total` DECIMAL(10,8) NOT NULL,
  PRIMARY KEY (`idPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `FechaPedido` DATE NOT NULL,
  `FechaPago` DATE NULL,
  `Estado` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idEntrega` INT NULL,
  `idPago` INT NULL,
  PRIMARY KEY (`idPedido`, `idCliente`),
  INDEX `fk_Pedido_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Entrega1_idx` (`idEntrega` ASC) VISIBLE,
  INDEX `fk_Pedido_Pago1_idx` (`idPago` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb2`.`Cliente` (`IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Entrega1`
    FOREIGN KEY (`idEntrega`)
    REFERENCES `mydb2`.`Entrega` (`idEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Pago1`
    FOREIGN KEY (`idPago`)
    REFERENCES `mydb2`.`Pago` (`idPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`DetallePedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`DetallePedido` (
  `idPedido` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `idProducto`),
  INDEX `fk_Pedido_has_Producto_Producto1_idx` (`idProducto` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Producto_Pedido1_idx` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Producto_Pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `mydb2`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Producto_Producto1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb2`.`Producto` (`IDProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
