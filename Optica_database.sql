INSERT INTO SUPPLIER VALUES ('00000000-X', 'PERICO DE LOS PALORES GUTIERREZ', 'C/ NARANJO', '18', 'PRIMERO', 'SEGUNDA', 'ALICANTE', 03600, 'ESPAÑA', 600000000, 96000000);
INSERT INTO SUPPLIER VALUES ('00000001-J', 'TOMÁS FERRER', 'C/ TUPRI', '45', 'CUARTO', 'PRIMERA', 'BARCELONA', 08950, 'ESPAÑA', 600000001, 93000000);

INSERT INTO BRAND VALUES (1, '00000000-X');
INSERT INTO BRAND VALUES (2, '00000000-X');
INSERT INTO BRAND VALUES (3, '00000000-X');
INSERT INTO BRAND VALUES (4, '00000001-J');
INSERT INTO BRAND VALUES (5, '00000000-X');
INSERT INTO BRAND VALUES (6, '00000001-J');
INSERT INTO BRAND VALUES (7, '00000001-J');

INSERT INTO GLASSES VALUES (1, 7, 'RAYBAN', 0.25, 'PASTA', 'ROJO', 'NEGRO', 189.10, NULL);
INSERT INTO GLASSES VALUES (2, 4, 'RAYBAN', 0, 'PASTA', 'ROJO', 'NEGRO', 150.45, NULL);
INSERT INTO GLASSES VALUES (3, 4, 'RAYBAN', 1.3, 'PASTA', 'ROJO', 'NEGRO', 200.45, NULL);
INSERT INTO GLASSES VALUES (4, 1, 'RAYBAN', 1.25, 'PASTA', 'ROJO', 'NEGRO', 150.45, NULL);
INSERT INTO GLASSES VALUES (5, 3, 'RAYBAN', 0.2, 'PASTA', 'ROJO', 'NEGRO', 300.15, NULL);

INSERT INTO CUSTOMER VALUES (1, 'Antonio García Rojo', 'C/ La licha 10', 935632547, ' ', '2020-01-01', NULL);
INSERT INTO CUSTOMER VALUES (2, 'Luis Martinez', 'C/ Tuk 1', 935635447, ' ', '2020-03-01', 1);

INSERT INTO SELLER VALUES (1, 'Miguel Salcedo');
INSERT INTO SELLER VALUES (2, 'Anna Del Pi');
INSERT INTO SELLER VALUES (3, 'Rita Lacantaora');

INSERT INTO INVOICE VALUES (1, 1, 1);
INSERT INTO INVOICE VALUES (2, 3, 1);
INSERT INTO INVOICE VALUES (3, 2, 2);

SELECT * FROM SUPPLIER;
SELECT * FROM BRAND;
SELECT * FROM GLASSES;
SELECT * FROM CUSTOMER;
SELECT * FROM SELLER;
SELECT * FROM INVOICE;
