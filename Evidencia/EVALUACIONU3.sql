--UNIDAD 3 
--PAMELA MARTINEZ MORENO22CG0213
--PAGINA WEB DE VENTA DE PELUCHITOS Y DE LIBROS DIGITALES.
create database PAMELIEWEB;

/*NOTA: EL PROFE GRIJALVA NOS PIDIO HACER LOS ID AUTO INCREMENTABLES Y QUE LAS CANTIDADES DE DINERO SEAN DE TIPO DECIMAL*/
/*TABLAS PARA TODO LO RELACIONADO CON LOS PRODUCTOS*/ 
create table productos(id_prod int not null /*auto_increment*/, primary key(id_prod), categoria char(25), nombre varchar(30), descripcion varchar(60), precio decimal(4),estatus char(10), imagen varchar(30));
create table media (id_prod int not null, FOREIGN KEY (id_prod) REFERENCES productos(id_prod),archivo varchar(50));
create table stock(id_prod int not null, FOREIGN KEY (id_prod) REFERENCES productos(id_prod), cantidad int, costo_insumos decimal(4),mano_obra decimal(4),costototal decimal(4) );

/*TABLAS PARA TODA LA INFORMACION RELACIONADA CON NUESTROS USUARIOS.*/
create table usuario (id_usuario int not null /*auto_increment*/,primary key (id_usuario), nombre char(25), correo varchar(40), password varchar(25),telefono varchar(10),profilepic varchar(30), nivel varchar(30));
create table domicilio (id_usuario int not null,FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), pais char(50), estado char(50), ciudad char(50), calle varchar(30),numero varchar(5), colonia varchar(50), cp varchar(5),referencia varchar (50));
create table infopago (id_usuario int not null,FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), tarjeta_digital varchar(16),cvv varchar(3),fecha_vencimiento date);
create table opinion (id_usuario int not null,FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), calificacion numeric(3,1), opinion varchar (100), id_prod int, FOREIGN KEY (id_prod) REFERENCES productos(id_prod));
create table listadeseos (id_usuario int not null,FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), id_prod int, FOREIGN KEY (id_prod) REFERENCES productos(id_prod));

/*TABLAS PARA TODO LO RELACIONADO CON LAS VENTAS*/
create table venta(id_venta int not null /*auto_increment*/, primary key(id_venta), id_usuario int, FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), fecha_compra date, costo_pedido decimal(4), costo_envio decimal(4),total decimal(4));
create table venta_productos(id_ventap int not null /*auto_increment*/, primary key(id_ventap), id_prod int, FOREIGN KEY (id_prod) REFERENCES productos(id_prod), cantidad int, precio decimal, id_venta int, FOREIGN KEY (id_venta) REFERENCES venta(id_venta)); 
create table pagos(id_pago int not null /*auto_increment*/, id_venta int, FOREIGN KEY (id_venta) REFERENCES venta(id_venta),metodo_pago varchar(50), monto decimal(4));

/*TABLA PARA EL SEGUIMIENTO DEL ENVIO DE LOS PEDIDOS*/
create table logistica(id_rastreo int not null /*auto_increment*/,id_venta int, FOREIGN KEY (id_venta) REFERENCES venta(id_venta), fecha_actual date,hora time, ubicacion_pedido varchar(60),fecha_estimada date, estatus_envio char(20),empresa varchar(30),cod_rastreo varchar(30),numerosoporte varchar(12), link varchar(100));

/*INSERTS PARA TABLA USUARIOS*/
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (1, 'Marie', 'marie@outlook.com', 'marie1999', '6361729898', 'marie.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (2, 'Pamela', 'pamela@gmail.com', 'pamelie221', '6361148085', 'pamela.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (3, 'David', 'david22@hotmail.com', 'holacomo122', '6143937106', 'david.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (4, 'Saul', 'saul2000@gmail.com', 'saulgarcia102', '6562829900', 'saul.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (5, 'Lilia', 'margarita@hotmail.com', 'liliamargarita', '6361112322', 'lilia.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (6, 'Alberto', 'betito@gmail.com', 'betitoFlow', '6361238192', 'alberto.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (7, 'Luis', 'luisito230@outlook.com', 'luisin', '6145367272', 'luis.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (8, 'Jennifer', 'jennysitap@hotmail.com', 'jennyyy12', '6361002929', 'jennifer.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (9, 'Daniela', 'daniela210@gmail.com', 'danyconzapatos', '6361286289', 'daniela.jpg', 'cliente');
INSERT INTO usuario (id_usuario, nombre, correo, password, telefono, profilepic, nivel)
VALUES (10, 'Georgina', 'geomakita@outlook.com', 'cheetosconcrema', '6367001919', 'georgina.jpg', 'administrador');
/*INSERTS PARA TABLA DOMICILIO*/
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (1, 'México', 'Chihuahua', 'Nuevo Casas Grandes', 'Av.20 de noviembre', '2700', 'Centro', '31700', 'Frente al parque');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (2, 'México', 'Nuevo Leon', 'Monterrey', '16 de septiembre', '3102', 'Obrera', '93129', 'Casa color vino');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (3, 'México', 'Guanajuato', 'Guanajuato', '2 de Abril', '9000', 'Colinas del Sur', '21900', 'Carro rojo afuera');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (4, 'México', 'Ciudad de México', 'CDMX', 'Av. Insurgentes', '1234', 'Centro', '01010', 'Cerca del metro');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (5, 'México', 'Jalisco', 'Guadalajara', 'Av. Vallarta', '5678', 'Zona Rosa', '44100', 'Frente a la plaza');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (6, 'México', 'Nuevo León', 'Monterrey', 'Calle Morelos', '12', 'Centro', '64000', 'A una cuadra del parque');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (7, 'México', 'Querétaro', 'Querétaro', '5 de Febrero', '890', 'Los Arcos', '76010', 'Cerca del estadio');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (8, 'México', 'Veracruz', 'Veracruz', 'Blvd. Manuel Ávila Camacho', '2345', 'Centro', '91900', 'Frente al malecón');
INSERT INTO domicilio (id_usuario, pais, estado, ciudad, calle, numero, colonia, cp, referencia)
VALUES (9, 'México', 'Puebla', 'Puebla', 'Av. Reforma', '78', 'Centro Histórico', '72000', 'Cerca de la catedral');
/*INSERTS PARA LA TABLA INFOPAGO*/
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (1, '1234567812345678', '123', '2025-12-31');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (2, '2345678923456789', '234', '2026-11-30');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (3, '3456789034567890', '345', '2025-10-31');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (4, '4567890145678901', '456', '2027-09-30');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (5, '5678901256789012', '567', '2024-08-31');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (6, '6789012367890123', '678', '2026-07-31');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (7, '7890123478901234', '789', '2028-06-30');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (8, '8901234589012345', '890', '2025-05-31');
INSERT INTO infopago (id_usuario, tarjeta_digital, cvv, fecha_vencimiento)
VALUES (9, '9012345690123456', '901', '2029-04-30');
/*INSERTS DE LA TABLA OPINION*/
INSERT INTO opinion (id_usuario, calificacion, opinion, id_prod) 
VALUES (4, 10, 'Muy buen producto, excelente calidad', 8);
INSERT INTO opinion (id_usuario, calificacion, opinion, id_prod) 
VALUES (5, 9, 'Muy buen producto, pero no me gusto el empaque', 9);
/*INSERTS DE LA TABLA LISTA DE DESEOS*/
INSERT INTO listadeseos (id_usuario, id_prod) 
VALUES (1, 1);
INSERT INTO listadeseos (id_usuario, id_prod) 
VALUES (1, 4);
INSERT INTO listadeseos (id_usuario, id_prod) 
VALUES (3, 8);
INSERT INTO listadeseos (id_usuario, id_prod) 
VALUES (2, 6);
INSERT INTO listadeseos (id_usuario, id_prod) 
VALUES (5, 2);
INSERT INTO listadeseos (id_usuario, id_prod) 
VALUES (9, 1);
/*INSERTS DE LA TABLA DE PRODUCTOS*/
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (1, 'amigurumi', 'Kuromi Amigurumi', 'Amigurumi de Kuromi hecho a mano', 500.00, 'Disponible', 'kuromi.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (2, 'amigurumi', 'Shrek Amigurumi', 'Amigurumi de Shrek hecho a mano', 400.00, 'Agotado', 'shrek.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (3, 'patron', 'Patron de Kuromi', 'Patron facil de Kuromi a crochet', 99.99, 'Disponible', 'kuromipattern.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (4, 'patron', 'Patron de Batman', 'Patron de Batman a crochet', 99.99, 'Disponible', 'batmanpattern.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (5, 'patron', 'Patron de Conejito', 'Patron de conejito a crochet', 99.99, 'Disponible', 'conejitopattern.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (6, 'video', 'spiderman Tutorial', 'Video tutorial de spiderman a crochet', 99.99, 'Disponible', 'spidermantutorial.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (7, 'amigurumi', 'Messi Amigurumi', 'Amigurumi Messi tipo Funko', 1000.00, 'Disponible', 'messi.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (8, 'amigurumi', 'Deadpool Amigurumi', 'Amigurumi Deapool', 1500.00, 'Disponible', 'deadpool.jpg');
INSERT INTO productos (id_prod, categoria, nombre, descripcion, precio, estatus, imagen) 
VALUES (9, 'amigurumi', 'Inuyasha Amigurumi', 'Amigurumi de Inuyasha hecho a mano', 600.00, 'Disponible', 'inuyasha.jpg');
/*INSERTS DE LA TABLA MEDIA*/
INSERT INTO media (id_prod, archivo) 
VALUES (3, 'kuromipattern.pdf');
INSERT INTO media (id_prod, archivo) 
VALUES (4, 'batmanpattern.pdf');
INSERT INTO media (id_prod, archivo) 
VALUES (5, 'conejitopattern.pdf');
INSERT INTO media (id_prod, archivo) 
VALUES (6, 'spidermantutorial.mp4');
/*INSERTS DE LA TABLA STOCK*/
/*EL COSTO TOTAL ES EL COSTO MINIMO AL QUE DEBO VENDER MIS AMIGURUMIS.*/
INSERT INTO stock (id_prod, cantidad, costo_insumos, mano_obra, costototal) 
VALUES (1, 50, 50.50, 100.00, 500.00);
INSERT INTO stock (id_prod, cantidad, costo_insumos, mano_obra, costototal) 
VALUES (2, 30, 80.50, 100.00, 400.00);
INSERT INTO stock (id_prod, cantidad, costo_insumos, mano_obra, costototal) 
VALUES (7, 20, 100.00, 200.00, 1000.00);
INSERT INTO stock (id_prod, cantidad, costo_insumos, mano_obra, costototal) 
VALUES (8, 10, 150.50, 300.00, 1500.00);
INSERT INTO stock (id_prod, cantidad, costo_insumos, mano_obra, costototal) 
VALUES (9, 50, 90.50, 250.00, 600.00);
/*INSERTS DE LA TABLA VENTA*/
INSERT INTO venta (id_venta, id_usuario, fecha_compra, costo_pedido, costo_envio, total) 
VALUES (1, 1, '2024-11-1', 500.00, 90.00, 590.00);
INSERT INTO venta (id_venta, id_usuario, fecha_compra, costo_pedido, costo_envio, total) 
VALUES (2, 2, '2024-11-13', 400.00, 60.00, 460.00);
INSERT INTO venta (id_venta, id_usuario, fecha_compra, costo_pedido, costo_envio, total) 
VALUES (3, 3, '2024-11-15', 99.99, 0.00, 99.99);
INSERT INTO venta (id_venta, id_usuario, fecha_compra, costo_pedido, costo_envio, total) 
VALUES (4, 4, '2024-11-20', 1500.00, 80.00, 1580.00);
INSERT INTO venta (id_venta, id_usuario, fecha_compra, costo_pedido, costo_envio, total) 
VALUES (5, 5, '2024-12-10', 1200.00, 90.00, 1290.00);
/*INSERTS DE LA TABLA VENTA_PRODUCTOS*/
INSERT INTO venta_productos (id_ventap, id_prod, cantidad, precio,id_venta) 
VALUES (1, 1, 1, 500.00,1);
INSERT INTO venta_productos (id_ventap, id_prod, cantidad, precio, id_venta) 
VALUES (2, 2, 1, 400.00,2);
INSERT INTO venta_productos (id_ventap, id_prod, cantidad, precio, id_venta) 
VALUES (3, 3, 1, 99.99,3);
INSERT INTO venta_productos (id_ventap, id_prod, cantidad, precio, id_venta) 
VALUES (4, 8, 1, 1500.00,4);
INSERT INTO venta_productos (id_ventap, id_prod, cantidad, precio, id_venta) 
VALUES (5, 9, 2, 600.00,5);
/*INSERTS DE LA TABLA PAGOS*/
INSERT INTO pagos (id_pago, id_venta, metodo_pago, monto) 
VALUES (1, 1, 'Paypal Debito', 590.00);
INSERT INTO pagos (id_pago, id_venta, metodo_pago, monto) 
VALUES (2, 2, 'Mercado Pago Credito', 460.00);
INSERT INTO pagos (id_pago, id_venta, metodo_pago, monto) 
VALUES (3, 3, 'Paypal Credito', 99.99);
INSERT INTO pagos (id_pago, id_venta, metodo_pago, monto) 
VALUES (4, 4, 'BBVA Debito', 1580.00);
INSERT INTO pagos (id_pago, id_venta, metodo_pago, monto) 
VALUES (5, 5, 'Nu Credito', 1290.00);
/*INSERTS DE LA TABLA LOGISTICA*/
INSERT INTO logistica (id_rastreo, id_venta, fecha_actual, hora, ubicacion_pedido, fecha_estimada, estatus_envio, empresa, cod_rastreo, numerosoporte, link) 
VALUES (1, 1, '2024-11-14', '15:30:00', 'Centro de Distribución de Juarez', '2024-11-15', 'En transito', 'DHL', '123456789ABC', '8001234567', 'https://www.dhl.com/track');
INSERT INTO logistica (id_rastreo, id_venta, fecha_actual, hora, ubicacion_pedido, fecha_estimada, estatus_envio, empresa, cod_rastreo, numerosoporte, link) 
VALUES (2, 2, '2024-11-14', '18:30:00', 'Centro de Distribución de Tamaulipas', '2024-11-20', 'En transito', 'SoluPostal', '123456789ADC', '230230320', 'https://www.SoluPostal.com/track');
INSERT INTO logistica (id_rastreo, id_venta, fecha_actual, hora, ubicacion_pedido, fecha_estimada, estatus_envio, empresa, cod_rastreo, numerosoporte, link) 
VALUES (3, 4, '2024-11-14', '19:30:00', 'Ciudad de Mexico,CDMX', '2024-11-14', 'Recibido', 'SoluPostal', '123456789BBC', '230230320', 'https://www.SoluPostal.com/track');
INSERT INTO logistica (id_rastreo, id_venta, fecha_actual, hora, ubicacion_pedido, fecha_estimada, estatus_envio, empresa, cod_rastreo, numerosoporte, link) 
VALUES (4, 5, '2024-11-14', '8:30:00', 'Guadalajara, Jalisco', '2024-11-14', 'Recibido', 'DHL', '123456789ARBC', '8001234567', 'https://www.dhl.com/track');

/*CONSULTAS REQUERIDAS:*/

/*PRODUCTO CARTESIANO E INNER JOIN*/
/*1.-Seleccionar el id_venta,el monto total, el estatus del envio y la opinion del cliente de los clientes que ya recibieron su pedido.*/
SELECT v.id_venta, v.total, l.estatus_envio, o.opinion FROM venta v, logistica l, opinion o WHERE v.id_venta=l.id_venta AND o.id_usuario=v.id_usuario AND l.estatus_envio IN ('Recibido');
SELECT v.id_venta, v.total, l.estatus_envio, o.opinion FROM venta v INNER JOIN logistica l ON v.id_venta=l.id_venta  INNER JOIN opinion o ON o.id_usuario=v.id_usuario WHERE l.estatus_envio IN ('Recibido');

/*2.-Seleccionar el id_venta, el metodo de pago, el producto que compro, la cantidad y el total de su pedido de los productos que son de categoria patron*/
SELECT v.id_venta, p.metodo_pago, pr.nombre, vp.cantidad, v.total,pr.categoria FROM venta v, pagos p, productos pr, venta_productos vp WHERE v.id_venta=p.id_venta AND v.id_venta=vp.id_venta AND pr.id_prod=vp.id_prod AND pr.categoria IN('patron');
SELECT  v.id_venta, p.metodo_pago, pr.nombre, vp.cantidad, v.total, pr.categoria FROM venta v INNER JOIN pagos p ON v.id_venta = p.id_venta INNER JOIN  venta_productos vp ON v.id_venta = vp.id_venta INNER JOIN productos pr ON pr.id_prod = vp.id_prod WHERE pr.categoria IN ('patron');

/*3.-Selecciona la ubicacion del cliente y la ubicacion de su pedido de los clientes que su estatus se encuentra en transito*/
SELECT v.id_venta,u.nombre as [NOMBRE DEL CLIENTE],d.ciudad+' '+d.estado AS [UBICACION DEL CLIENTE], l.ubicacion_pedido AS [UBICACION DE SU PEDIDO] FROM domicilio d, logistica l, venta v, usuario u WHERE v.id_venta=l.id_venta AND v.id_usuario=u.id_usuario AND u.id_usuario=d.id_usuario AND l.estatus_envio IN ('En transito');
SELECT v.id_venta, u.nombre AS [NOMBRE DEL CLIENTE], d.ciudad + ' ' + d.estado AS [UBICACION DEL CLIENTE], l.ubicacion_pedido AS [UBICACION DE SU PEDIDO] FROM venta v INNER JOIN logistica l ON v.id_venta = l.id_venta INNER JOIN usuario u ON v.id_usuario = u.id_usuario INNER JOIN domicilio d ON u.id_usuario = d.id_usuario WHERE l.estatus_envio IN ('En transito');

/*4.-Selecciona los productos fisicos y la cantidad que hay en stock que hay de cada uno*/
SELECT p.id_prod,p.nombre, p.categoria, s.cantidad FROM productos p, stock s WHERE p.id_prod=s.id_prod;
SELECT p.id_prod,p.nombre,p.categoria,s.cantidad FROM productos p INNER JOIN stock s ON p.id_prod=s.id_prod;
/*5.-Selecciona los productos digitales y su correspondiente archivo.*/
SELECT p.id_prod, p.nombre,p.categoria,m.archivo FROM productos p, media m WHERE p.id_prod=m.id_prod;
SELECT p.id_prod, p.nombre,p.categoria,m.archivo FROM productos p INNER JOIN media m ON p.id_prod=m.id_prod;
/*6.-Selecciona todos los datos de la tabla de pagos y los datos de la tarjeta con la que pagaron los clientes*/
SELECT p.*,i.* FROM pagos p,infopago i, venta v, usuario u WHERE u.id_usuario=i.id_usuario AND v.id_venta=p.id_venta AND v.id_usuario=u.id_usuario;
SELECT p.*, i.* FROM pagos p INNER JOIN venta v ON v.id_venta = p.id_venta INNER JOIN usuario u ON u.id_usuario = v.id_usuario INNER JOIN infopago i ON i.id_usuario = u.id_usuario;

/*FUNCIONES DE CONSULTA Y COLUMNA DE RESUMEN*/
/*Selecciona la cantidad de usuarios por estado*/
SELECT d.estado, COUNT(*) AS cantidad_usuarios FROM domicilio d GROUP BY d.estado ORDER BY cantidad_usuarios DESC;
/*Selecciona los usuarios con mas de un producto en su lista de deseos*/
SELECT u.nombre AS usuario, COUNT(ld.id_prod) AS productos_deseados FROM usuario u INNER JOIN listadeseos ld ON u.id_usuario = ld.id_usuario GROUP BY  u.nombre HAVING  COUNT(ld.id_prod) > 1;
/*Selecciona los metodos de pago y la cantidad de usuarios que lo usan*/
SELECT  p.metodo_pago, COUNT(*) AS cantidad_usos FROM  pagos p GROUP BY p.metodo_pago ORDER BY  cantidad_usos DESC;
/*Selecciona el precio promedio de cada producto de acuerdo a su categoria*/
SELECT p.categoria, AVG(p.precio) AS precio_promedio FROM  productos p GROUP BY  p.categoria HAVING AVG(p.precio) > 90;
