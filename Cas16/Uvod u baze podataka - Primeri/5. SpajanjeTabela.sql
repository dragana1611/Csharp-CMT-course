USE [CMT]

SELECT p.ime, p.prezime, s.naziv FROM polaznik p, skola s WHERE p.skolaId = s.skolaId;

