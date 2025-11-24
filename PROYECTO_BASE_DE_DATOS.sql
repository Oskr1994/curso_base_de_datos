CREATE TABLE Usuarios (
ID_Usuario INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
Apellido VARCHAR(50),
Contrasena VARCHAR(50) NOT NULL,
Rol VARCHAR(10) NOT NULL,
CONSTRAINT CK_Usuarios_Rol CHECK (Rol IN ('Admin', 'Gerente','Supervisor', 'Tecnico'))
);

CREATE TABLE Proyectos (
ID_proyecto INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
ID_Supervisor INT NOT NULL,
CONSTRAINT FK_Usuario_supervisor
FOREIGN KEY (ID_Supervisor) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Sedes (
ID_Sede INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
Provincia VARCHAR(50),
Distrito VARCHAR(50),
Calle VARCHAR(50),
ID_proyecto INT NOT NULL,
CONSTRAINT FK_Sede_proyecto
FOREIGN KEY (ID_proyecto) REFERENCES Proyectos(ID_proyecto)
);

CREATE TABLE Actividades (
ID_Actividad INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50),
Descripcion VARCHAR(100),
Comentarios VARCHAR(100),
Estado VARCHAR(15) NOT NULL,
CONSTRAINT CK_Actividad_estado CHECK (Estado IN ('Pendiente', 'En proceso', 'Terminado')),
ID_tecnico INT NOT NULL,
CONSTRAINT FK_Actividad_tecnico
FOREIGN KEY (ID_tecnico) REFERENCES Usuarios(ID_Usuario),
ID_Sede INT NULL,
CONSTRAINT FK_Actividad_Sede FOREIGN KEY (ID_Sede) REFERENCES Sedes(ID_Sede)
);
