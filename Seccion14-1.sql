--Creacion de restricciones
CREATE TABLE clients 
(
    client_number NUMERIC(4) CONSTRAINT clients_client_num_pk PRIMARY KEY,
    first_name VARCHAR(14),
    last_name VARCHAR(13)
);

CREATE TABLE clients2
(
    client_number NUMERIC(4) CONSTRAINT clients_client_num_pk2 PRIMARY KEY,
    last_name VARCHAR(13) CONSTRAINT clients_last_name_nn NOT NULL,
    email VARCHAR(80) CONSTRAINT clients_email_uk UNIQUE
);

CREATE TABLE clients3 
(
    client_number NUMERIC(4) CONSTRAINT clients_client_num_pk3 PRIMARY KEY,
    last_name VARCHAR(13) NOT NULL,
    email VARCHAR(80)
);

CREATE TABLE clients4 
(
    client_number NUMERIC(6) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    phone VARCHAR(10) NOT NULL,
    email VARCHAR(20),
    CONSTRAINT clients_phone_email_uk UNIQUE (email, phone)
);

CREATE TABLE clients5 
(
    client_number NUMERIC(6),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(10) NOT NULL,
    CONSTRAINT clients_client_num_pk4 PRIMARY KEY (client_number),
    CONSTRAINT phone_email_uk UNIQUE (email, phone)
);

INSERT INTO clients5 (client_number, first_name, last_name, phone, email)
VALUES (7234, 'Lonny', 'Vigil', '4072220091', 'lbv@mp.net');