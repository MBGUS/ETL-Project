DROP TABLE IF EXISTS "INEGI";
DROP TABLE IF EXISTS "SNIIV";
DROP TABLE IF EXISTS "ENTIDAD";
DROP TABLE IF EXISTS "MUNICIPIO";
DROP TABLE IF EXISTS "Genero";
DROP TABLE IF EXISTS "Rango_Edad";

CREATE TABLE "INEGI" (
    "Clave_Municipio" Int   NOT NULL,
    "Pob_Total" Int   NOT NULL,
    "Pob_Fem" Int   NOT NULL,
    "Pob_Mas" Int   NOT NULL
);

CREATE TABLE "SNIIV" (
    "Clave_Municipio" Int   NOT NULL,
    "ID_Genero" Int   NOT NULL,
    "ID_Rango_Edad" Int   NOT NULL,
    "Prestamo" Int   NOT NULL
);

CREATE TABLE "ENTIDAD" (
    "Clave_Entidad" Int   NOT NULL,
    "Entidad_Fed" Varchar   NOT NULL,
    CONSTRAINT "pk_ENTIDAD" PRIMARY KEY (
        "Clave_Entidad"
     )
);

CREATE TABLE "MUNICIPIO" (
    "Clave_Municipio" Int   NOT NULL,
    "Munipio" Varchar   NOT NULL,
    "Clave_Entidad" Int   NOT NULL,
    CONSTRAINT "pk_MUNICIPIO" PRIMARY KEY (
        "Clave_Municipio"
     )
);

CREATE TABLE "Genero" (
    "ID" Int   NOT NULL,
    "Genero" Varchar   NOT NULL,
    CONSTRAINT "pk_Genero" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Rango_Edad" (
    "ID" Int   NOT NULL,
    "Rango" Varchar   NOT NULL,
    CONSTRAINT "pk_Rango_Edad" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "INEGI" ADD CONSTRAINT "fk_INEGI_Clave_Municipio" FOREIGN KEY("Clave_Municipio")
REFERENCES "MUNICIPIO" ("Clave_Municipio");

ALTER TABLE "SNIIV" ADD CONSTRAINT "fk_SNIIV_Clave_Municipio" FOREIGN KEY("Clave_Municipio")
REFERENCES "MUNICIPIO" ("Clave_Municipio");

ALTER TABLE "SNIIV" ADD CONSTRAINT "fk_SNIIV_ID_Genero" FOREIGN KEY("ID_Genero")
REFERENCES "Genero" ("ID");

ALTER TABLE "SNIIV" ADD CONSTRAINT "fk_SNIIV_ID_Rango_Edad" FOREIGN KEY("ID_Rango_Edad")
REFERENCES "Rango_Edad" ("ID");

ALTER TABLE "MUNICIPIO" ADD CONSTRAINT "fk_MUNICIPIO_Clave_Entidad" FOREIGN KEY("Clave_Entidad")
REFERENCES "ENTIDAD" ("Clave_Entidad");

