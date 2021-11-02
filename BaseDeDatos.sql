DROP TABLE Factura;
DROP TABLE Producto;
DROP SEQUENCE Seq_Factura;
DROP SEQUENCE Seq_Producto;

CREATE SEQUENCE Seq_Factura INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1;
CREATE SEQUENCE Seq_Producto INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1;
CREATE TABLE Factura 
(
    Id NUMBER(38,0) NOT NULL
    ,NumeroFactura VARCHAR2(10 BYTE) NOT NULL
    ,Fecha DATE NULL
    ,TipoPago VARCHAR2(2 BYTE) NOT NULL
    ,DocumentoCliente VARCHAR2(10 BYTE) NOT NULL
    ,NombreCliente VARCHAR2(200 BYTE) NOT NULL
    ,Subtotal NUMBER(18,2) NOT NULL
    ,Descuento NUMBER(18,2) NULL
    ,IVA NUMBER(18,2)NOT NULL
    ,TotalDescuento NUMBER(18,2) NULL
    ,TotalImpuesto NUMBER(18,2) NOT NULL
    ,Total NUMBER(18,2) NOT NULL
    ,ProductoId NUMBER(38,0) NOT NULL
);

CREATE TABLE Producto 
(
   Id NUMBER(38,0) NOT NULL
   ,Nombre VARCHAR2(200 BYTE) NOT NULL
);


ALTER TABLE Factura 
ADD CONSTRAINT Factura_Pk PRIMARY KEY (Id);

ALTER TABLE Producto 
ADD CONSTRAINT Producto_Pk PRIMARY KEY (Id);


ALTER TABLE Factura
ADD CONSTRAINT Factura_Producto_Fk FOREIGN KEY
(
  ProductoId 
)
REFERENCES Producto
(
  id 
);

GRANT ALL ON Producto TO VENTAS;
GRANT ALL ON Factura TO VENTAS;

GRANT ALL ON Seq_Factura TO VENTAS;
GRANT ALL ON Seq_Producto TO VENTAS;

INSERT INTO PRODUCTO
  (
    ID, 
    NOMBRE
  ) 
  VALUES
  (
    Seq_Producto.nextval, 
    'Camisas'
  );
INSERT INTO PRODUCTO
  (
    ID, 
    NOMBRE
  ) 
  VALUES
  (
    Seq_Producto.nextval, 
    'Zapatos'
  );
INSERT INTO PRODUCTO
  (
    ID, 
    NOMBRE
  ) 
  VALUES
  (
    Seq_Producto.nextval, 
    'Medias'
  );
INSERT INTO PRODUCTO
  (
    ID, 
    NOMBRE
  ) 
  VALUES
  (
    Seq_Producto.nextval, 
    'Bicicletas'
  );
  
INSERT
INTO FACTURA
  (
    ID,
    NUMEROFACTURA,
    FECHA,
    TIPOPAGO,
    DOCUMENTOCLIENTE,
    NOMBRECLIENTE,
    SUBTOTAL,
    DESCUENTO,
    IVA,
    TOTALDESCUENTO,
    TOTALIMPUESTO,
    TOTAL,
    PRODUCTOID
  )
  VALUES
  (
    Seq_Factura.nextval,
    'FAC001',
    to_date('29/10/2021','dd/mm/yyyy'),
    'DB',
    '1234',
    'Eulices Gil Alvarez',
    10000,
    10,
    10,
    9000,
    1000,
    10000,
    (select Id From producto where nombre='Zapatos' )
  );