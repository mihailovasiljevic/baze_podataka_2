-- kreiraj pogled da vidi? anga?ovanje agenata u prodaji
-- POGLED 1: prikazi sve agente koji su ujedno i prodavci nepokretnosti a nisu kupci
CREATE OR REPLACE VIEW
agenti_prodavci(Oznaka, Ime, Prezime) AS 
SELECT A.AGENT_ID, A.AGENT_IME, A.AGENT_PREZ
FROM AGENT A, KUPAC K, PRODAVAC P
WHERE P.ADRS_ID = A.ADRS_ID AND A.ADRS_ID <> K.ADRS_ID
GROUP BY A.AGENT_ID, A.AGENT_IME, A.AGENT_PREZ;

--POGLED 2: Izracunaj ukupne troskove(zbir troskova) za sve nepokretnosti koji se trenutno prodaju
CREATE OR REPLACE VIEW
moguca_zarada(Ukupno) AS
SELECT SUM(UOP.POSR_TROSK) 
FROM UGOVOR_O_POSREDOVANJU UOP
WHERE UOP.POSR_DAT_IST >= to_date(SYSDATE, 'DD-MON-YY');

-- POGLED: Prika?i sve adrese
CREATE OR REPLACE VIEW
adresa_nepokretnosti(Ulica, Broj, Grad, Dr?ava) AS
SELECT U.ULICA_NAZ, A.ADRS_ULBR, D.DRZ_NAZ, G.LOK_NAZ 
FROM DRZAVA D, GRAD G, ULICA U, ADRESA A
WHERE A.ULICA_ID = U.ULICA_ID (+) AND A.LOK_ID = G.LOK_ID(+) AND A.DRZ_ID = D.DRZ_ID (+)
GROUP BY  U.ULICA_NAZ, A.ADRS_ULBR, D.DRZ_NAZ, G.LOK_NAZ;


--POGLED 3: Prika?i dodatne informacije o nepokretnosti
CREATE OR REPLACE VIEW
citava_nepokretnost(Oznaka,Povr?ina, Useljiva, "U izgradnji", "Broj soba", "Broj spratova", Dupleks, 
          "Ima lift", "Stara gradnja", Legalna, Tajna, Prodata, Opis, "Tip nepokretnosti", "Oznaka prodavca",
          "Ime prodavca", "Prezime prodavca", "Broj li?ne karte prodavca", "Telefon prodavca", "Email prodavca", Ulica,Broj,Grad, Drzava
) AS
SELECT DISTINCT N.NEK_ID, N.NEK_POV, N.NEK_USELJ, N.NEK_UIZGR, N.NEK_SOBE, N.NEK_SPRAT, N.NEK_DUPL, N.NEK_LIFT, N.NEK_STARA, N.NEK_LEG,
       N.NEK_TAJNA, N.NEK_PROD, N.NEK_OPIS, T.NEK_TIP_NAZ, P.PROD_ID, P.PROD_IME, P.PROD_PREZ, P.PROD_BRLK, P.PROD_TEL, P.PROD_EMAIL, U.ULICA_NAZ, A.ADRS_ULBR, G.LOK_NAZ, D.DRZ_NAZ
FROM NEPOKRETNOST N, TIP_NEPOKRETNOSTI T, PRODAVAC P, ULICA U, GRAD G, DRZAVA D, ADRESA A
WHERE
      P.PROD_ID = N.PROD_ID AND
      N.NEK_TIP_ID = T.NEK_TIP_ID AND
      N.ADRS_ID = A.ADRS_ID AND 
      N.ULICA_ID = U.ULICA_ID AND
      N.LOK_ID = G.LOK_ID AND
      N.DRZ_ID = D.DRZ_ID 
GROUP BY N.NEK_ID, N.NEK_POV, N.NEK_USELJ, N.NEK_UIZGR, N.NEK_SOBE, N.NEK_SPRAT, N.NEK_DUPL, N.NEK_LIFT, N.NEK_STARA, N.NEK_LEG,
       N.NEK_TAJNA, N.NEK_PROD, N.NEK_OPIS, T.NEK_TIP_NAZ, P.PROD_ID, 
       P.PROD_IME, P.PROD_PREZ, P.PROD_BRLK, P.PROD_TEL, P.PROD_EMAIL, U.ULICA_NAZ,
       A.ADRS_ULBR, G.LOK_NAZ, D.DRZ_NAZ;
  
--POGLED: Prika?i broj nekretnina koje se trenutno prodaju, sumu tro?kova za njih, stru?nu spremu agenta koji prodaje tu nekretninu, broj pomo?nih objekata, tipovi pomo?nih objekata 
CREATE OR REPLACE VIEW
cezar_mix("Broj nekretnina na prodaju", "Suma tro?kova", "Stru?na sprema agenta", "Broj pomo?nih objekata", "Tipovi pomo?nih objekata") AS
SELECT nvl(count(N.NEK_ID, '0')), nvl(SUM(UOP.POSR_TROSK), '0'), A.AGENT_ID, SS.STRUC_SPREM_NAZ,nvl(count(PO.POM_OBJ_ID, '0')), PO.POM_OBJ_ID, TPO.POM_OBJ_TIP_NAZ  
FROM NEPOKRETNOST N, UGOVOR_O_POSREDOVANJU UOP, AGENT A, STRUCNA_SPREMA SS, POMOCNI_OBJEKAT PO, TIP_POMOCNOG_OBJEKTA TPO
WHERE
    UOP.AGENT_ID = A.AGENT_ID AND
    N.NEK_ID in (SELECT NEK_ID FROM UGOVOR_O_POSREDOVANJU UOP2 WHERE UOP2.ISHOD_ID='P' AND N.NEK_ID = UOP2.NEK_ID ) AND
    N.NEK_ID = UOP.NEK_ID AND
    
    A.STRUC_SPREM_ID = SS.STRUC_SPREM_ID AND
    PO.NEK_ID = NEK_ID AND
    TPO.POM_OBJ_TIP_ID + PO.POM_OBJ_TIP_ID AND
    
    
    

UOP.POSR_DAT_IST >= to_date(SYSDATE, 'DD-MON-YY');


SELECT DISTINCT N.NEK_ID, count(UOP.NEK_ID) 
FROM NEPOKRETNOST N, UGOVOR_O_POSREDOVANJU UOP

GROUP BY N.NEK_ID;
       