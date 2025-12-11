CREATE TABLE HAZARD_TYPE (
    Hazard_Type_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL CHECK (Category IN ('Geological','Hydrometeorological','Climatological','Meteorological'))
);

CREATE TABLE REGION (
    Region_ID INT PRIMARY KEY,
    Region_Name VARCHAR(50) NOT NULL,
    Poverty_Rate DECIMAL(4,1) NOT NULL CHECK (Poverty_Rate >= 0 AND Poverty_Rate <= 100)
);

CREATE TABLE MUNICIPALITY (
    Municipality_ID INT PRIMARY KEY,
    Region_ID INT NOT NULL,
    Municipality_Name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Region_ID) REFERENCES REGION(Region_ID)
);

CREATE TABLE BARANGAY (
    Barangay_ID INT PRIMARY KEY,
    Municipality_ID INT NOT NULL,
    Barangay_Name VARCHAR(50) NOT NULL,
    FOREIGN KEY (Municipality_ID) REFERENCES MUNICIPALITY(Municipality_ID)
);

CREATE TABLE DISASTER_EVENT (
    Event_ID INT PRIMARY KEY,
    Hazard_Type_ID INT NOT NULL,
    Barangay_ID INT NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Severity_Scale INT NOT NULL CHECK (Severity_Scale BETWEEN 1 AND 10),
    Description VARCHAR(255),
    FOREIGN KEY (Hazard_Type_ID) REFERENCES HAZARD_TYPE(Hazard_Type_ID),
    FOREIGN KEY (Barangay_ID) REFERENCES BARANGAY(Barangay_ID),
);

CREATE TABLE POPULATION_SEGMENT (
    Segment_ID INT PRIMARY KEY,
    Barangay_ID INT NOT NULL,
    Description VARCHAR(100),
    Total_Count INT NOT NULL CHECK (Total_Count >= 0),
    Vulnerability_Index INT NOT NULL CHECK (Vulnerability_Index BETWEEN 1 AND 5),
    Evacuation_Status VARCHAR(20) NOT NULL CHECK (Evacuation_Status IN ('Safe','At Risk','Evacuated')),
    FOREIGN KEY (Barangay_ID) REFERENCES BARANGAY(Barangay_ID)
);

CREATE TABLE HUMAN_IMPACT (
    Human_Impact_ID INT PRIMARY KEY,
    Event_ID INT NOT NULL,
    Segment_ID INT NOT NULL,
    Deaths_Count INT NOT NULL CHECK (Deaths_Count >= 0),
    Injuries_Count INT NOT NULL CHECK (Injuries_Count >= 0),
    People_Affected_Count INT NOT NULL CHECK (People_Affected_Count >= 0),
    FOREIGN KEY (Event_ID) REFERENCES DISASTER_EVENT(Event_ID),
    FOREIGN KEY (Segment_ID) REFERENCES POPULATION_SEGMENT(Segment_ID)
);

CREATE TABLE ASSET (
    Asset_ID INT PRIMARY KEY,
    Barangay_ID INT NOT NULL,
    Asset_Type VARCHAR(50) NOT NULL,
    Pre_Disaster_Value DECIMAL(15,2) NOT NULL CHECK (Pre_Disaster_Value >= 0),
    Coordinates VARCHAR(50),
    FOREIGN KEY (Barangay_ID) REFERENCES BARANGAY(Barangay_ID)
);

CREATE TABLE IMPACTED_ASSET (
    Impact_Asset_ID INT PRIMARY KEY,
    Event_ID INT NOT NULL,
    Asset_ID INT NOT NULL,
    Damage_Level VARCHAR(20) NOT NULL CHECK (Damage_Level IN ('Minor','Moderate','Severe','Destroyed')),
    Estimated_Loss_Value DECIMAL(15,2) NOT NULL CHECK (Estimated_Loss_Value >= 0),
    FOREIGN KEY (Event_ID) REFERENCES DISASTER_EVENT(Event_ID),
    FOREIGN KEY (Asset_ID) REFERENCES ASSET(Asset_ID)
);
