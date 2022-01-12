/********************************************************
* Creates the startup_info database and the mega tables.
*
* Author: Sarah Zhang
* Date Created: 11/1/21
* Date Updated: 12/6/21
*********************************************************/


DROP DATABASE IF EXISTS startup_info;
CREATE DATABASE IF NOT EXISTS startup_info;
USE startup_info;


DROP TABLE IF EXISTS acquisitions;
CREATE TABLE IF NOT EXISTS acquisitions (
    id SMALLINT,
    acquisition_id SMALLINT,
    acquiring_object_id CHAR(10),
    acquired_object_id CHAR(10),
    term_code CHAR(16),
    price_amount DECIMAL(14,1),
    price_currency_code CHAR(4),
    acquired_at CHAR(10),
    source_url VARCHAR(255),
    source_description TEXT(300),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS degrees;
CREATE TABLE IF NOT EXISTS degrees (
    id MEDIUMINT,
    object_id CHAR(10),
    degree_type CHAR(40),
    subject TEXT(300),
    institution CHAR(80),
    graduated_at CHAR(10),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS funding_rounds;
CREATE TABLE IF NOT EXISTS funding_rounds (
    id MEDIUMINT,
    funding_round_id MEDIUMINT,
    object_id CHAR(10),
    funded_at CHAR(20),
    funding_round_type CHAR(20),
    funding_round_code CHAR(20),
    raised_amount_usd DECIMAL(11,1),
    raised_amount DECIMAL(11,1),
    raised_currency_code CHAR(4),
    pre_money_valuation_usd DECIMAL(12,1),
    pre_money_valuation DECIMAL(12,1),
    pre_money_currency_code CHAR(4),
    post_money_valuation_usd DECIMAL(12,1),
    post_money_valuation DECIMAL(12,1),
    post_money_currency_code CHAR(4),
    participants TINYINT,
    is_first_round TINYINT(1),
    is_last_round TINYINT(1),
    source_url VARCHAR(255),
    source_description TEXT(300),
    created_by CHAR(40),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS funds;
CREATE TABLE IF NOT EXISTS funds (
    id SMALLINT,
    fund_id SMALLINT,
    object_id CHAR(10),
    name VARCHAR(200),
    funded_at CHAR(10),
    raised_amount DECIMAL(12,1),
    raised_currency_code CHAR(4),
    source_url VARCHAR(255),
    source_description VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS investments;
CREATE TABLE IF NOT EXISTS investments (
    id MEDIUMINT,
    funding_round_id MEDIUMINT,
    funded_object_id CHAR(10),
    investor_object_id CHAR(10),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS ipos;
CREATE TABLE IF NOT EXISTS ipos (
    id SMALLINT,
    ipo_id SMALLINT,
    object_id CHAR(10),
    valuation_amount DECIMAL(13,1),
    valuation_currency_code CHAR(4),
    raised_amount DECIMAL(12,1),
    raised_currency_code CHAR(4),
    public_at CHAR(10),
    stock_symbol CHAR(30),
    source_url VARCHAR(255),
    source_description VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS milestones;
CREATE TABLE IF NOT EXISTS milestones (
    id MEDIUMINT,
    object_id CHAR(10),
    milestone_at DATE,
    milestone_code CHAR(10),
    description TEXT(300),
    source_url VARCHAR(255),
    source_description TEXT(300),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects;
CREATE TABLE IF NOT EXISTS objects (
    id CHAR(10),
    entity_type CHAR(20),
    entity_id MEDIUMINT,
    parent_id CHAR(10),
    name TEXT(300),
    normalized_name TEXT(300),
    permalink VARCHAR(255),
    category_code CHAR(20),
    status CHAR(20),
    founded_at CHAR(10),
    closed_at CHAR(10),
    domain CHAR(100),
    homepage_url CHAR(100),
    twitter_username CHAR(50),
    logo_url VARCHAR(255),
    logo_width SMALLINT,
    logo_height SMALLINT,
    short_description VARCHAR(255),
    description VARCHAR(255),
    overview TEXT(300),
    tag_list VARCHAR(255),
    country_code CHAR(10),
    state_code CHAR(2),
    city CHAR(100),
    region CHAR(50),
    first_investment_at CHAR(10),
    last_investment_at CHAR(10),
    investment_rounds SMALLINT,
    invested_companies SMALLINT,
    first_funding_at CHAR(20),
    last_funding_at CHAR(20),
    funding_rounds TINYINT,
    funding_total_usd DECIMAL(11,1),
    first_milestone_at CHAR(10),
    last_milestone_at CHAR(10),
    milestones TINYINT,
    relationships SMALLINT,
    created_by CHAR(40),
    created_at CHAR(20),
    updated_at DATETIME
) ENGINE=InnoDB;

DROP TABLE IF EXISTS offices;
CREATE TABLE IF NOT EXISTS offices (
    id MEDIUMINT,
    object_id CHAR(10),
    office_id MEDIUMINT,
    description VARCHAR(255),
    region CHAR(50),
    address1 TEXT(300),
    address2 VARCHAR(255),
    city VARCHAR(255),
    zip_code CHAR(50),
    state_code CHAR(2),
    country_code CHAR(4),
    latitude FLOAT(20),
    longitude FLOAT(20),
    created_at CHAR(20),
    updated_at CHAR(20)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people (
    id MEDIUMINT,
    object_id CHAR(10),
    first_name CHAR(100),
    last_name VARCHAR(255),
    birthplace VARCHAR(255),
    affiliation_name VARCHAR(255)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS relationships;
CREATE TABLE IF NOT EXISTS relationships (
    id MEDIUMINT,
    relationship_id MEDIUMINT,
    person_object_id CHAR(10),
    relationship_object_id CHAR(10),
    start_at CHAR(10),
    end_at CHAR(10),
    is_past TINYINT(1),
    sequence MEDIUMINT,
    title TEXT(300),
    created_at DATETIME,
    updated_at DATETIME
) ENGINE=InnoDB;


/***********************************
*  Data insertion
************************************/
LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/acquisitions.csv'
    INTO TABLE acquisitions
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/degrees.csv'
    INTO TABLE degrees
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/funding_rounds.csv'
    INTO TABLE funding_rounds
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/funds.csv'
    INTO TABLE funds
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/investments.csv'
    INTO TABLE investments
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/ipos.csv'
    INTO TABLE ipos
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/milestones.csv'
    INTO TABLE milestones
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/objects_new.csv'
    INTO TABLE objects
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/offices.csv'
    INTO TABLE offices
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/people.csv'
    INTO TABLE people
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;

LOAD DATA
    LOCAL INFILE 'C:/Users/ethan/OneDrive - Vanderbilt/Documents/3rd Year Sem 1/CS 3265 Database Management/Project 2/Tables/relationships.csv'
    INTO TABLE relationships
    FIELDS
        TERMINATED BY ','
        ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES;


/***********************************
*  Create normalized tables
************************************/
DROP TABLE IF EXISTS acquisitions_info;
CREATE TABLE IF NOT EXISTS acquisitions_info (
    id SMALLINT AUTO_INCREMENT,
    acquisition_id SMALLINT UNIQUE,
    acquiring_object_id CHAR(10) NOT NULL,
    acquired_object_id CHAR(10),
    term_code CHAR(16),
    price_amount DECIMAL(14,1),
    price_currency_code CHAR(4),
    acquired_at DATE,
    source_url VARCHAR(255),
    source_description TEXT(300),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS degrees_info;
CREATE TABLE IF NOT EXISTS degrees_info (
    id INT AUTO_INCREMENT,
    object_id CHAR(10) NOT NULL,
    degree_type CHAR(40) NOT NULL,
    subject TEXT(300),
    institution CHAR(80),
    graduated_at DATE,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS funding_rounds_info;
CREATE TABLE IF NOT EXISTS funding_rounds_info (
    id INT AUTO_INCREMENT,
    funding_round_id MEDIUMINT UNIQUE,
    object_id CHAR(10) NOT NULL,
    funded_at CHAR(20),
    funding_round_type CHAR(20) NOT NULL,
    funding_round_code CHAR(20) NOT NULL,
    raised_amount DECIMAL(11,1),
    raised_currency_code CHAR(4),
    raised_amount_usd DECIMAL(11,1),
    pre_money_valuation DECIMAL(12,1),
    pre_money_currency_code CHAR(4),
    pre_money_valuation_usd DECIMAL(12,1),
    post_money_valuation DECIMAL(12,1),
    post_money_currency_code CHAR(4),
    post_money_valuation_usd DECIMAL(12,1),
    participants TINYINT,
    is_first_round TINYINT(1),
    is_last_round TINYINT(1),
    source_url VARCHAR(255),
    source_description TEXT(300),
    created_by CHAR(40),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS funds_info;
CREATE TABLE IF NOT EXISTS funds_info (
    id SMALLINT AUTO_INCREMENT,
    fund_id SMALLINT,
    object_id CHAR(10) NOT NULL,
    name VARCHAR(200) NOT NULL,
    funded_at DATE,
    raised_amount DECIMAL(12,1) NOT NULL,
    raised_currency_code CHAR(4) NOT NULL,
    source_url VARCHAR(255),
    source_description VARCHAR(255),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id, fund_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS investments_info;
CREATE TABLE IF NOT EXISTS investments_info (
    id MEDIUMINT AUTO_INCREMENT,
    funding_round_id MEDIUMINT,
    funded_object_id CHAR(10) NOT NULL,
    investor_object_id CHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS ipos_info;
CREATE TABLE IF NOT EXISTS ipos_info (
    id SMALLINT AUTO_INCREMENT,
    ipo_id SMALLINT,
    object_id CHAR(10),
    valuation_amount DECIMAL(13,1),
    valuation_currency_code CHAR(4),
    raised_amount DECIMAL(12,1),
    raised_currency_code CHAR(4),
    public_at DATE,
    stock_symbol CHAR(30) NOT NULL,
    source_url VARCHAR(255),
    source_description VARCHAR(255),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id, ipo_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS milestones_info;
CREATE TABLE IF NOT EXISTS milestones_info (
    id MEDIUMINT AUTO_INCREMENT,
    object_id CHAR(10) NOT NULL,
    milestone_at DATE NOT NULL,
    milestone_code CHAR(10) NOT NULL,
    description TEXT(300),
    source_url VARCHAR(255),
    source_description TEXT(300),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_info;
CREATE TABLE IF NOT EXISTS objects_info (
    id INT AUTO_INCREMENT,
    object_id CHAR(10),
    entity_type CHAR(20) NOT NULL,
    entity_id MEDIUMINT,
    parent_id CHAR(10),
    name TEXT(300) NOT NULL,
    normalized_name TEXT(300),
    permalink VARCHAR(255) NOT NULL,
    category_code CHAR(20),
    status CHAR(20) NOT NULL,
    founded_at DATE,
    closed_at DATE,
    domain CHAR(100),
    twitter_username CHAR(50),
    logo_url VARCHAR(255),
    overview TEXT(300),
    short_description VARCHAR(255),
    description VARCHAR(255),
    tag_list VARCHAR(255),
    first_investment_at DATE,
    first_funding_at DATE,
    first_milestone_at DATE,
    relationships SMALLINT,
    created_by CHAR(40),
    created_at DATETIME,
    updated_at DATETIME CHECK(updated_at >= created_at),
    PRIMARY KEY (id),
    CONSTRAINT domain_unique
        UNIQUE (object_id, domain),
    CONSTRAINT logo_unique
        UNIQUE (object_id, logo_url)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_investments;
CREATE TABLE IF NOT EXISTS objects_investments (
    id INT AUTO_INCREMENT,
    first_investment_at DATE,
    last_investment_at DATE,
    investment_rounds SMALLINT,
    invested_companies SMALLINT,
    PRIMARY KEY (id, first_investment_at),
    CONSTRAINT obj_investments_fk
        FOREIGN KEY (id)
        REFERENCES objects_info(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_funding;
CREATE TABLE IF NOT EXISTS objects_funding (
    id INT AUTO_INCREMENT,
    first_funding_at DATE,
    last_funding_at DATE,
    funding_rounds TINYINT NOT NULL,
    funding_total_usd DECIMAL(11,1) NOT NULL,
    PRIMARY KEY (id, first_funding_at),
    CONSTRAINT obj_funding_fk
        FOREIGN KEY (id)
        REFERENCES objects_info(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_milestones;
CREATE TABLE IF NOT EXISTS objects_milestones (
    id INT AUTO_INCREMENT,
    first_milestone_at DATE,
    last_milestone_at DATE,
    milestones TINYINT NOT NULL,
    PRIMARY KEY (id, first_milestone_at),
    CONSTRAINT obj_milestones_fk
        FOREIGN KEY (id)
        REFERENCES objects_info(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_status;
CREATE TABLE IF NOT EXISTS objects_status (
    id INT AUTO_INCREMENT,
    status CHAR(20) NOT NULL,
    founded_at DATE,
    closed_at DATE,
    CONSTRAINT obj_status_fk
        FOREIGN KEY (id)
        REFERENCES objects_info(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_domain;
CREATE TABLE IF NOT EXISTS objects_domain (
    object_id CHAR(10),
    domain CHAR(100),
    homepage_url CHAR(100),
    CONSTRAINT obj_domain_fk
        FOREIGN KEY (object_id, domain)
        REFERENCES objects_info(object_id, domain)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_logo;
CREATE TABLE IF NOT EXISTS objects_logo (
    object_id CHAR(10),
    logo_url VARCHAR(255),
    logo_width SMALLINT NOT NULL,
    logo_height SMALLINT NOT NULL,
    CONSTRAINT obj_logo_fk
        FOREIGN KEY (object_id, logo_url)
        REFERENCES objects_info(object_id, logo_url)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS objects_location;
CREATE TABLE IF NOT EXISTS objects_location (
    object_id CHAR(10),
    country_code CHAR(10),
    state_code CHAR(2),
    city CHAR(100),
    region CHAR(50),
    CONSTRAINT obj_location_fk
        FOREIGN KEY (object_id)
        REFERENCES objects_info(object_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS offices_info;
CREATE TABLE IF NOT EXISTS offices_info (
    id MEDIUMINT AUTO_INCREMENT,
    object_id CHAR(10) NOT NULL,
    office_id MEDIUMINT UNIQUE,
    description VARCHAR(255),
    region CHAR(50),
    address1 TEXT(300),
    address2 VARCHAR(255),
    city VARCHAR(255),
    zip_code CHAR(50),
    state_code CHAR(2),
    country_code CHAR(4),
    latitude FLOAT(20),
    longitude FLOAT(20),
    created_at DATETIME,
    updated_at DATETIME CHECK(updated_at >= created_at),
    PRIMARY KEY (id, office_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS people_info;
CREATE TABLE IF NOT EXISTS people_info (
    id MEDIUMINT AUTO_INCREMENT,
    object_id CHAR(10) NOT NULL UNIQUE,
    first_name CHAR(100) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    birthplace VARCHAR(255),
    affiliation_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS relationships_info;
CREATE TABLE IF NOT EXISTS relationships_info (
    id MEDIUMINT AUTO_INCREMENT,
    relationship_id MEDIUMINT UNIQUE,
    person_object_id CHAR(10) NOT NULL,
    relationship_object_id CHAR(10) NOT NULL,
    start_at DATE,
    end_at DATE,
    is_past TINYINT(1) NOT NULL,
    sequence MEDIUMINT NOT NULL,
    title TEXT(300) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL CHECK(updated_at >= created_at),
    PRIMARY KEY (id, relationship_id)
) ENGINE=InnoDB;


/**************************************
*  Insert data into normalized tables
***************************************/
INSERT INTO acquisitions_info
SELECT id,
    acquisition_id,
    acquiring_object_id,
    acquired_object_id,
    term_code,
    price_amount,
    price_currency_code,
    (SELECT STR_TO_DATE(acquired_at, '%Y-%m-%d')
        WHERE acquired_at != ""),
    source_url,
    source_description,
    created_at,
    updated_at
FROM acquisitions;

INSERT INTO degrees_info
SELECT id,
    object_id,
    degree_type,
    subject,
    institution,
    (SELECT STR_TO_DATE(graduated_at, '%Y-%m-%d')
        WHERE graduated_at != ""),
    created_at,
    updated_at
FROM degrees;

INSERT INTO funding_rounds_info
SELECT id,
    funding_round_id,
    object_id,
    funded_at,
    funding_round_type,
    funding_round_code,
    raised_amount,
    raised_currency_code,
    raised_amount_usd,
    pre_money_valuation,
    pre_money_currency_code,
    pre_money_valuation_usd,
    post_money_valuation,
    post_money_currency_code,
    post_money_valuation_usd,
    participants,
    is_first_round,
    is_last_round,
    source_url,
    source_description,
    created_by,
    created_at,
    updated_at
FROM funding_rounds;

INSERT INTO funds_info
SELECT id,
    fund_id,
    object_id,
    name,
    (SELECT STR_TO_DATE(funded_at, '%Y-%m-%d')
        WHERE funded_at != ""),
    raised_amount,
    raised_currency_code,
    source_url,
    source_description,
    created_at,
    updated_at
FROM funds;

INSERT INTO investments_info
SELECT *
FROM investments;

INSERT INTO ipos_info
SELECT id,
    ipo_id,
    object_id,
    valuation_amount,
    valuation_currency_code,
    raised_amount,
    raised_currency_code,
    (SELECT STR_TO_DATE(public_at, '%Y-%m-%d')
        WHERE public_at != ""),
    stock_symbol,
    source_url,
    source_description,
    created_at,
    updated_at
FROM ipos;

INSERT INTO milestones_info
SELECT *
FROM milestones;

INSERT INTO objects_info(
    object_id,
    entity_type,
    entity_id,
    parent_id,
    name,
    normalized_name,
    permalink,
    category_code,
    status,
    founded_at,
    closed_at,
    domain,
    twitter_username,
    logo_url,
    overview,
    short_description,
    description,
    tag_list,
    first_investment_at,
    first_funding_at,
    first_milestone_at,
    relationships,
    created_by,
    created_at,
    updated_at)
SELECT
    id,
    entity_type,
    entity_id,
    parent_id,
    name,
    normalized_name,
    permalink,
    category_code,
    status,
    (SELECT STR_TO_DATE(founded_at, '%Y-%m-%d')
        WHERE founded_at != ""),
    (SELECT STR_TO_DATE(closed_at, '%Y-%m-%d')
        WHERE closed_at != ""),
    domain,
    twitter_username,
    logo_url,
    overview,
    short_description,
    description,
    tag_list,
    (SELECT STR_TO_DATE(first_investment_at, '%Y-%m-%d')
        WHERE first_investment_at != ""),
    (SELECT STR_TO_DATE(first_funding_at, '%Y-%m-%d')
        WHERE first_funding_at != ""),
   (SELECT STR_TO_DATE(first_milestone_at, '%Y-%m-%d')
        WHERE first_milestone_at != ""),
    relationships,
    created_by,
    (SELECT STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%S')
        WHERE created_at != ""),
    updated_at
FROM objects;

INSERT INTO objects_investments(
    first_investment_at,
    last_investment_at,
    investment_rounds,
    invested_companies)
SELECT
    (SELECT STR_TO_DATE(first_investment_at, '%Y-%m-%d')
        WHERE first_investment_at != ""),
    (SELECT STR_TO_DATE(last_investment_at, '%Y-%m-%d')
        WHERE last_investment_at != ""),
    investment_rounds,
    invested_companies
FROM objects
WHERE first_investment_at != "";

INSERT INTO objects_funding(first_funding_at, last_funding_at, funding_rounds, funding_total_usd)
SELECT
    (SELECT STR_TO_DATE(first_funding_at, '%Y-%m-%d')
        WHERE first_funding_at != ""),
    (SELECT STR_TO_DATE(last_funding_at, '%Y-%m-%d')
        WHERE last_funding_at != ""),
    funding_rounds,
    funding_total_usd
FROM objects
WHERE first_funding_at != "";

INSERT INTO objects_milestones(first_milestone_at, last_milestone_at, milestones)
SELECT
    (SELECT STR_TO_DATE(first_milestone_at, '%Y-%m-%d')
        WHERE first_milestone_at != ""),
    (SELECT STR_TO_DATE(last_milestone_at, '%Y-%m-%d')
        WHERE last_milestone_at != ""),
    milestones
FROM objects
WHERE first_milestone_at != "";

INSERT INTO objects_status (status, founded_at, closed_at)
SELECT
    status,
    (SELECT STR_TO_DATE(founded_at, '%Y-%m-%d')
        WHERE founded_at != ""),
    (SELECT STR_TO_DATE(closed_at, '%Y-%m-%d')
        WHERE closed_at != "")
FROM objects
WHERE status != "";

INSERT INTO objects_domain (domain, homepage_url)
SELECT domain, homepage_url
FROM objects
WHERE domain != "";

INSERT INTO objects_logo (logo_url, logo_width, logo_height)
SELECT logo_url, logo_width, logo_height
FROM objects
WHERE logo_url != "";

INSERT INTO objects_location (country_code, city, state_code, region)
SELECT
    country_code,
    city,
    state_code,
    region
FROM objects;

INSERT INTO offices_info
SELECT id,
    object_id,
    office_id,
    description,
    region,
    address1,
    address2,
    city,
    zip_code,
    state_code,
    country_code,
    latitude,
    longitude,
    (SELECT STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%S')
        WHERE created_at != ""),
    (SELECT STR_TO_DATE(updated_at, '%Y-%m-%d %H:%i:%S')
        WHERE updated_at != "")
FROM offices;

INSERT INTO people_info
SELECT *
FROM people;

INSERT INTO relationships_info
SELECT id,
    relationship_id,
    person_object_id,
    relationship_object_id,
    (SELECT STR_TO_DATE(start_at, '%Y-%m-%d %H:%i:%S')
        WHERE start_at != ""),
    (SELECT STR_TO_DATE(end_at, '%Y-%m-%d %H:%i:%S')
        WHERE end_at != ""),
    is_past,
    sequence,
    title,
    created_at,
    updated_at
FROM relationships;


/***********************************
*  Advanced Features
************************************/

USE startup_info;

/*
This is a view that combines 4 different tables into one.
The purpose of it is to know the degree distribution of a company
It is used in the stored procedure below to get that information
*/

CREATE OR REPLACE VIEW degree_distribution AS
SELECT degrees_info.object_id AS person_id,
		objects_info.id AS company_id,
		degrees_info.degree_type,
        degrees_info.subject,
        degrees_info.institution,
        relationships_info.title,
        relationships_info.is_past,
        objects_info.name, 
        objects_info.normalized_name,
        people_info.birthplace
FROM degrees_info
	JOIN relationships_info ON degrees_info.object_id = relationships_info.person_object_id
	JOIN objects_info ON relationships_info.relationship_object_id = objects_info.object_id
    JOIN people_info ON people_info.object_id = degrees_info.object_id;


DROP PROCEDURE IF EXISTS getDegreesFromCompany;

DELIMITER //

/*
The stored procedure below looks in the degree distubution view
and gets the data and count of each type of degree that occurs
at least 5 times in the company.
It formats the data so it can be displayed in a graph. 
*/

CREATE PROCEDURE getDegreesFromCompany(IN companyName VARCHAR(50))
BEGIN

	SELECT degree_type,
            COUNT(*) AS degree_count
	FROM degree_distribution
	WHERE degree_distribution.company_id = (SELECT id
									FROM objects_info
									WHERE objects_info.normalized_name = LOWER(companyName)
                                    LIMIT 1)
			AND degree_type != ''
            AND degree_type != 'Degree'
	GROUP BY degree_type
    HAVING degree_count > 5;
    
END//

DELIMITER ;

/* 
The view below is used to get the data on the amount
of funding each category receives. It is used in combination
with the stored procedure below to retreive this information. 
*/
CREATE OR REPLACE VIEW funding_amounts AS
SELECT funding_rounds_info.object_id,
		funding_rounds_info.raised_amount_usd,
        EXTRACT(YEAR FROM funding_rounds_info.funded_at) AS funded_year,
        objects_status.status,
        objects_info.category_code,
        objects_info.tag_list
FROM funding_rounds_info
	JOIN objects_info ON funding_rounds_info.object_id = objects_info.object_id
    JOIN objects_status ON objects_info.id = objects_status.id
WHERE funding_rounds_info.funded_at IS NOT NULL 
		AND funding_rounds_info.funded_at != ''
        AND funding_rounds_info.raised_amount_usd != 0;


/* 
The procedure gets the amount of money that each category of company
has received
*/

DROP PROCEDURE IF EXISTS getCategoryFunding;

DELIMITER //

CREATE PROCEDURE getCategoryFunding(IN category VARCHAR(50))
BEGIN

	SELECT SUM(raised_amount_usd) AS total_raised,
			funded_year
    FROM funding_amounts
    WHERE category_code = LOWER(category)
    GROUP BY funded_year;
    
	
END//

DELIMITER ;

/*
The procedure below mainly updates the tables that deal with acquisitions. 
An aqusition is when a company acquires another one which
required that many tables be changed so we need
a stored procedure and transaction to make sure all the updates happen. 
*/

DROP PROCEDURE IF EXISTS add_aquisition;

DELIMITER //

CREATE PROCEDURE add_aquisition(IN purchasing VARCHAR(50), IN tobeAquired VARCHAR(50), IN amount INT)
BEGIN

	DECLARE sql_error INT DEFAULT FALSE;
    
    DECLARE purchasing_id CHAR(10) DEFAULT (SELECT object_id
						FROM objects_info
						WHERE objects_info.normalized_name = LOWER(purchasing)
						LIMIT 1);
    
	DECLARE acquired_id CHAR(10) DEFAULT (SELECT object_id
						FROM objects_info
						WHERE objects_info.normalized_name = LOWER(tobeAquired)
						LIMIT 1);
                        
	DECLARE new_id SMALLINT DEFAULT (SELECT MAX(acquisition_id)
								FROM acquisitions_info);

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
	
    IF purchasing_id IS NULL OR acquired_id IS NULL OR new_id IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not Valid Companies';
	END IF;
    
	START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;
    
    INSERT INTO acquisitions_info (id, 
				acquisition_id,
				acquiring_object_id,
				acquired_object_id,
				term_code,
				price_amount,
				price_currency_code,
				acquired_at,
				source_url,
				source_description,
				created_at,
				updated_at)
    VALUES (DEFAULT, new_id+1, (SELECT object_id
						FROM objects_info
						WHERE objects_info.normalized_name = LOWER(purchasing)
						LIMIT 1), (SELECT object_id
						FROM objects_info
						WHERE objects_info.normalized_name = LOWER(tobeAquired)
						LIMIT 1), 'cash', amount , 'USD', CURDATE(), NULL, 'Created by the user', NOW(), NOW());
    
    
    UPDATE objects_info
		SET objects_info.parent_id = purchasing_id
        WHERE objects_info.object_id = acquired_id;
        
        
    UPDATE objects_status
		SET objects_status.status = 'acquired'
        WHERE objects_status.id = (SELECT id 
									FROM objects_info 
									WHERE object_id = acquired_id
                                    LIMIT 1);
        
    UPDATE objects_info
		SET objects_info.updated_at = NOW()
        WHERE objects_info.object_id = acquired_id;
        
        
	SET SQL_SAFE_UPDATES = 1;
        
    
    IF sql_error = FALSE THEN
		COMMIT;
        SELECT TRUE;
	ELSE
		ROLLBACK;
		SELECT FALSE;
	END IF;

END//

DELIMITER ;

/*
The below procedure inserts a person into the database.
Becuase of the nature of the database, this means many tables need to be
updated and values to be checked. Therefore, a transation and stored 
procedure are nessessary. 
*/
DROP PROCEDURE IF EXISTS add_person;

DELIMITER //

CREATE PROCEDURE add_person(IN first_name VARCHAR(100), IN last_name VARCHAR(255), IN birthplace VARCHAR(255), 
							IN company VARCHAR(255), IN job_title TEXT)
BEGIN

	DECLARE sql_error INT DEFAULT FALSE;
    
    DECLARE max_people_id MEDIUMINT DEFAULT ((SELECT MAX(id) FROM people_info) + 1);
    
	DECLARE max_rel_id MEDIUMINT DEFAULT ((SELECT MAX(relationship_id) FROM relationships_info) + 1);
    
    DECLARE max_obj_people_id MEDIUMINT DEFAULT (SELECT MAX(CONVERT(SUBSTRING(object_id, 3), UNSIGNED INTEGER))
											FROM people_info
											WHERE object_id != 'p: 0' AND object_id IS NOT NULL);
                                            
	DECLARE max_obj_rel_id MEDIUMINT DEFAULT (SELECT MAX(CONVERT(SUBSTRING(relationship_object_id, 3), UNSIGNED INTEGER))
											FROM relationships_info
											WHERE relationship_object_id != 'c: 0' AND relationship_object_id IS NOT NULL);

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
            
	IF birthplace = '' THEN SET birthplace = NULL; 
    END IF;
    
    IF company = '' OR first_name = '' OR last_name = '' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Need to specify a company'; 
    END IF;
    

	START TRANSACTION;

    SET SQL_SAFE_UPDATES = 0;
    
    
    -- Update Person and relationship Table
    
    INSERT INTO people_info (id,
		object_id,
		first_name,
		last_name,
		birthplace,
		affiliation_name)
	VALUES (max_people_id, CONCAT('p:', (max_obj_people_id + 1)), first_name, last_name, birthplace, company);
    
    
    INSERT INTO relationships_info (id,
		relationship_id,
		person_object_id,
		relationship_object_id,
		start_at,
		end_at,
		is_past,
		sequence,
		title,
		created_at,
		updated_at)
	VALUES (DEFAULT, max_rel_id, CONCAT('p:', (max_obj_people_id + 1)), CONCAT('c:', (max_obj_rel_id + 1)), 
					CURDATE(), NULL, 0, 1, job_title, NOW(), NOW());

    
    SET SQL_SAFE_UPDATES = 1;
    
    IF sql_error = FALSE THEN
		COMMIT;
        SELECT TRUE;
	ELSE
		ROLLBACK;
		SELECT FALSE;
	END IF;

END //

DELIMITER ;

/*
The below stored procdure and transaction takes in data for a
person and tries to delete that person. We also optinally use
the company name for that person, since most of the people
in the database don't have a company they are associated with. 
Becuase we need to delete them from so many tables, we need a
transation with commit and rollback funcationality.
*/

DROP PROCEDURE IF EXISTS deletePerson;

DELIMITER //

CREATE PROCEDURE deletePerson(IN first_name2 CHAR(100), IN last_name2 VARCHAR(255), IN company VARCHAR(255))
BEGIN

	DECLARE sql_error INT DEFAULT FALSE;
    
    DECLARE count_people INT DEFAULT (SELECT COUNT(id) 
								FROM people_info
								WHERE LOWER(first_name) = LOWER(first_name2) AND LOWER(last_name) = LOWER(last_name2)
                                GROUP BY (last_name));
                                
	
	DECLARE person_obj_id CHAR(10) DEFAULT (SELECT object_id
											FROM people_info
											WHERE LOWER(first_name) = LOWER(first_name2) AND LOWER(last_name) = LOWER(last_name2)
                                            LIMIT 1);
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
        
	IF company = '' AND count_people > 1 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Need to specify a company';
	END IF;
    
    IF company != '' THEN 
		SET person_obj_id = (SELECT object_id
								FROM people_info
								WHERE LOWER(first_name) = LOWER(first_name2) AND 
										LOWER(last_name) = LOWER(last_name2) AND
										LOWER(affiliation_name) = LOWER(company)
								LIMIT 1);
    END IF;
    
    IF person_obj_id IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Need to specify a company';
	END IF;
        
	START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;
	
    IF company = '' THEN
		DELETE FROM people_info
		WHERE first_name = first_name2 AND last_name = last_name2;
	ELSE
		DELETE FROM people_info
		WHERE first_name = first_name2 AND last_name = last_name2 AND LOWER(affiliation_name) = LOWER(company);
	END IF;
    
    DELETE FROM relationships_info
    WHERE person_object_id = person_obj_id;
        
    DELETE FROM degrees_info
    WHERE object_id = person_obj_id;
        
    DELETE FROM objects_info
    WHERE object_id = person_obj_id;
        
    SET SQL_SAFE_UPDATES = 1;
    
    IF sql_error = FALSE THEN
		COMMIT;
        SELECT TRUE;
	ELSE
		ROLLBACK;
		SELECT FALSE;
	END IF;


END //

DELIMITER ;
