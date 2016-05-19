create schema carKorner;

create table carKorner.car(
carId INTEGER NOT NULL PRIMARY KEY,
carName VARCHAR(100) NOT NULL,
carPrice DECIMAL(10,2) NOT NULL);

create table carKorner.car_model(
carId INTEGER  NOT NULL, 
modelId DECIMAL(10,2) UNIQUE NOT NULL,
modelName VARCHAR(100),
FOREIGN KEY(carId) REFERENCES car(carId));

create table carKorner.model_summary(
modelId DECIMAL(10,2),
length INTEGER,
width INTEGER,
height INTEGER,
seatingCapacity INTEGER,
displacement INTEGER,
fuelType VARCHAR(100),
maxPower VARCHAR(100),
maxTorque VARCHAR(100),
mileage DECIMAL(10,2),
alternateFuel VARCHAR(100),
NoOfGears INTEGER,
driveTrain VARCHAR(100),
airConditioner VARCHAR(100),
powerWindows VARCHAR(100),
centralLocking BOOLEAN,
antiLockBrakingSystem BOOLEAN,
Airbags INTEGER,
seatUpholstery VARCHAR(100),
FOREIGN KEY(modelId) REFERENCES car_model(modelId));

create table carKorner.model_specifications(
modelId DECIMAL(10,2),
wheelBase VARCHAR(100),
groundClearance VARCHAR(100),
kerbWeight VARCHAR(100),
doors VARCHAR(100),
seatingCapacity VARCHAR(100),
noOfSeatingRows VARCHAR(100),
BootSpace VARCHAR(100),
fuelTankCapacity VARCHAR(100),
fuelType VARCHAR(100),
maxTorque VARCHAR(100),
mileage VARCHAR(100),
displacement VARCHAR(100),
maxPower VARCHAR(100),
cylinders VARCHAR(100),
turbochargers BOOLEAN,
turbochargerType BOOLEAN,
valve VARCHAR(100),
noOfGears VARCHAR(20),
transmissionType VARCHAR(20),
driveTrain VARCHAR(50),
dualClutch BOOLEAN,
sportMode BOOLEAN,
drivingModes BOOLEAN,
FOREIGN KEY(modelId) REFERENCES car_Model(modelId));

create table carKorner.model_features(
modelId DECIMAL(10,2),
airbags INTEGER,
dualStageAirbags BOOLEAN,
ABS BOOLEAN,
EBD BOOLEAN,
BA BOOLEAN,
ESP BOOLEAN,
FourWheelDrive BOOLEAN,
HillHoldControl BOOLEAN,
engineImmobilizer BOOLEAN,
centralLocking BOOLEAN,
speedSensorDoorLock BOOLEAN,
childSafetyLock BOOLEAN,
FOREIGN KEY(modelId) REFERENCES car_model(modelId));

create table carKorner.model_colors(
modelId DECIMAL(10,2),
colorName1 VARCHAR(200),
colorName2 VARCHAR(200),
colorName3 VARCHAR(200),
colorName4 VARCHAR(200),
colorName5 VARCHAR(200),
colorName6 VARCHAR(200),
FOREIGN KEY(modelId) REFERENCES car_model(modelId));


create table carKorner.user(
userId INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY NOT NULL,
userName VARCHAR(100),
emailId VARCHAR(100),
contactno INTEGER NOT NULL,
password VARCHAR(200) NOT NULL
);


create table carKorner.buyCar(
userId INTEGER,
carName VARCHAR(100),
minPrice INTEGER,
maxPrice INTEGER,
city VARCHAR(20),
buyerContact INTEGER,
FOREIGN KEY (userId) REFERENCES User(userId));

create table carKorner.usedCar(
userId INTEGER,
usedCarId INTEGER PRIMARY KEY NOT NULL,
carName VARCHAR(100) NOT NULL,
price INTEGER,
color VARCHAR(100),
city VARCHAR(20),
modelYear INTEGER,
FOREIGN KEY(userId) REFERENCES User(userId));
