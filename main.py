from sqlalchemy import create_engine
from sqlalchemy import Table, Column, Integer, String, MetaData, ForeignKey
from sqlalchemy import inspect

metadata = MetaData()

table_one = """ CREATE TABLE DiseaseType (
    id int NOT NULL PRIMARY KEY, 
    description varchar(140) 
    );"""

table_two = """ CREATE TABLE Country (
    cname varchar(50) NOT NULL PRIMARY KEY,
    population bigint
    );"""

table_three = """ CREATE TABLE Disease (
    disease_code varchar(50) NOT NULL PRIMARY KEY, 
    pathogen varchar(20), 
    description varchar(140), 
    id integer,
    FOREIGN KEY(id) REFERENCES DiseaseType(id) 
    );"""

table_four = """ CREATE TABLE Discover (
    cname varchar(50), 
    disease_code varchar(50), 
    first_enc_date date,
    PRIMARY KEY(cname, disease_code),
    FOREIGN KEY(disease_code) REFERENCES Disease(disease_code),
    FOREIGN KEY(cname) REFERENCES Country(cname) 
    );"""

table_five = """ CREATE TABLE Users (
    email varchar(60),  
    name varchar(30), 
    surname varchar(40), 
    salary integer, 
    phone varchar(20),
    cname varchar(50),
    PRIMARY KEY(email),
    FOREIGN KEY(cname) REFERENCES Country(cname) 
    );"""

table_six = """ CREATE TABLE PublicServant (
    email varchar(60), 
    department varchar(50),
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES Users(email)
    );"""

table_seven = """ CREATE TABLE Doctor (
    email varchar(60),
    degree varchar(20),
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES Users(email)
    );"""

table_eight = """ CREATE TABLE Specialize(
    id integer, 
    email varchar(60),
    PRIMARY KEY(id, email),
    FOREIGN KEY(id) REFERENCES DiseaseType(id),
    FOREIGN KEY(email) REFERENCES Doctor(email)
    );"""

table_nine = """ CREATE TABLE Record(
    email varchar(60), 
    cname varchar(50), 
    disease_code varchar(50), 
    total_deaths integer, 
    total_patients integer,
    PRIMARY KEY(email, cname, disease_code),
    FOREIGN KEY(disease_code) REFERENCES Disease(disease_code),
    FOREIGN KEY(cname) REFERENCES Country(cname),
    FOREIGN KEY(email) REFERENCES PublicServant(email)
    );"""


engine = create_engine('postgresql+psycopg2://postgres:1234@localhost:5432/hw')
metadata.create_all(engine)


#engine.execute(table_one)
#engine.execute(table_two)
#engine.execute(table_three)
#engine.execute(table_four)
#engine.execute(table_five)
#engine.execute(table_six)
#engine.execute(table_seven)
#engine.execute(table_eight)
#engine.execute(table_nine)

with engine.connect() as con:

    first_query = con.execute("""SELECT disease.disease_code, disease.description
    FROM disease INNER JOIN discover 
    ON disease.disease_code = discover.disease_code
    WHERE pathogen = 'bacteria' AND first_enc_date < '1990-01-01';
    """)
    print('Query1 results are:')
    for a in first_query:
        print(a)

    second_query = con.execute("""SELECT u.name,u.surname,a.degree
    FROM Users u 
    INNER JOIN Doctor a ON u.email = a.email
    WHERE a.email NOT IN (
        SELECT s.email
        FROM specialize s
        INNER JOIN Diseasetype d ON s.id = d.id
        WHERE d.description = 'infectious');
    """)
    print('Query2 results are:')
    for b in second_query:
        print(b)

    third_query = con.execute("""SELECT DISTINCT u.name,u.surname,a.degree
    FROM Users u, Doctor a
    WHERE u.email = a.email AND a.email IN(
    SELECT s.email
    FROM specialize s
    INNER JOIN Diseasetype d ON s.id = d.id
    GROUP BY s.email
    HAVING COUNT(*) >=2);
    """)

    print('Query3 results are:')
    for c in third_query:
         print(c)

    fourth_query = con.execute("""SELECT DISTINCT c.cname, AVG(u.salary)
    FROM Country c, Users u
    WHERE c.cname = u.cname AND  u.email IN
    (
        SELECT DISTINCT d.email
        FROM Doctor d, Specialize s
        WHERE d.email = s.email AND s.id IN
        (
        SELECT a.id
        FROM Diseasetype a
        WHERE a.description = 'virology'
        )
    )
    GROUP BY c.cname;
    """)

    print('Query4 results are:')
    for e in fourth_query:
        print(e)

    fifth_query = con.execute("""SELECT DISTINCT a.department, COUNT(distinct a.email)
        FROM Publicservant a, Record b
        WHERE a.email = b.email AND  b.disease_code = 'covid-19' 
        GROUP BY department
        HAVING COUNT(b.email) >= 2;
        """)

    print('Query5 results are:')
    for j in fifth_query:
        print(j)

    six_query = con.execute("""UPDATE Users 
    SET salary = salary * 2
    WHERE email IN(
        SELECT r.email
        FROM Record r
        WHERE r.disease_code = 'covid-19'
        GROUP BY r.email
        HAVING COUNT(r.email) > 3
        );
    """)

    seven_query = ("""
    DELETE FROM users
    WHERE surname LIKE '%%bek%%' OR surname LIKE '%%Bek%%'
    """)
    engine.execute(seven_query)

    eight_query = con.execute("""CREATE INDEX "idx pathogen" on Disease(pathogen)""")


    nine_query = con.execute("""SELECT DISTINCT b.email, a.name, b.department
        FROM PublicServant b, Users a,Record c
        WHERE b.email = a.email AND b.email IN(
        SELECT c.email
        FROM Record c
        WHERE c.total_patients BETWEEN 100000 AND 999999
        );
        """)
    print('Query9 results are:')
    for h in nine_query:
        print(h)

    ten_query = con.execute("""SELECT c.cname
    FROM Record c
    GROUP BY c.cname
    ORDER BY SUM(c.total_patients) DESC
    limit 5""")

    print('Query10 results are:')
    for y in ten_query:
        print(y)

    eleven_query = con.execute("""SELECT Distinct description, 
      (SELECT SUM(total_patients) 
       FROM Record as r
       JOIN Disease as d
       ON r.disease_code = d.disease_code AND d.id = a.id)
      FROM DiseaseType as a
    """)

    print('Query11 results are:')
    for s in eleven_query:
        print(s)


