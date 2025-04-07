-- Crear la base de datos  
CREATE DATABASE EventManagement;  
GO  
  
-- Usar la base de datos  
USE EventManagement;  
GO  
  
-- Crear la tabla Events  
CREATE TABLE Events (  
    eventId NVARCHAR(10) PRIMARY KEY,  
    name NVARCHAR(100) NOT NULL,  
    expectedAttendees INT NOT NULL,  
    eventDate DATE NOT NULL  
);  
  
-- Crear la tabla Rooms  
CREATE TABLE Rooms (  
    roomId NVARCHAR(10) PRIMARY KEY,  
    name NVARCHAR(100) NOT NULL,  
    capacity INT NOT NULL  
);  
  
-- Crear la tabla Hosted_In  
CREATE TABLE Hosted_In (  
    eventId NVARCHAR(10),  
    roomId NVARCHAR(10),  
    PRIMARY KEY (eventId, roomId),  
    FOREIGN KEY (eventId) REFERENCES Events(eventId),  
    FOREIGN KEY (roomId) REFERENCES Rooms(roomId)  
);  
  
-- Insertar datos en la tabla Events  
INSERT INTO Events (eventId, name, expectedAttendees, eventDate) VALUES  
('ev001', 'Tech Conference 2023', 150, '2023-11-10'),  
('ev002', 'Annual Gala', 80, '2023-12-05'),  
('ev003', 'Startup Pitch Night', 120, '2023-12-15');  
  
-- Insertar datos en la tabla Rooms  
INSERT INTO Rooms (roomId, name, capacity) VALUES  
('rm101', 'Main Hall', 200),  
('rm102', 'Conference Room A', 100),  
('rm103', 'Banquet Hall', 150);  
  
-- Insertar datos en la tabla Hosted_In  
INSERT INTO Hosted_In (eventId, roomId) VALUES  
('ev001', 'rm101'),  
('ev002', 'rm103'),  
('ev003', 'rm102');  
  
-- Crear índices para mejorar el rendimiento de consultas comunes  
CREATE INDEX IDX_Events_Date ON Events(eventDate);  
CREATE INDEX IDX_Rooms_Capacity ON Rooms(capacity);  
GO  

-- Selecciona información del evento y la sala en la que se lleva a cabo  
SELECT   
    e.eventId, 
    e.name AS eventName,
    e.expectedAttendees,
    e.eventDate,
    r.roomId,
    r.name AS roomName,
    r.capacity
FROM   
    Events e  
JOIN   
    Hosted_In h ON e.eventId = h.eventId 
JOIN   
    Rooms r ON h.roomId = r.roomId;
GO

-- Selecciona información sobre las salas y los eventos programados en ellas  
SELECT   
    r.roomId,
    r.name AS roomName,
    e.eventId,
    e.name AS eventName,
    e.eventDate
FROM   
    Rooms r  
JOIN   
    Hosted_In h ON r.roomId = h.roomId
JOIN   
    Events e ON h.eventId = e.eventId;
GO

-- Insertar un nuevo evento 
INSERT INTO Events (eventId, name, expectedAttendees, eventDate) VALUES ('ev004', 'Drasi Conf 2025', 120, '2025-04-05');  
GO
INSERT INTO Events (eventId, name, expectedAttendees, eventDate) VALUES ('ev005', 'Dapr Conf 2025', 120, '2025-04-08');  
GO