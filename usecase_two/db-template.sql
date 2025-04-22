-- Crear la base de datos  
CREATE DATABASE IoTData;  
GO  
  
-- Usar la base de datos  
USE IoTData;  
GO  
  
-- Crear la tabla IoTTemperatureData  
CREATE TABLE IoTTemperatureData (  
    recordId INT IDENTITY(1,1) PRIMARY KEY,  
    deviceId NVARCHAR(50) NOT NULL,  
    temperature FLOAT NOT NULL,  
    timestamp DATETIME NOT NULL  
);  
GO  
  
-- Insertar datos iniciales en la tabla IoTTemperatureData  
INSERT INTO IoTTemperatureData (deviceId, temperature, timestamp) VALUES  
('device001', 22.5, '2025-04-01 10:00:00'),  
('device002', 23.1, '2025-04-01 10:05:00'),  
('device003', 21.8, '2025-04-01 10:10:00'),  
('device001', 22.7, '2025-04-01 10:15:00'),  
('device002', 23.3, '2025-04-01 10:20:00'),  
('device003', 21.9, '2025-04-01 10:25:00'),  
('device001', 22.6, '2025-04-01 10:30:00'),  
('device002', 23.0, '2025-04-01 10:35:00'),  
('device003', 21.7, '2025-04-01 10:40:00'),  
('device001', 22.8, '2025-04-01 10:45:00');  
GO  
  
-- Insertar 60 registros adicionales con la hora y segundo actuales
DECLARE @startTime DATETIME = GETDATE();  
DECLARE @counter INT = 1;  

WHILE @counter <= 60  
BEGIN  
    INSERT INTO IoTTemperatureData (deviceId, temperature, timestamp)  
    VALUES  
    ('device001', 20.0 + RAND() * 5, DATEADD(SECOND, @counter - 1, @startTime));  
    SET @counter = @counter + 1;  
END;  
GO
  
-- Consultar los datos de la tabla IoTTemperatureData  
SELECT * FROM IoTTemperatureData;  
GO