DROP TABLE IF EXISTS "ENTIDAD" CASCADE;
DROP TABLE IF EXISTS "MUNICIPIO" CASCADE;
DROP TABLE IF EXISTS "INEGI" CASCADE;
DROP TABLE IF EXISTS "Genero" CASCADE;
DROP TABLE IF EXISTS "Rango_Edad" CASCADE;
DROP TABLE IF EXISTS "SNIIV" CASCADE;

CREATE TABLE "ENTIDAD" (
    "Clave_Entidad" INT PRIMARY KEY,
    "Entidad_Fed" Varchar
);

CREATE TABLE "MUNICIPIO" (
    "Clave_Municipio" Varchar PRIMARY KEY,
    "Municipio" Varchar,
    "Clave_Entidad" Int,
	FOREIGN KEY ("Clave_Entidad") REFERENCES "ENTIDAD"("Clave_Entidad")
);

CREATE TABLE "INEGI" (
    "Clave_Municipio" Varchar,
    "Pob_Total" Int,
    "Pob_Fem" Int,
    "Pob_Mas" Int,
	FOREIGN KEY ("Clave_Municipio") REFERENCES "MUNICIPIO"("Clave_Municipio")
);

CREATE TABLE "Genero" (
    "ID" Varchar PRIMARY KEY,
    "Genero" Varchar
);

CREATE TABLE "Rango_Edad" (
    "ID" Varchar PRIMARY KEY,
    "Rango" Varchar
);

CREATE TABLE "SNIIV" (
    "Clave_Municipio" Varchar,
    "ID_Genero" Varchar,
    "ID_Rango_Edad" Varchar,
    "Prestamo" Varchar, 
	FOREIGN KEY ("Clave_Municipio") REFERENCES "MUNICIPIO"("Clave_Municipio"), 
	FOREIGN KEY ("ID_Genero") REFERENCES "Genero"("ID"),
	FOREIGN KEY ("ID_Rango_Edad") REFERENCES "Rango_Edad"("ID")
);
