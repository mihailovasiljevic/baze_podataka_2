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

--POGLED 3: 