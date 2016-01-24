-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-01-24 23:15:41 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Adresa
  (
    ADRS_ID   INTEGER NOT NULL ,
    ADRS_ULBR VARCHAR2 (12) NOT NULL ,
    ULICA_ID  CHAR (3 CHAR) NOT NULL ,
    LOK_ID    CHAR (2 CHAR) NOT NULL ,
    DRZ_ID    CHAR (3 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Adresa.ADRS_ID
IS
  'Identifikator adrese.' ;
  COMMENT ON COLUMN Adresa.ADRS_ULBR
IS
  'Broj u ulici.' ;
  COMMENT ON COLUMN Adresa.ULICA_ID
IS
  'Identifikator ulice.' ;
  COMMENT ON COLUMN Adresa.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Adresa.DRZ_ID
IS
  'ISO kod dr?ave.' ;
ALTER TABLE Adresa ADD CONSTRAINT Adresa_PK PRIMARY KEY ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) ;


CREATE TABLE Agent
  (
    AGENT_ID       INTEGER NOT NULL ,
    AGENT_IME      VARCHAR2 (128 CHAR) NOT NULL ,
    AGENT_PREZ     VARCHAR2 (128 CHAR) NOT NULL ,
    AGENT_TEL      INTEGER NOT NULL ,
    STRUC_SPREM_ID CHAR (3 CHAR) NOT NULL ,
    DRZ_DRZ_ID     CHAR (3 CHAR) NOT NULL ,
    AGENT_BRLK     VARCHAR2 (9 CHAR) NOT NULL ,
    ADRS_ID        INTEGER NOT NULL ,
    ULICA_ID       CHAR (3 CHAR) NOT NULL ,
    LOK_ID         CHAR (2 CHAR) NOT NULL ,
    DRZ_ID         CHAR (3 CHAR) NOT NULL ,
    STR_ISP_OZN    INTEGER NOT NULL
  ) ;
COMMENT ON COLUMN Agent.AGENT_ID
IS
  'Identifikator agenta.' ;
  COMMENT ON COLUMN Agent.AGENT_IME
IS
  'Ime agenta.' ;
  COMMENT ON COLUMN Agent.AGENT_PREZ
IS
  'Prezime agenta.' ;
  COMMENT ON COLUMN Agent.AGENT_TEL
IS
  'Telefon agenta.' ;
  COMMENT ON COLUMN Agent.STRUC_SPREM_ID
IS
  'Identifikator stru?ne spreme' ;
  COMMENT ON COLUMN Agent.DRZ_DRZ_ID
IS
  'ISO kod dr?ave.' ;
  COMMENT ON COLUMN Agent.AGENT_BRLK
IS
  'Broj licne karte agenta.' ;
  COMMENT ON COLUMN Agent.ADRS_ID
IS
  'Identifikator adrese agenta.' ;
  COMMENT ON COLUMN Agent.ULICA_ID
IS
  'Identifikator ulice.' ;
  COMMENT ON COLUMN Agent.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Agent.DRZ_ID
IS
  'ISO kod dr?ave.' ;
  COMMENT ON COLUMN Agent.STR_ISP_OZN
IS
  'Oznaka pod kojom je izdat sertifikat o polo?enom stru?nom ispitu.' ;
CREATE UNIQUE INDEX Agent__IDX ON Agent
  (
    STR_ISP_OZN ASC
  )
  ;
ALTER TABLE Agent ADD CONSTRAINT Agent_PK PRIMARY KEY ( AGENT_ID ) ;


CREATE TABLE Drzava
  (
    DRZ_ID  CHAR (3 CHAR) NOT NULL ,
    DRZ_NAZ VARCHAR2 (128 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Drzava.DRZ_ID
IS
  'ISO kod dr?ave.' ;
  COMMENT ON COLUMN Drzava.DRZ_NAZ
IS
  'Naziv dr?ave.' ;
ALTER TABLE Drzava ADD CONSTRAINT Drzava_PK PRIMARY KEY ( DRZ_ID ) ;


CREATE TABLE Grad
  (
    LOK_ID  CHAR (2 CHAR) NOT NULL ,
    LOK_NAZ VARCHAR2 (64 CHAR) NOT NULL ,
    DRZ_ID  CHAR (3 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Grad.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Grad.LOK_NAZ
IS
  'Naziv grada.' ;
  COMMENT ON COLUMN Grad.DRZ_ID
IS
  'ISO kod dr?ave.' ;
ALTER TABLE Grad ADD CONSTRAINT Grad_PK PRIMARY KEY ( LOK_ID, DRZ_ID ) ;
ALTER TABLE Grad ADD CONSTRAINT Grad_LOK_NAZ_UN UNIQUE ( LOK_NAZ ) ;


CREATE TABLE Ishod_posredovanja
  (
    ISHOD_ID  CHAR (1 CHAR) NOT NULL ,
    ISHOD_NAZ VARCHAR2 (64 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Ishod_posredovanja.ISHOD_ID
IS
  'Identifikator ishoda u posredovanju.' ;
  COMMENT ON COLUMN Ishod_posredovanja.ISHOD_NAZ
IS
  'Naziv ishoda u posredovanju.(Prodato, Kupljeno, Iznajmljeno, itd.)' ;
ALTER TABLE Ishod_posredovanja ADD CONSTRAINT Ishod_posredovanja_PK PRIMARY KEY ( ISHOD_ID ) ;


CREATE TABLE Kupac
  (
    KUP_ID    INTEGER NOT NULL ,
    KUP_IME   VARCHAR2 (128 CHAR) NOT NULL ,
    KUP_PREZ  VARCHAR2 (128 CHAR) NOT NULL ,
    KUP_BRLK  VARCHAR2 (9 CHAR) NOT NULL ,
    KUP_TEL   INTEGER NOT NULL ,
    KUP_EMAIL VARCHAR2 (128 CHAR) ,
    ADRS_ID   INTEGER NOT NULL ,
    ULICA_ID  CHAR (3 CHAR) NOT NULL ,
    LOK_ID    CHAR (2 CHAR) NOT NULL ,
    DRZ_ID    CHAR (3 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Kupac.KUP_ID
IS
  'Identifikator kupca.' ;
  COMMENT ON COLUMN Kupac.KUP_IME
IS
  'Ime kupca.' ;
  COMMENT ON COLUMN Kupac.KUP_PREZ
IS
  'Prezime kupca.' ;
  COMMENT ON COLUMN Kupac.KUP_BRLK
IS
  'Broj lince karte  kupca.' ;
  COMMENT ON COLUMN Kupac.KUP_TEL
IS
  'Telefon  kupca.' ;
  COMMENT ON COLUMN Kupac.KUP_EMAIL
IS
  'Email kupca.' ;
  COMMENT ON COLUMN Kupac.ADRS_ID
IS
  'Adresa kupca.' ;
  COMMENT ON COLUMN Kupac.ULICA_ID
IS
  'Identifikator ulice.' ;
  COMMENT ON COLUMN Kupac.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Kupac.DRZ_ID
IS
  'ISO kod dr?ave.' ;
ALTER TABLE Kupac ADD CONSTRAINT Kupac_PK PRIMARY KEY ( KUP_ID ) ;


CREATE TABLE Nepokretnost
  (
    NEK_ID     INTEGER NOT NULL ,
    NEK_POV    NUMBER (10,2) ,
    NEK_USELJ  CHAR (1) DEFAULT '1' NOT NULL ,
    NEK_UIZGR  CHAR (1) DEFAULT '0' NOT NULL ,
    NEK_SOBE   INTEGER ,
    NEK_SPRAT  INTEGER ,
    NEK_DUPL   CHAR (1) DEFAULT '0' ,
    NEK_LIFT   CHAR (1) DEFAULT '0' ,
    NEK_STARA  CHAR (1) DEFAULT '0' ,
    NEK_LEG    CHAR (1) DEFAULT '0' NOT NULL ,
    NEK_TAJNA  CHAR (1) DEFAULT '0' NOT NULL ,
    NEK_PROD   CHAR (1) DEFAULT '0' NOT NULL ,
    NEK_OPIS   VARCHAR2 (2048 CHAR) ,
    NEK_TIP_ID CHAR (2 CHAR) NOT NULL ,
    PROD_ID    INTEGER NOT NULL ,
    ADRS_ID    INTEGER NOT NULL ,
    ULICA_ID   CHAR (3 CHAR) NOT NULL ,
    LOK_ID     CHAR (2 CHAR) NOT NULL ,
    DRZ_ID     CHAR (3 CHAR) NOT NULL ,
    NEK_DAT_OD DATE NOT NULL ,
    NEK_DAT_DO BLOB
  ) ;
COMMENT ON COLUMN Nepokretnost.NEK_ID
IS
  'Identifikator nepokretnosti.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_POV
IS
  'Povr?ina nepokretnosti.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_USELJ
IS
  'Da li je nekretnina useljiva?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_UIZGR
IS
  'Da li je nekretnina u izgradnji?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_SOBE
IS
  'Broj soba.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_SPRAT
IS
  'Broj spratova.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_DUPL
IS
  'Da li je dupleks?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_LIFT
IS
  'Da li ima lift?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_STARA
IS
  'Da li je stara ili nova gradnja?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_LEG
IS
  'Da li je legalna?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_TAJNA
IS
  'Da li su podaci o nepokretnosti tajni?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_PROD
IS
  'Da li je nekretnina prodata?' ;
  COMMENT ON COLUMN Nepokretnost.NEK_OPIS
IS
  'Dodatni opis nekretnine.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_TIP_ID
IS
  'Identifikator tipa nepokretnosti.' ;
  COMMENT ON COLUMN Nepokretnost.PROD_ID
IS
  'Identifikator prodavca.' ;
  COMMENT ON COLUMN Nepokretnost.ADRS_ID
IS
  'Adresa nepokretnosti.' ;
  COMMENT ON COLUMN Nepokretnost.ULICA_ID
IS
  'Ulica u kojoj se nepokretnost nalazi.' ;
  COMMENT ON COLUMN Nepokretnost.LOK_ID
IS
  'Grad  u kom  se nepokretnost nalazi.' ;
  COMMENT ON COLUMN Nepokretnost.DRZ_ID
IS
  'Drzava u kojoj se nepokretnost nalazi.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_DAT_OD
IS
  'Datum od kog se nekretnina prodaje.' ;
  COMMENT ON COLUMN Nepokretnost.NEK_DAT_DO
IS
  'Datum do kog je nekretnina prodavana.' ;
ALTER TABLE Nepokretnost ADD CONSTRAINT Nepokretnost_PK PRIMARY KEY ( NEK_ID, NEK_TIP_ID, PROD_ID ) ;


CREATE TABLE Pomocni_objekat
  (
    POM_OBJ_ID     INTEGER NOT NULL ,
    POM_OBJ_NAZ    VARCHAR2 (128 CHAR) NOT NULL ,
    POM_OBJ_POV    NUMBER (10,2) ,
    POM_OBJ_TIP_ID CHAR (2 CHAR) NOT NULL ,
    NEK_ID         INTEGER NOT NULL ,
    NEK_TIP_ID     CHAR (2 CHAR) NOT NULL ,
    PROD_ID        INTEGER NOT NULL
  ) ;
COMMENT ON COLUMN Pomocni_objekat.POM_OBJ_ID
IS
  'Identifikator pomo?nog objekta.' ;
  COMMENT ON COLUMN Pomocni_objekat.POM_OBJ_NAZ
IS
  'Naziv tipa pomo?nog objekta.' ;
  COMMENT ON COLUMN Pomocni_objekat.POM_OBJ_POV
IS
  'Pov?rina pomo?nog objekta.' ;
  COMMENT ON COLUMN Pomocni_objekat.POM_OBJ_TIP_ID
IS
  'Identifikator tipa pomocnog objekta.' ;
  COMMENT ON COLUMN Pomocni_objekat.NEK_ID
IS
  'Identifikator nepokretnosti.' ;
  COMMENT ON COLUMN Pomocni_objekat.NEK_TIP_ID
IS
  'Identifikator tipa nepokretnosti.' ;
  COMMENT ON COLUMN Pomocni_objekat.PROD_ID
IS
  'Identifikator prodavca.' ;
ALTER TABLE Pomocni_objekat ADD CONSTRAINT Pomocni_objekat_PK PRIMARY KEY ( POM_OBJ_ID, POM_OBJ_TIP_ID ) ;


CREATE TABLE Prikljucak
  (
    PRIK_ID  INTEGER NOT NULL ,
    PRIK_NAZ VARCHAR2 (128 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Prikljucak.PRIK_ID
IS
  'Identifikator priklju?ka.' ;
  COMMENT ON COLUMN Prikljucak.PRIK_NAZ
IS
  'Naziv tipa priklju?ka.' ;
ALTER TABLE Prikljucak ADD CONSTRAINT Prikljucak_PK PRIMARY KEY ( PRIK_ID ) ;


CREATE TABLE Prikljucak_nepokretnosti
  (
    PRIK_ID    INTEGER NOT NULL ,
    NEK_ID     INTEGER NOT NULL ,
    NEK_TIP_ID CHAR (2 CHAR) NOT NULL ,
    PROD_ID    INTEGER NOT NULL
  ) ;
ALTER TABLE Prikljucak_nepokretnosti ADD CONSTRAINT Priklju?ak_nepokretnosti_PK PRIMARY KEY ( PRIK_ID, NEK_ID, NEK_TIP_ID, PROD_ID ) ;


CREATE TABLE Prodavac
  (
    PROD_ID     INTEGER NOT NULL ,
    PROD_IME    VARCHAR2 (128 CHAR) NOT NULL ,
    PROD_PREZ   VARCHAR2 (128 CHAR) NOT NULL ,
    PROD_BRLK   VARCHAR2 (9 CHAR) NOT NULL ,
    PROD_TEL    INTEGER NOT NULL ,
    PROD_EMAIL  VARCHAR2 (128 CHAR) ,
    PROD_ANONIM CHAR (1) DEFAULT '0' NOT NULL ,
    ADRS_ID     INTEGER NOT NULL ,
    ULICA_ID    CHAR (3 CHAR) NOT NULL ,
    LOK_ID      CHAR (2 CHAR) NOT NULL ,
    DRZ_ID      CHAR (3 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Prodavac.PROD_ID
IS
  'Identifikator prodavca.' ;
  COMMENT ON COLUMN Prodavac.PROD_IME
IS
  'Ime prodavca.' ;
  COMMENT ON COLUMN Prodavac.PROD_PREZ
IS
  'Prezime prodavca.' ;
  COMMENT ON COLUMN Prodavac.PROD_BRLK
IS
  'Broj li?ne karte.' ;
  COMMENT ON COLUMN Prodavac.PROD_TEL
IS
  'Broj telefona prodavca.' ;
  COMMENT ON COLUMN Prodavac.PROD_EMAIL
IS
  'Email adresa prodavca.' ;
  COMMENT ON COLUMN Prodavac.PROD_ANONIM
IS
  'Da li prodavac ?eli da bude anoniman?' ;
  COMMENT ON COLUMN Prodavac.ADRS_ID
IS
  'Identifikator adrese prodavca.' ;
  COMMENT ON COLUMN Prodavac.ULICA_ID
IS
  'Identifikator ulice.' ;
  COMMENT ON COLUMN Prodavac.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Prodavac.DRZ_ID
IS
  'ISO kod dr?ave.' ;
ALTER TABLE Prodavac ADD CONSTRAINT Prodavac_PK PRIMARY KEY ( PROD_ID ) ;


CREATE TABLE Slika
  (
    SLIKA_ID       INTEGER NOT NULL ,
    SLIKA_NAZ      VARCHAR2 (256 CHAR) NOT NULL ,
    SLIKA_PUT      VARCHAR2 (512 CHAR) NOT NULL ,
    SLIKA_OPIS     VARCHAR2 (2048 CHAR) ,
    NEK_ID         INTEGER ,
    NEK_TIP_ID     CHAR (2 CHAR) ,
    POM_OBJ_ID     INTEGER ,
    POM_OBJ_TIP_ID CHAR (2 CHAR) ,
    PROD_ID        INTEGER
  ) ;
COMMENT ON COLUMN Slika.SLIKA_ID
IS
  'Identifikator slike.' ;
  COMMENT ON COLUMN Slika.SLIKA_NAZ
IS
  'Naziv slike.' ;
  COMMENT ON COLUMN Slika.SLIKA_PUT
IS
  'Putanja do slike na serveru.' ;
  COMMENT ON COLUMN Slika.SLIKA_OPIS
IS
  'Opcioni opis slike.' ;
  COMMENT ON COLUMN Slika.NEK_ID
IS
  'Identifikator nepokretnosti.' ;
  COMMENT ON COLUMN Slika.NEK_TIP_ID
IS
  'Identifikator tipa nepokretnosti.' ;
  COMMENT ON COLUMN Slika.POM_OBJ_ID
IS
  'Identifikator pomo?nog objekta.' ;
  COMMENT ON COLUMN Slika.POM_OBJ_TIP_ID
IS
  'Identifikator tipa pomocnog objekta.' ;
  COMMENT ON COLUMN Slika.PROD_ID
IS
  'Identifikator prodavca.' ;
ALTER TABLE Slika ADD CONSTRAINT Slika_PK PRIMARY KEY ( SLIKA_ID ) ;
ALTER TABLE Slika ADD CONSTRAINT Slika_SLIKA_NAZ_UN UNIQUE ( SLIKA_NAZ ) ;


CREATE TABLE Strucna_sprema
  (
    STRUC_SPREM_ID  CHAR (3 CHAR) NOT NULL ,
    STRUC_SPREM_NAZ VARCHAR2 (64 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Strucna_sprema.STRUC_SPREM_ID
IS
  'Identifikator stru?ne spreme' ;
  COMMENT ON COLUMN Strucna_sprema.STRUC_SPREM_NAZ
IS
  'Naziv stru?ne spreme.' ;
ALTER TABLE Strucna_sprema ADD CONSTRAINT Strucna_sprema_PK PRIMARY KEY ( STRUC_SPREM_ID ) ;


CREATE TABLE Strucni_ispit
  (
    STR_ISP_OZN       INTEGER NOT NULL ,
    STR_ISP_DAT_POL   DATE NOT NULL ,
    STR_ISP_DAT_PREST DATE
  ) ;
COMMENT ON COLUMN Strucni_ispit.STR_ISP_OZN
IS
  'Oznaka pod kojom je izdat sertifikat o polo?enom stru?nom ispitu.' ;
  COMMENT ON COLUMN Strucni_ispit.STR_ISP_DAT_POL
IS
  'Datum kada je stru?ni ispit polo?en.' ;
  COMMENT ON COLUMN Strucni_ispit.STR_ISP_DAT_PREST
IS
  'Datum isticanja va?enja polo?enog stru?nog ispita.' ;
ALTER TABLE Strucni_ispit ADD CONSTRAINT Strucni_ispit_PK PRIMARY KEY ( STR_ISP_OZN ) ;


CREATE TABLE Tip_nepokretnosti
  (
    NEK_TIP_ID  CHAR (2 CHAR) NOT NULL ,
    NEK_TIP_NAZ VARCHAR2 (128) NOT NULL
  ) ;
COMMENT ON COLUMN Tip_nepokretnosti.NEK_TIP_ID
IS
  'Identifikator tipa nepokretnosti.' ;
  COMMENT ON COLUMN Tip_nepokretnosti.NEK_TIP_NAZ
IS
  'Naziv tipa nepokretnosti.' ;
ALTER TABLE Tip_nepokretnosti ADD CONSTRAINT Tip_nepokretnosti_PK PRIMARY KEY ( NEK_TIP_ID ) ;


CREATE TABLE Tip_pomocnog_objekta
  (
    POM_OBJ_TIP_ID  CHAR (2 CHAR) NOT NULL ,
    POM_OBJ_TIP_NAZ VARCHAR2 (128 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Tip_pomocnog_objekta.POM_OBJ_TIP_ID
IS
  'Identifikator tipa pomocnog objekta.' ;
  COMMENT ON COLUMN Tip_pomocnog_objekta.POM_OBJ_TIP_NAZ
IS
  'Naziv tipa pomocnog objekta.' ;
ALTER TABLE Tip_pomocnog_objekta ADD CONSTRAINT Tip_pomocnog_objekta_PK PRIMARY KEY ( POM_OBJ_TIP_ID ) ;


CREATE TABLE Ugovor_o_posredovanju
  (
    POSR_SVRHA     VARCHAR2 (256) ,
    POSR_DAT_SKL   DATE NOT NULL ,
    POSR_ROK       DATE NOT NULL ,
    POSR_DAT_IST   DATE NOT NULL ,
    POSR_ID        INTEGER NOT NULL ,
    POSR_TROSK     NUMBER (12,4) NOT NULL ,
    POSR_OTK_ROK   DATE NOT NULL ,
    POSR_NAZ_SUDA  VARCHAR2 (128 CHAR) NOT NULL ,
    POSR_TEL_SUDA  VARCHAR2 (12 CHAR) NOT NULL ,
    POSR_BRPR      INTEGER NOT NULL ,
    POSR_BRPOSTR   INTEGER NOT NULL ,
    POSR_POTP      CHAR (1) DEFAULT '0' NOT NULL ,
    Agent_AGENT_ID INTEGER NOT NULL ,
    Kupac_KUP_ID   INTEGER NOT NULL ,
    ISHOD_ID       CHAR (1 CHAR) NOT NULL ,
    NEK_ID         INTEGER NOT NULL ,
    NEK_TIP_ID     CHAR (2 CHAR) NOT NULL ,
    ADRS_ID        INTEGER NOT NULL ,
    ULICA_ID       CHAR (3 CHAR) NOT NULL ,
    LOK_ID         CHAR (2 CHAR) NOT NULL ,
    DRZ_ID         CHAR (3 CHAR) NOT NULL ,
    PROD_ID        INTEGER NOT NULL
  ) ;
COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_SVRHA
IS
  'Svrha ugovora.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_DAT_SKL
IS
  'Datum sklapanja ugovora.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_ROK
IS
  'Rok isplate.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_DAT_IST
IS
  'Datum isticanja ugovora.(Ugovor va?i najvi?e godinu dana.)' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_ID
IS
  'Identifikator ugovora o posredovanju' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_TROSK
IS
  'Visina tro?kova.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_OTK_ROK
IS
  'Otkazni rok. Datum do kog se ugovor mo?e otkazati.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_NAZ_SUDA
IS
  'Naziv nadle?nog suda.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_TEL_SUDA
IS
  'Telefon nadle?nog suda.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_BRPR
IS
  'Broj primeraka ugovora.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_BRPOSTR
IS
  'Broj primeraka po potpisnim stranama.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.POSR_POTP
IS
  'Da li je ugovor potpisan?' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.Agent_AGENT_ID
IS
  'Identifikator agenta.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.Kupac_KUP_ID
IS
  'Identifikator kupca.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.ISHOD_ID
IS
  'Identifikator ishoda u posredovanju.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.NEK_ID
IS
  'Identifikator nepokretnosti.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.NEK_TIP_ID
IS
  'Identifikator tipa nepokretnosti.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.ADRS_ID
IS
  'Identifikator adrese.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.ULICA_ID
IS
  'Identifikator ulice.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.DRZ_ID
IS
  'ISO kod dr?ave.' ;
  COMMENT ON COLUMN Ugovor_o_posredovanju.PROD_ID
IS
  'Identifikator prodavca.' ;
CREATE UNIQUE INDEX Ugovor_o_posredovanju__IDX ON Ugovor_o_posredovanju
  (
    NEK_ID ASC , NEK_TIP_ID ASC , PROD_ID ASC
  )
  ;
ALTER TABLE Ugovor_o_posredovanju ADD CONSTRAINT Ugovor_o_posredovanju_PK PRIMARY KEY ( POSR_ID, Agent_AGENT_ID, NEK_ID, NEK_TIP_ID, PROD_ID ) ;


CREATE TABLE Ulica
  (
    ULICA_ID  CHAR (3 CHAR) NOT NULL ,
    ULICA_NAZ VARCHAR2 (128 CHAR) NOT NULL ,
    LOK_ID    CHAR (2 CHAR) NOT NULL ,
    DRZ_ID    CHAR (3 CHAR) NOT NULL
  ) ;
COMMENT ON COLUMN Ulica.ULICA_ID
IS
  'Identifikator ulice.' ;
  COMMENT ON COLUMN Ulica.ULICA_NAZ
IS
  'Naziv ulice.' ;
  COMMENT ON COLUMN Ulica.LOK_ID
IS
  'Identifikator grada.' ;
  COMMENT ON COLUMN Ulica.DRZ_ID
IS
  'ISO kod dr?ave.' ;
ALTER TABLE Ulica ADD CONSTRAINT Ulica_PK PRIMARY KEY ( ULICA_ID, LOK_ID, DRZ_ID ) ;


ALTER TABLE Adresa ADD CONSTRAINT Adresa_Ulica_FK FOREIGN KEY ( ULICA_ID, LOK_ID, DRZ_ID ) REFERENCES Ulica ( ULICA_ID, LOK_ID, DRZ_ID ) ;

ALTER TABLE Agent ADD CONSTRAINT Agent_Adresa_FK FOREIGN KEY ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) REFERENCES Adresa ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) ;

ALTER TABLE Agent ADD CONSTRAINT Agent_Drzava_FK FOREIGN KEY ( DRZ_DRZ_ID ) REFERENCES Drzava ( DRZ_ID ) ;

ALTER TABLE Agent ADD CONSTRAINT Agent_Strucna_sprema_FK FOREIGN KEY ( STRUC_SPREM_ID ) REFERENCES Strucna_sprema ( STRUC_SPREM_ID ) ;

ALTER TABLE Agent ADD CONSTRAINT Agent_Strucni_ispit_FK FOREIGN KEY ( STR_ISP_OZN ) REFERENCES Strucni_ispit ( STR_ISP_OZN ) ;

ALTER TABLE Grad ADD CONSTRAINT Grad_Drzava_FK FOREIGN KEY ( DRZ_ID ) REFERENCES Drzava ( DRZ_ID ) ;

ALTER TABLE Kupac ADD CONSTRAINT Kupac_Adresa_FK FOREIGN KEY ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) REFERENCES Adresa ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) ;

ALTER TABLE Nepokretnost ADD CONSTRAINT Nep_Tip_nepo_FK FOREIGN KEY ( NEK_TIP_ID ) REFERENCES Tip_nepokretnosti ( NEK_TIP_ID ) ;

ALTER TABLE Nepokretnost ADD CONSTRAINT Nepo_Prodavac_FK FOREIGN KEY ( PROD_ID ) REFERENCES Prodavac ( PROD_ID ) ;

ALTER TABLE Nepokretnost ADD CONSTRAINT Nepokretnost_Adresa_FK FOREIGN KEY ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) REFERENCES Adresa ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) ;

ALTER TABLE Pomocni_objekat ADD CONSTRAINT Pom_obj_Nepo_FK FOREIGN KEY ( NEK_ID, NEK_TIP_ID, PROD_ID ) REFERENCES Nepokretnost ( NEK_ID, NEK_TIP_ID, PROD_ID ) ;

ALTER TABLE Pomocni_objekat ADD CONSTRAINT Pom_obj_Tip_pom_FK FOREIGN KEY ( POM_OBJ_TIP_ID ) REFERENCES Tip_pomocnog_objekta ( POM_OBJ_TIP_ID ) ;

ALTER TABLE Prikljucak_nepokretnosti ADD CONSTRAINT Prik_Nepo_FK FOREIGN KEY ( NEK_ID, NEK_TIP_ID, PROD_ID ) REFERENCES Nepokretnost ( NEK_ID, NEK_TIP_ID, PROD_ID ) ;

ALTER TABLE Prikljucak_nepokretnosti ADD CONSTRAINT Prik_Prik_FK FOREIGN KEY ( PRIK_ID ) REFERENCES Prikljucak ( PRIK_ID ) ;

ALTER TABLE Prodavac ADD CONSTRAINT Prodavac_Adresa_FK FOREIGN KEY ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) REFERENCES Adresa ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) ;

ALTER TABLE Slika ADD CONSTRAINT Slika_Nepokretnost_FK FOREIGN KEY ( NEK_ID, NEK_TIP_ID, PROD_ID ) REFERENCES Nepokretnost ( NEK_ID, NEK_TIP_ID, PROD_ID ) ;

ALTER TABLE Slika ADD CONSTRAINT Slika_Pom_obj_FK FOREIGN KEY ( POM_OBJ_ID, POM_OBJ_TIP_ID ) REFERENCES Pomocni_objekat ( POM_OBJ_ID, POM_OBJ_TIP_ID ) ;

ALTER TABLE Ulica ADD CONSTRAINT Ulica_Grad_FK FOREIGN KEY ( LOK_ID, DRZ_ID ) REFERENCES Grad ( LOK_ID, DRZ_ID ) ;

ALTER TABLE Ugovor_o_posredovanju ADD CONSTRAINT Uop_Adresa_FK FOREIGN KEY ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) REFERENCES Adresa ( ADRS_ID, ULICA_ID, LOK_ID, DRZ_ID ) ;

ALTER TABLE Ugovor_o_posredovanju ADD CONSTRAINT Uop_Agent_FK FOREIGN KEY ( Agent_AGENT_ID ) REFERENCES Agent ( AGENT_ID ) ;

ALTER TABLE Ugovor_o_posredovanju ADD CONSTRAINT Uop_Ishod_posr_FK FOREIGN KEY ( ISHOD_ID ) REFERENCES Ishod_posredovanja ( ISHOD_ID ) ;

ALTER TABLE Ugovor_o_posredovanju ADD CONSTRAINT Uop_Kupac_FK FOREIGN KEY ( Kupac_KUP_ID ) REFERENCES Kupac ( KUP_ID ) ;

ALTER TABLE Ugovor_o_posredovanju ADD CONSTRAINT Uop_Nepokretnost_FK FOREIGN KEY ( NEK_ID, NEK_TIP_ID, PROD_ID ) REFERENCES Nepokretnost ( NEK_ID, NEK_TIP_ID, PROD_ID ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                             2
-- ALTER TABLE                             43
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0