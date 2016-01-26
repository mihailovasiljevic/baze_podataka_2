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
          "Ime prodavca", "Prezime prodavca", "Broj li?ne karte prodavca", "Telefon prodavca", "Email prodavca", Ulica,Broj,Grad, Drzava, "Ukupni troskovi", "Ukupno slika"
) AS
SELECT DISTINCT N.NEK_ID, N.NEK_POV, N.NEK_USELJ, N.NEK_UIZGR, N.NEK_SOBE, N.NEK_SPRAT, N.NEK_DUPL, N.NEK_LIFT, N.NEK_STARA, N.NEK_LEG,
       N.NEK_TAJNA, N.NEK_PROD, N.NEK_OPIS, T.NEK_TIP_NAZ, P.PROD_ID, P.PROD_IME, P.PROD_PREZ, P.PROD_BRLK, P.PROD_TEL, P.PROD_EMAIL, U.ULICA_NAZ, A.ADRS_ULBR, G.LOK_NAZ, D.DRZ_NAZ, sum(UOP.POSR_TROSK), nvl(count(SL.SLIKA_ID), '0')
FROM NEPOKRETNOST N, TIP_NEPOKRETNOSTI T, PRODAVAC P, ULICA U, GRAD G, DRZAVA D, ADRESA A, UGOVOR_O_POSREDOVANJU UOP, SLIKA SL
WHERE
      P.PROD_ID = N.PROD_ID  AND
      N.NEK_TIP_ID = T.NEK_TIP_ID AND
      N.ADRS_ID = A.ADRS_ID  AND 
      N.ULICA_ID = U.ULICA_ID AND
      N.LOK_ID = G.LOK_ID AND
      N.DRZ_ID = D.DRZ_ID AND
      UOP.PROD_ID = N.PROD_ID AND
      SL.PROD_ID = N.PROD_ID  AND 
      SL.SLIKA_ID in (SELECT SLIKA_ID FROM SLIKA SL2 WHERE SL.PROD_ID = SL2.PROD_ID) AND
      UOP.POSR_DAT_IST >= to_date(SYSDATE, 'DD-MON-YY')
group by N.NEK_ID, N.NEK_POV, N.NEK_USELJ, N.NEK_UIZGR, N.NEK_SOBE, 
N.NEK_SPRAT, N.NEK_DUPL, N.NEK_LIFT, N.NEK_STARA, N.NEK_LEG, 
N.NEK_TAJNA, N.NEK_PROD, N.NEK_OPIS, T.NEK_TIP_NAZ, P.PROD_ID, 
P.PROD_IME, P.PROD_PREZ, P.PROD_BRLK, P.PROD_TEL, P.PROD_EMAIL, 
U.ULICA_NAZ, A.ADRS_ULBR, G.LOK_NAZ, D.DRZ_NAZ;
  