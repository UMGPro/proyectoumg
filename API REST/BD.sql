CREATE TABLE departamentof (
  id_departamento INT PRIMARY KEY,
  nombre VARCHAR(30)
);

CREATE TABLE paisf (
  id_pais INT PRIMARY KEY,
  nombre VARCHAR(30)
);

CREATE TABLE asignacion_direccionf (
  id_asignacion INT PRIMARY KEY,
  fk_departamentoAsignacion int,
  fk_paisAsignacion int,
  FOREIGN KEY (fk_departamentoAsignacion) REFERENCES departamentof(id_departamento),
  FOREIGN KEY (fk_paisAsignacion) REFERENCES paisf(id_pais)
);

CREATE TABLE clientef (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(30),
  apellido VARCHAR(30),
  contacto VARCHAR(30),
  edad INT,
  dpi VARCHAR(30),
  fk_direccionCliente INT,
  FOREIGN KEY (fk_direccionCliente) REFERENCES asignacion_direccionf(id_asignacion)
);

CREATE TABLE empleadof (
  id_empleado INT PRIMARY KEY,
  nombre VARCHAR(30),
  apellido VARCHAR(30),
  edad INT,
  dpi VARCHAR(30),
  fk_direccionEmpleado INT,
  FOREIGN KEY (fk_direccionEmpleado) REFERENCES asignacion_direccionf(id_asignacion)
);

CREATE TABLE usuariof (
  id_user INT PRIMARY KEY,
  nick VARCHAR(30),
  password CHAR(64),
  fk_empleado INT,
  FOREIGN KEY (fk_empleado) REFERENCES empleadof(id_empleado)
);

CREATE TABLE proveedorf (
  id_proveedor INT PRIMARY KEY,
  nombre VARCHAR(30),
  contacto VARCHAR(30),
  fk_direccionProveedor INT,
  FOREIGN KEY (fk_direccionProveedor) REFERENCES asignacion_direccionf(id_asignacion)
);

CREATE TABLE comprasf (
  id_compras INT PRIMARY KEY,
  detalle VARCHAR(30),
  fecha DATE NOT NULL,
  fk_empleadoComprasF INT,
  fk_proveedorComprasF INT,
  FOREIGN KEY (fk_empleadoComprasF) REFERENCES empleadof(id_empleado),
  FOREIGN KEY (fk_proveedorComprasF) REFERENCES clientef(id_cliente)
);



CREATE TABLE ventasf (
  id_ventas INT PRIMARY KEY,
  detalle VARCHAR(30),
  fecha DATE NOT NULL,
  fk_empleadoVentas INT,
  fk_clienteVentas INT,
  FOREIGN KEY (fk_empleadoVentas) REFERENCES empleadof(id_empleado),
  FOREIGN KEY (fk_clienteVentas) REFERENCES comprasf(id_compras)
);

CREATE TABLE productosf (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(30),
  stock INT,
  precio DECIMAL(8,2)
);

CREATE TABLE asignarproductof (
  id_asignarproducto INT PRIMARY KEY,
  fk_producto INT,
  fk_proveedor INT,
  FOREIGN KEY (fk_producto) REFERENCES productosf(id_producto),
  FOREIGN KEY (fk_proveedor) REFERENCES proveedorf(id_proveedor)
);

CREATE TABLE detalle_ventaf (
  id_detalle_venta INT PRIMARY KEY,
  detalle VARCHAR(100),
  fk_ventas INT,
  fk_producto INT,
  cantidad INT,
  precio DECIMAL(8,2),
  FOREIGN KEY (fk_ventas) REFERENCES ventasf(id_ventas),
  FOREIGN KEY (fk_producto) REFERENCES productosf(id_producto)
);
INSERT INTO departamentof (id_departamento, nombre) VALUES (1, 'Escuintla');
INSERT INTO paisf (id_pais, nombre) VALUES (1, 'Guatemala');
INSERT INTO asignacion_direccionf (id_asignacion, fk_departamentoAsignacion,fk_paisAsignacion) VALUES (1,1,1);
INSERT INTO clientef (id_cliente, nombre,apellido,fk_direccionCliente,contacto,edad,dpi) VALUES (1, 'Fredy', 'Interiano',1,'7881-0000',100,'29014 1244 1421');
INSERT INTO empleadof (id_empleado,nombre,apellido,edad,dpi,fk_direccionEmpleado) VALUES (1,'Albert','Einstein',88,'2831 4124 9412',1);
INSERT INTO usuariof (id_user, nick,password,fk_empleado) VALUES (1,'UMG',SHA2('admin321', 256),1);

--Procesos implementados directamente en el servidor.

  'SELECT fk_empleado FROM usuariof WHERE nick=? AND password=SHA2(?, 256)', [usuario,Contraseña];
  'UPDATE usuariof SET nick = valor1, password=SHA2(valor2, 256), fk_empleado=valor3 WHERE id_user=valor4',[--];
  'DELETE FROM usuariof WHERE id_user=valor1 AND nick=valor2';