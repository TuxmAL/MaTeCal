-------------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2004 Brian Bruns
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-------------------------------------------------------------

DROP TABLE Agenti;
CREATE TABLE Agenti
 (
	IDAgente			Long Integer, 
	Cognome			Text (30), 
	Nome			Text (25), 
	Via			Text (40), 
	Citta			Text (50),
	Provincia			Text (2), 
	CAP			Text (5), 
	IDZona			Byte, 
	Telefono1			Text (15), 
	Telefono2			Text (15), 
	Telefono3			Text (15), 
	Fax			Text (30), 
	CodFis_PIVA			Text (11), 
	Provvigione			Byte
);
-- CREATE ANY INDEXES ...

DROP TABLE Campagna;
CREATE TABLE Campagna
 (
	IDCampagna			Byte, 
	Descrizione			Text (50)
);
-- CREATE ANY INDEXES ...

DROP TABLE Destinazione;
CREATE TABLE Destinazione
 (
	IDCliente			Long Integer, 
	IDDestinazione			Long Integer, 
	Via			Text (40), 
	Citta			Text (50),
	Provincia			Text (2), 
	CAP			Text (5)
);
-- CREATE ANY INDEXES ...

DROP TABLE Dettagli bolle;
CREATE TABLE Dettagli bolle
 (
	IDDettaglioBolla			Long Integer, 
	IDBolla			Long Integer, 
	IDDettOrd			Long Integer, 
	IDProdotto			Long Integer, 
	VarianteColore			Byte, 
	Quantita			Currency
);
-- CREATE ANY INDEXES ...

DROP TABLE Dettagli fatture;
CREATE TABLE Dettagli fatture
 (
	IDDettaglioFattura			Long Integer, 
	IDFattura			Long Integer, 
	IDProdotto			Long Integer, 
	Quantita			Currency,
	PrezzoUnitario			Currency, 
	Conformato			Boolean, 
	Omaggio			Boolean
);
-- CREATE ANY INDEXES ...

DROP TABLE Dettagli ordini;
CREATE TABLE Dettagli ordini
 (
	IDDettaglioOrdine			Long Integer, 
	IDOrdine			Long Integer, 
	IDProdotto			Long Integer, 
	CartellaColore			Byte, 
	VarianteColore			Byte, 
	RigaEvasa			Boolean
);
-- CREATE ANY INDEXES ...

DROP TABLE Fatture;
CREATE TABLE Fatture
 (
	IDFattura			Long Integer, 
	IDAgente			Long Integer, 
	IDCliente			Long Integer, 
	Provvigione			Byte, 
	IDBolla			Long Integer, 
	NumeroFatt			Integer, 
	AnnoFatt			Integer, 
	DataFattura			DateTime (Short), 
	IDModalitaPagamento			Long Integer,
	Sconto			Byte, 
	Banca			Text (40), 
	Agenzia			Text (120), 
	ABI			Text (10), 
	CAB			Text (10), 
	Note			Memo/Hyperlink (255), 
	ProvvPagata			Boolean, 
	SpeseIncasso			Currency
);
-- CREATE ANY INDEXES ...

DROP TABLE Magazzino;
CREATE TABLE Magazzino
 (
	IDProdotto			Long Integer, 
	IDCampagna			Byte, 
	Taglia			Byte, 
	Conformato			Boolean, 
	QtaResa			Currency, 
	QtaArticolo			Currency
);
-- CREATE ANY INDEXES ...

DROP TABLE Modelli;
CREATE TABLE Modelli
 (
	IDModello			Byte, 
	Descrizione			Text (35)
);
-- CREATE ANY INDEXES ...

DROP TABLE Ordini;
CREATE TABLE Ordini
 (
	IDOrdine			Long Integer, 
	NumeroOrdine			Integer, 
	AnnoOrdine			Integer, 
	DataOrdine			DateTime (Short), 
	PeriodoConsegna			Text (10), 
	IDCliente			Long Integer, 
	IDDestinazione			Long Integer, 
	IDAgente			Long Integer, 
	Provvigione			Byte, 
	IDCampagna			Byte, 
	IDModalitaPagamento			Long Integer,
	Note			Memo/Hyperlink (255), 
	Annullato			Boolean
);
-- CREATE ANY INDEXES ...

DROP TABLE Prodotti;
CREATE TABLE Prodotti
 (
	IDProdotto			Long Integer, 
	Codice Prodotto			Long Integer, 
	Descrizione			Text (50), 
	IDModello			Byte, 
	Composizione			Text (100), 
	PrezzoUnitario			Currency, 
	IVAArticolo			Byte, 
	IDCampagna			Byte, 
	PrezzoConformato			Currency, 
	IDUnita			Byte
);
-- CREATE ANY INDEXES ...

DROP TABLE Subdettagli bolle;
CREATE TABLE Subdettagli bolle
 (
	IDSubDettaglio			Long Integer, 
	IDDettaglioBolla			Long Integer, 
	IDSubDettOrd			Long Integer, 
	Taglia			Byte, 
	Quantita			Currency
);
-- CREATE ANY INDEXES ...

DROP TABLE Subdettagli ordini;
CREATE TABLE Subdettagli ordini
 (
	IDSubDettaglio			Long Integer, 
	IDDettaglioOrdine			Long Integer, 
	Taglia			Byte, 
	Quantita			Currency,
	QtaEvasa			Currency
);
-- CREATE ANY INDEXES ...

DROP TABLE UltimoDoc;
CREATE TABLE UltimoDoc
 (
	Anno			Integer, 
	OrdNum			Long Integer, 
	BollaNum			Long Integer, 
	FattNum			Long Integer
);
-- CREATE ANY INDEXES ...

DROP TABLE Utente;
CREATE TABLE Utente
 (
	IDUtente			Long Integer, 
	Utente			Text (15), 
	Password			Text (15), 
	Descrizione			Text (50), 
	Livello			Byte
);
-- CREATE ANY INDEXES ...

DROP TABLE Vettori;
CREATE TABLE Vettori
 (
	IDVettore			Long Integer, 
	Vettore			Text (50), 
	Via			Text (40), 
	Citta			Text (50),
	Provincia			Text (2), 
	CAP			Text (5), 
	Telefono1			Text (15), 
	Telefono2			Text (15), 
	Telefono3			Text (15), 
	Fax			Text (30)
);
-- CREATE ANY INDEXES ...

DROP TABLE Zone;
CREATE TABLE Zone
 (
	IDZona			Byte, 
	Descrizione			Text (35)
);
-- CREATE ANY INDEXES ...

DROP TABLE Bolle;
CREATE TABLE Bolle
 (
	IDBolla			Long Integer, 
	IDOrdine			Long Integer, 
	Provvigione			Byte, 
	IDAgente			Long Integer, 
	IDCliente			Long Integer, 
	IDDestinazione			Long Integer, 
	IDVettore			Long Integer, 
	IDModalitaPagamento			Long Integer,
	NumeroBolla			Integer, 
	AnnoBolla			Integer, 
	DataBolla			DateTime (Short), 
	IDCausale			Byte, 
	Trasporto			Byte, 
	Colli			Integer, 
	Aspetto			Byte, 
	Note			Memo/Hyperlink (255)
);
-- CREATE ANY INDEXES ...

DROP TABLE Causali;
CREATE TABLE Causali
 (
	IDCausale			Byte, 
	Causale			Text (25)
);
-- CREATE ANY INDEXES ...

DROP TABLE Clienti;
CREATE TABLE Clienti
 (
	IDCliente			Long Integer, 
	Ragione Sociale			Text (50), 
	Via			Text (40), 
	Citta			Text (50),
	Provincia			Text (2), 
	CAP			Text (5), 
	IDZona			Byte, 
	Telefono1			Text (15), 
	Telefono2			Text (15), 
	Telefono3			Text (15), 
	Fax			Text (30), 
	CodFis_PIVA			Text (16), 
	Banca			Text (40), 
	Agenzia			Text (120), 
	ABI			Text (10), 
	CAB			Text (10), 
	IDModalitaPagamento			Long Integer,
	Note			Memo/Hyperlink (255)
);
-- CREATE ANY INDEXES ...

DROP TABLE Modalita di pagamento;
CREATE TABLE Modalita di pagamento
 (
	IDModalitaPagamento			Long Integer,
	Descrizione			Text (35), 
	DilazioneIniziale			Integer, 
	Num_Rate			Byte, 
	Scadenza			Text (1), 
	Sconto			Byte, 
	TipoPagamento			Text (1), 
	PiuSconto			Byte
);
-- CREATE ANY INDEXES ...

DROP TABLE Unita;
CREATE TABLE Unita
 (
	IDUnita			Byte,
	Unita			Text (5)
);
-- CREATE ANY INDEXES ...



-- CREATE ANY Relationships ...

-- relationships are not supported for access
