
SET datestyle = "ISO, DMY";

CREATE TABLE Emp (
  CodEmp INTEGER NOT NULL,
  CodEmpGerente INTEGER,
  CodDepto INTEGER not null,
  NmEmp VARCHAR(30) NOT NULL,
  SnEmp VARCHAR(40) NOT NULL,
  DtNasc DATE NOT NULL,
  Ender VARCHAR(255) NOT NULL,
  CodSexo CHAR(1) NOT NULL,
  VlSalario REAL NOT NULL,
  constraint PK_emp PRIMARY KEY(CodEmp)
);


CREATE TABLE Depto (
  CodDepto INTEGER NOT NULL,
  CodEmpResponsavel INTEGER,
  NmDepto VARCHAR(45) NOT NULL,
  NmLocalizacao VARCHAR(45) NOT NULL,
  constraint PK_Depto PRIMARY KEY(CodDepto),
  constraint FK_DEPTO FOREIGN KEY(CodEmpResponsavel)
    REFERENCES Emp(CodEmp)
);


alter table Emp add
  constraint FK_EMP FOREIGN KEY(CodDepto)
    REFERENCES Depto(CodDepto);

alter table Emp add
  constraint FK_EMP_GER FOREIGN KEY(CodEmpGerente)
    REFERENCES Emp(CodEmp);


CREATE TABLE Depte (
  NroSequencia INTEGER NOT NULL,
  CodEmp INTEGER NOT NULL,
  NmDepte VARCHAR(100) NOT NULL,
  TpParentesco VARCHAR(25) not NULL,
  DtNasc date not NULL,
  CodSexo CHAR(1) not NULL CHECK (codsexo in ('m', 'f')),
  constraint PK_Depte PRIMARY KEY(NroSequencia, CodEmp),
  constraint FK_depte FOREIGN KEY(CodEmp) REFERENCES Emp(CodEmp)
);


CREATE TABLE Proj (
  CodProj INTEGER NOT NULL,
  CodDepto INTEGER NOT NULL,
  NmProj VARCHAR(60) NOT NULL,
  NmLocal VARCHAR(45) NOT NULL,
  constraint PK_Proj PRIMARY KEY(CodProj),
  constraint FK_PROJ FOREIGN KEY(CodDepto) REFERENCES Depto(CodDepto)
);


CREATE TABLE Alocado (
  CodProj INTEGER NOT NULL,
  CodEmp INTEGER NOT NULL,
  QtHoras INTEGER NOT NULL,
  constraint PK_Alocado PRIMARY KEY(CodProj, CodEmp),
  constraint FK_Alocado_Proj FOREIGN KEY(CodProj) REFERENCES Proj(CodProj),
  constraint FK_alocado_Emp FOREIGN KEY(CodEmp) REFERENCES Emp(CodEmp)
);



CREATE TABLE Consult (
  CodConsult INTEGER NOT NULL,
  CodDepto INTEGER NOT NULL,
  NmConsult VARCHAR(30) NOT NULL,
  SnConsult VARCHAR(40) NOT NULL,
  VlSalHora real,
  constraint PK_Conult PRIMARY KEY(CodConsult),
  constraint FK_Consult FOREIGN KEY(CodDepto) REFERENCES Depto(CodDepto)
);


insert into depto values (1, null, 'pesquisa', 'sao paulo'); 
insert into depto values (2, null, 'administracao', 'campinas');
insert into depto values (3, null, 'financeiro', 'campinas');


insert into proj values (1, 2, 'reengenharia', 'SP');
insert into proj values (2, 1, 'produto X', 'SP');
insert into proj values (3, 2, 'reengenharia', 'MG'); 
insert into proj values (4, 1, 'produto Y', 'SP'); 
insert into proj values (5, 3, 'automatizacao', 'SP');


insert into consult values (1, 2, 'Carlos', 'Figueroa', 32); 
insert into consult values (2, 2, 'Sebastiao', 'Sa', null); 
insert into consult values (3, 2, 'Cristina', 'Fernandes', 28); 
insert into consult values (4, 3, 'Humberto', 'Osvaldo', 31); 
insert into consult values (5, 3, 'Gustavo', 'Bianco', null); 
insert into consult values (6, 3, 'Paula', 'Gilt', 41); 
insert into consult values (7, 3, 'Fernanda', 'Dantas', null); 
insert into consult values (8, 2, 'Francisca', 'da Silva', 33);


insert into emp values (55, null, 2, 'PAulo', 'Shazan', '19/04/1952', 'R. Prof. Castilho, 2003', 'M', 21000); 
insert into emp values (39, 55, 2, 'Ana', 'Paula', '19/01/1976', 'R. Prof. Isídio Cunha, 1', 'F', 4000); 
insert into emp values (29, 55, 3, 'Tereza', 'Kohn', '22/06/1963', 'R. Prof. Mario Sá, 198', 'F', 7500); 
insert into emp values (13, 55, 1, 'Gilberto', 'Vurg', '22/01/1960', 'R. Prof. Faustino, 111', 'M', 8000); 
insert into emp values (17, 29, 3, 'Daniela', 'Smith', '12/07/1980', 'Av. Ibirapuera, 1200', 'F', 2600); 
insert into emp values (16, 29, 3, 'Fabiana', 'Schultz', '30/03/1977', 'Av. Ibirapuera, 91', 'F', 4500); 
insert into emp values (2, 13, 1, 'Mariana', 'Campos', '22/05/1973', 'R. Cerro Cora, 190', 'F', 4500); 
insert into emp values (1, 13, 1, 'Jose', 'Santos', '06/10/1961', 'R. Prof. Sebastiao, 15', 'M', 5000);


insert into alocado values (2, 13, 80); 
insert into alocado values (2, 1, 135); 
insert into alocado values (4, 13, 60); 
insert into alocado values (4, 2, 160); 
insert into alocado values (4, 1, 50); 
insert into alocado values (1, 55, 40); 
insert into alocado values (1, 39, 165); 
insert into alocado values (1, 13, 25); 
insert into alocado values (3, 55, 30); 
insert into alocado values (4, 29, 15); 
insert into alocado values (5, 29, 70); 
insert into alocado values (5, 16, 160); 
insert into alocado values (5, 17, 125); 
insert into alocado values (3, 17, 40);

update depto set codempresponsavel = 13 where coddepto = 1; 
update depto set codempresponsavel = 55 where coddepto = 2; 
update depto set codempresponsavel = 29 where coddepto = 3; 

insert into depte values (1, 1, 'Ramiro Santos', 'filho', '22/01/1988', 'm'); 
insert into depte values (2, 1, 'Samuel Santos', 'filho', '09/01/1990', 'm'); 
insert into depte values (3, 13, 'Carla Vurg', 'esposa', '09/09/1961', 'f'); 
insert into depte values (4, 29, 'Gabriela Kohn', 'filha', '02/11/1982', 'f'); 
insert into depte values (5, 29, 'Ricardo Kohn', 'filho', '01/02/1980', 'm');