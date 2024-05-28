CREATE DATABASE bd_donaciones
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_ES.UTF-8'
    LC_CTYPE = 'es_ES.UTF-8'
    TEMPLATE = template0;
	
	CREATE TABLE tb_perfiles(
	id_per SERIAL PRIMARY KEY,
	nombre_per VARCHAR(100) NOT NULL
	);
	
	INSERT INTO tb_perfiles VALUES(1, 'Administrador');
	INSERT INTO tb_perfiles VALUES(2, 'Donador');
	
	CREATE TABLE tb_usuarios (
    id_us SERIAL PRIMARY KEY,
	id_per INTEGER NOT NULL,
	cedula_us VARCHAR(100) NOT NULL,
    nombre_us VARCHAR(100) NOT NULL,
    correo_us VARCHAR(100) UNIQUE NOT NULL,
	username_us VARCHAR(100) UNIQUE NOT NULL,
	password_us VARCHAR(100) NOT NULL,
	CONSTRAINT fk_tb_usuarios FOREIGN KEY (id_per) REFERENCES tb_perfiles(id_per));
	
	INSERT INTO tb_usuarios VALUES(1, 1, '1725578775', 'Mateo Montenegro', 'emontenegro@gmail.com', 'emontenegro', '1234');
	SELECT * FROM tb_usuarios;
	
	