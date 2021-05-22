INSERT INTO "Territory" ("reg", "area", "territory", "territorytype")
SELECT DISTINCT "regname", "areaname", "tername", "tertypename"
FROM zno;

INSERT INTO "Territory" ("reg", "area", "territory")
SELECT DISTINCT eoregname, eoareaname, eotername
FROM zno
WHERE EORegName IS NOT NULL AND EOAreaName IS NOT NULL AND EOTerName IS NOT NULL
EXCEPT
SELECT "reg", "area", "territory"
FROM "Territory";



INSERT INTO "School" ("school", "type", "reg", "egov")
SELECT DISTINCT on (zno.EONAME) zno.EONAME, zno.EOTYPENAME, "Territory".reg, zno.EOParent
FROM zno
LEFT JOIN "Territory"
ON zno.EORegName = "Territory".reg AND zno.areaname = "Territory".area AND zno.EOTerName = "Territory".territory
WHERE zno.EONAME IS NOT NULL;

INSERT INTO "School" (school, reg)
SELECT DISTINCT ON (zno.UkrPTName) zno.UkrPTName, "Territory".reg
FROM zno
LEFT JOIN "Territory"
ON zno.UkrPTRegName = "Territory".reg AND zno.UkrPTAreaName = "Territory".area AND zno.UkrPTTerName = "Territory".territory
WHERE zno.UkrPTName NOT IN (
SELECT school
FROM "School") AND zno.UkrPTName IS NOT NULL;

INSERT INTO "School" (school, reg)
SELECT DISTINCT ON (zno.bioPTName) zno.bioPTName, "Territory".reg
FROM zno
LEFT JOIN "Territory"
ON zno.bioPTName = "Territory".reg AND zno.bioPTName = "Territory".area AND zno.bioPTName = "Territory".territory
WHERE zno.bioPTName NOT IN (
SELECT school
FROM "School"
) AND zno.bioPTName IS NOT NULL;



INSERT INTO "Pupil" ("pupId", "birthdate", "sex", "reg" , "area", "territory", "regiontype","classprof","classlang","school")
SELECT DISTINCT ON ("outid") "outid", "birth", "sextypename", "regname", "areaname", "tername", "regtypename", "classprofilename", "classlangname", "eoname"
FROM zno;



INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "coef", "school")
SELECT DISTINCT "ukrtest", "outid", "ukrteststatus", "ukrball100", "ukrball12", "ukrball", "ukradaptscale", "eoname"
FROM zno
WHERE "ukrtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "histtest", "outid", "histteststatus", "histball100", "histball12", "histball12", "eoname"
FROM zno
WHERE "histtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "mathtest", "outid", "mathteststatus", "mathball100", "mathball12", "mathball12", "eoname"
FROM zno
WHERE "mathtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "phystest", "outid", "physteststatus", "physball100", "physball12", "physball12", "eoname"
FROM zno
WHERE "phystest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "chemtest", "outid", "chemteststatus", "chemball100", "chemball12", "chemball12", "eoname"
FROM zno
WHERE "chemtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "biotest", "outid", "bioteststatus", "bioball100", "bioball12", "bioball12", "eoname"
FROM zno
WHERE "biotest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "geotest", "outid", "geoteststatus", "geoball100", "geoball12", "geoball12", "eoname"
FROM zno
WHERE "geotest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "engtest", "outid", "engteststatus", "engball100", "engball12", "engball12", "eoname"
FROM zno
WHERE "engtest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "fratest", "outid", "frateststatus", "fraball100", "fraball12", "fraball12", "eoname"
FROM zno
WHERE "fratest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "deutest", "outid", "deuteststatus", "deuball100", "deuball12", "deuball12", "eoname"
FROM zno
WHERE "deutest" IS NOT NULL;

INSERT INTO "ZNO" ("subject", "pupil", "stat", "100p" , "12p", "points", "school")
SELECT DISTINCT "spatest", "outid", "spateststatus", "spaball100", "spaball12", "spaball12", "eoname"
FROM zno
WHERE "spatest" IS NOT NULL;