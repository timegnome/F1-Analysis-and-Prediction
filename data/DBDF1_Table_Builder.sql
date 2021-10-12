-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "LapTimes" (
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "lap" int   NOT NULL,
    "position" int   NOT NULL,
    "time" varchar(15)   NOT NULL,
    "milliseconds" long   NOT NULL
);

CREATE TABLE "PitStops" (
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "stop" int   NOT NULL,
    "lap" int   NOT NULL,
    "time" varchar(15)   NOT NULL,
    "duration" float   NOT NULL,
    "milliseconds" long   NOT NULL
);

CREATE TABLE "Qualifying" (
    "qualifyId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int   NOT NULL,
    "position" int   NOT NULL,
    "q1" varchar(15)   NOT NULL,
    "q2" varchar(15)   NOT NULL,
    "q3" varchar(15)   NOT NULL,
    CONSTRAINT "pk_Qualifying" PRIMARY KEY (
        "qualifyId"
     )
);

CREATE TABLE "Races" (
    "raceId" int   NOT NULL,
    "year" int   NOT NULL,
    "round" int   NOT NULL,
    "circuitId" int   NOT NULL,
    "name" varchar(35)   NOT NULL,
    "date" varchar(15)   NOT NULL,
    "time" varchar(15)   NOT NULL,
    "url" varchar(80)   NOT NULL,
    CONSTRAINT "pk_Races" PRIMARY KEY (
        "raceId"
     )
);

CREATE TABLE "Results" (
    "resultId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "constructorId" int   NOT NULL,
    "number" int   NOT NULL,
    "grid" int   NOT NULL,
    "position" varchar(5)   NOT NULL,
    "positionText" varchar(5)   NOT NULL,
    "positionOrder" int   NOT NULL,
    "points" int   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "resultId"
     )
);

CREATE TABLE "Seasons" (
    "year" int   NOT NULL,
    "url" varchar(80)   NOT NULL
);

CREATE TABLE "Status" (
    "statusId" int   NOT NULL,
    "status" varchar(30)   NOT NULL
);

CREATE TABLE "Drivers" (
    "driverId" int   NOT NULL,
    "driverRef" varchar(25)   NOT NULL,
    "number" varchar(3)   NOT NULL,
    "code" varchar(3)   NOT NULL,
    "forname" varchar(30)   NOT NULL,
    "surname" varchar(30)   NOT NULL,
    "dob" varchar(12)   NOT NULL,
    "nationality" varchar(30)   NOT NULL,
    "url" varchar(80)   NOT NULL,
    CONSTRAINT "pk_Drivers" PRIMARY KEY (
        "driverId"
     ),
    CONSTRAINT "uc_Drivers_driverRef" UNIQUE (
        "driverRef"
    )
);

CREATE TABLE "DriverStandings" (
    "driverStandingsId" int   NOT NULL,
    "raceId" int   NOT NULL,
    "driverId" int   NOT NULL,
    "points" int   NOT NULL,
    "position" int   NOT NULL,
    "positionText" varchar(5)   NOT NULL,
    "wins" int   NOT NULL,
    CONSTRAINT "pk_DriverStandings" PRIMARY KEY (
        "driverStandingsId"
     )
);

CREATE TABLE "Constructors" (
    "constructorId" int   NOT NULL,
    "constructorRef" varchar(50)   NOT NULL,
    "name" varcahr(50)   NOT NULL,
    "nationality" varchar(50)   NOT NULL,
    "url" varchar(80)   NOT NULL,

    CONSTRAINT "uc_Constructors_constructorRef" UNIQUE (
        "constructorRef"
    )
);


ALTER TABLE "LapTimes" ADD CONSTRAINT "fk_LapTimes_raceId" FOREIGN KEY("raceId")
REFERENCES "Races" ("raceId");

ALTER TABLE "LapTimes" ADD CONSTRAINT "fk_LapTimes_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "PitStops" ADD CONSTRAINT "fk_PitStops_raceId" FOREIGN KEY("raceId")
REFERENCES "Races" ("raceId");

ALTER TABLE "PitStops" ADD CONSTRAINT "fk_PitStops_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying_raceId" FOREIGN KEY("raceId")
REFERENCES "Races" ("raceId");

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Qualifying" ADD CONSTRAINT "fk_Qualifying_constructorId" FOREIGN KEY("constructorId")
REFERENCES "Constructors" ("constructorId");

ALTER TABLE "Races" ADD CONSTRAINT "fk_Races_circuitId" FOREIGN KEY("circuitId")
REFERENCES "Table 11" ("...");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_raceId" FOREIGN KEY("raceId")
REFERENCES "Races" ("raceId");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_constructorId" FOREIGN KEY("constructorId")
REFERENCES "Constructors" ("constructorId");

ALTER TABLE "DriverStandings" ADD CONSTRAINT "fk_DriverStandings_raceId" FOREIGN KEY("raceId")
REFERENCES "Races" ("raceId");

ALTER TABLE "DriverStandings" ADD CONSTRAINT "fk_DriverStandings_driverId" FOREIGN KEY("driverId")
REFERENCES "Drivers" ("driverId");



