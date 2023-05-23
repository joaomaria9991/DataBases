/* Sistema de Gestão de Reservas de Voos */
-- P4G7, Álvaro Freixo 93116, João Machado 89132


CREATE SCHEMA AulaReservasVoos;
GO

CREATE TABLE AulaReservasVoos.Airport(
	Name				VARCHAR(50) 				NOT NULL,
	City				VARCHAR(20),
	State				VARCHAR(10),
	Airport_code		INT 						PRIMARY KEY 				NOT NULL 				IDENTITY(1,1)
)
GO

CREATE TABLE AulaReservasVoos.AirplaneType(
	Company				VARCHAR(50),
	Max_seats			INT 						NOT NULL 					CHECK(Max_seats > 0),
	TypeName			VARCHAR(20) 				PRIMARY KEY 				NOT NULL
)
GO

CREATE TABLE AulaReservasVoos.CanLand(
	Airport				INT  						NOT NULL,
	AirplaneType		VARCHAR(20) 				NOT NULL,
	
	UNIQUE (Airport),
	UNIQUE (AirplaneType),
	PRIMARY KEY(Airport, AirplaneType)
)
GO

CREATE TABLE AulaReservasVoos.Airplane(
	Airplane_id 		INT 						PRIMARY KEY 				IDENTITY(1,1) 			NOT NULL,
	Total_no_seats 		INT 						NOT NULL 					CHECK(Total_no_seats > 0),
	Type 				VARCHAR(20)  				NOT NULL
)
GO

CREATE TABLE AulaReservasVoos.Flight(
	FlightNumber 		INT 						PRIMARY KEY 				IDENTITY(1,1) 			NOT NULL,
	Airline 			VARCHAR(20),
	Weekdays 			CHAR(7)						NOT NULL 					CHECK( Weekdays IN ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'))				
)
GO

CREATE TABLE AulaReservasVoos.Fare(
	Flight				INT 						NOT NULL,
	Restrictions		VARCHAR(100),
	Amount				INT 						NOT NULL ,
	Code				INT 						NOT NULL 					CHECK(Code >= 0),
	
	UNIQUE (Flight),
	UNIQUE (Code),
	PRIMARY KEY(Flight, Code)
)
GO

CREATE TABLE AulaReservasVoos.FlightLeg(
	FlightNumber				INT 				NOT NULL,
	Leg_no						INT 				NOT NULL 					CHECK(Leg_no >= 0),
	Dep_airport					INT 				NOT NULL,
	Scheduled_dep_time			DATE,
	Arr_airport					INT 				NOT NULL,
	Scheduled_arr_time			DATE,

	UNIQUE (FlightNumber),
	UNIQUE (Leg_no),
	PRIMARY KEY(FlightNumber, Leg_no)
)
GO

CREATE TABLE AulaReservasVoos.LegInstance(
	No_available_seats			INT 				NOT NULL				CHECK(No_available_seats >= 0), 
	DateLegInst					DATE 				NOT NULL,
	Flight_legs					INT 				NOT NULL,
	Flight_legs_no				INT  				NOT NULL,
	Assigned_airplane			INT 				NOT NULL,
	Dep_airport					INT 				NOT NULL,
	Dep_time					TIME 				NOT NULL,
	Arr_aiport					INT 				NOT NULL,
	Arr_time					TIME 				NOT NULL,
	
	UNIQUE (DateLegInst),
	UNIQUE (Flight_legs),
	UNIQUE (Flight_legs_no),
	PRIMARY KEY(DateLegInst, Flight_legs, Flight_legs_no)
)
GO

CREATE TABLE AulaReservasVoos.Seat(
	Flight_legs					INT 				NOT NULL,
	Leg_date					DATE 				NOT NULL,
	Flight_legs_no				INT 				NOT NULL,
	NumSeat						INT 				NOT NULL,
	Costumer_name				VARCHAR(MAX),
	Cphone						INT 				NOT NULL 				CHECK( Cphone BETWEEN 100000000 AND 999999999 ),		
	
	UNIQUE (Flight_legs),
	UNIQUE (Leg_date),
	UNIQUE (Flight_legs_no),
	UNIQUE (NumSeat),
	PRIMARY KEY(Leg_date, Flight_legs, Flight_legs_no, NumSeat)
)
GO



ALTER TABLE AulaReservasVoos.CanLand ADD
		FOREIGN KEY (Airport) REFERENCES AulaReservasVoos.Airport(Airport_code),
		FOREIGN KEY (AirplaneType) REFERENCES AulaReservasVoos.AirplaneType(TypeName)
GO

ALTER TABLE AulaReservasVoos.Airplane ADD
		FOREIGN KEY (Type) REFERENCES AulaReservasVoos.AirplaneType(TypeName)
GO

ALTER TABLE AulaReservasVoos.Fare ADD
		FOREIGN KEY (Flight) REFERENCES AulaReservasVoos.Flight(FlightNumber)
GO

ALTER TABLE AulaReservasVoos.FlightLeg ADD
		FOREIGN KEY (FlightNumber) REFERENCES AulaReservasVoos.Flight(FlightNumber),
		FOREIGN KEY (Dep_airport) REFERENCES AulaReservasVoos.Airport(Airport_code),
		FOREIGN KEY (Arr_airport) REFERENCES AulaReservasVoos.Airport(Airport_code)
GO

ALTER TABLE AulaReservasVoos.LegInstance ADD
		FOREIGN KEY (Assigned_airplane) REFERENCES AulaReservasVoos.Airplane(Airplane_id),
		FOREIGN KEY (Dep_airport) REFERENCES AulaReservasVoos.Airport(Airport_code),
		FOREIGN KEY (Arr_aiport) REFERENCES AulaReservasVoos.Airport(Airport_code),
		FOREIGN KEY (Flight_legs) REFERENCES AulaReservasVoos.FlightLeg(FlightNumber),
		FOREIGN KEY (Flight_legs_no) REFERENCES AulaReservasVoos.FlightLeg(Leg_no)
GO

ALTER TABLE AulaReservasVoos.Seat ADD
		FOREIGN KEY (Flight_legs) REFERENCES AulaReservasVoos.LegInstance(Flight_legs),
		FOREIGN KEY (Leg_date) REFERENCES AulaReservasVoos.LegInstance(DateLegInst),
		FOREIGN KEY (Flight_legs_no) REFERENCES AulaReservasVoos.LegInstance(Flight_legs_no)	
GO