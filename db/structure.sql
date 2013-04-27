CREATE TABLE `agenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `via` varchar(40) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `telefono3` varchar(15) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `codfis_piva` varchar(15) NOT NULL,
  `provvigione` int(11) NOT NULL DEFAULT '0',
  `zona_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cognome_nome` (`cognome`,`nome`),
  KEY `fk_agenti_zone1_idx` (`zona_id`),
  CONSTRAINT `fk_agenti_zone1` FOREIGN KEY (`zona_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bolle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `provvigione` int(11) DEFAULT NULL,
  `agenti_id` int(11) DEFAULT NULL,
  `clienti_id` int(11) NOT NULL,
  `destinazioni_id` int(11) DEFAULT NULL,
  `vettori_id` int(11) DEFAULT NULL,
  `mod_pag_id` int(11) NOT NULL,
  `causali_id` int(11) NOT NULL,
  `trasporto` int(11) NOT NULL DEFAULT '0',
  `colli` int(11) NOT NULL DEFAULT '0',
  `aspetto` int(11) NOT NULL DEFAULT '0',
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Per numero` (`anno`,`numero`),
  UNIQUE KEY `PrimaryKey` (`id`),
  UNIQUE KEY `Destinazione` (`clienti_id`,`destinazioni_id`),
  KEY `BolleIDVettore` (`vettori_id`),
  KEY `Per data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `campagne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campagna` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `causali` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `causale` varchar(35) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `causale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `clienti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ragione_sociale` varchar(50) NOT NULL,
  `via` varchar(40) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `zona_id` int(11) NOT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `telefono3` varchar(15) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `codfis_piva` varchar(16) NOT NULL,
  `banca` varchar(40) NOT NULL,
  `agenzia` varchar(120) NOT NULL,
  `iban` varchar(27) NOT NULL,
  `mod_pag_id` int(11) NOT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RagioneSociale` (`ragione_sociale`),
  KEY `fk_clienti_mod_pags_idx` (`mod_pag_id`),
  KEY `fk_clienti_zone1_idx` (`zona_id`),
  CONSTRAINT `fk_clienti_mod_pags` FOREIGN KEY (`mod_pag_id`) REFERENCES `mod_pags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienti_zone1` FOREIGN KEY (`zona_id`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `destinazioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `via` varchar(40) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `primarykey` (`id`),
  KEY `fk_destinazioni_clienti1_idx` (`cliente_id`),
  CONSTRAINT `fk_destinazioni_clienti1` FOREIGN KEY (`cliente_id`) REFERENCES `clienti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dettagli_bolle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bolle_id` int(11) NOT NULL,
  `dettagli_ordini_id` int(11) DEFAULT NULL,
  `prodotti_id` int(11) NOT NULL,
  `VarianteColore` int(11) DEFAULT NULL,
  `quantita` decimal(8,4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dettagli_fatture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fatture_id` int(11) NOT NULL,
  `prodotti_id` int(11) NOT NULL,
  `quantita` decimal(8,4) NOT NULL,
  `prezzo_unitario` decimal(8,4) NOT NULL,
  `conformato` tinyint(1) NOT NULL DEFAULT '0',
  `omaggio` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`id`),
  KEY `fattura` (`fatture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dettagli_ordini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordini_id` int(11) DEFAULT NULL,
  `prodotti_id` int(11) DEFAULT NULL,
  `cartella_colore` int(11) NOT NULL,
  `variante_colore` int(11) NOT NULL,
  `evasa` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`id`),
  KEY `IDOrdine` (`ordini_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fatture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agenti_id` int(11) DEFAULT NULL,
  `clienti_id` int(11) NOT NULL,
  `provvigione` int(11) DEFAULT NULL,
  `bolla_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `sconto` int(11) DEFAULT NULL,
  `banca` varchar(40) NOT NULL DEFAULT '',
  `agenzia` varchar(120) NOT NULL DEFAULT '',
  `iban` varchar(27) NOT NULL DEFAULT '',
  `note` text,
  `provv_pagata` tinyint(1) NOT NULL DEFAULT '0',
  `spese_incasso` decimal(8,4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Per numero` (`anno`,`numero`),
  UNIQUE KEY `PrimaryKey` (`id`),
  UNIQUE KEY `Per Agente` (`agenti_id`),
  KEY `Per data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fornitori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ragione_sociale` varchar(50) NOT NULL,
  `via` varchar(40) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `provincia` varchar(2) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `zona_id` int(11) NOT NULL,
  `telefono1` varchar(15) DEFAULT NULL,
  `telefono2` varchar(15) DEFAULT NULL,
  `telefono3` varchar(15) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `codfis_piva` varchar(16) NOT NULL,
  `banca` varchar(40) NOT NULL,
  `agenzia` varchar(120) NOT NULL,
  `iban` varchar(27) NOT NULL,
  `mod_pag_id` int(11) NOT NULL,
  `note` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`id`),
  KEY `RagioneSociale` (`ragione_sociale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `magazzino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prodotto_id` int(11) NOT NULL,
  `campagna_id` int(11) NOT NULL,
  `taglia` int(11) NOT NULL,
  `conformato` tinyint(1) NOT NULL,
  `qta_resa` decimal(8,4) NOT NULL,
  `qta` decimal(8,4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDProdottoInCampagna` (`prodotto_id`,`campagna_id`,`taglia`),
  UNIQUE KEY `PrimaryKey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mod_pags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(35) NOT NULL,
  `dilazione_iniziale` int(11) NOT NULL,
  `num_rate` int(11) NOT NULL DEFAULT '0',
  `scadenza` varchar(1) DEFAULT NULL,
  `sconto` int(11) NOT NULL DEFAULT '0',
  `tipo_pagamento` varchar(1) DEFAULT NULL,
  `piu_sconto` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mod_pag_descr` (`descrizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `modelli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(35) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modello` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ordini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `anno` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `periodo_consegna` varchar(10) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `destinazione_id` int(11) DEFAULT NULL,
  `agente_id` int(11) DEFAULT NULL,
  `provvigione` int(11) NOT NULL,
  `campagna_id` int(11) DEFAULT NULL,
  `mod_pag_id` int(11) DEFAULT NULL,
  `note` text NOT NULL,
  `annullato` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NumAnnualeOrdine` (`anno`,`numero`),
  UNIQUE KEY `PrimaryKey` (`id`),
  KEY `Destinazione` (`cliente_id`,`destinazione_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `prodotti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modello_id` int(11) NOT NULL,
  `codice` int(11) NOT NULL DEFAULT '0',
  `descrizione` varchar(50) NOT NULL,
  `composizione` varchar(100) DEFAULT '',
  `prezzo_unitario` decimal(8,2) NOT NULL DEFAULT '0.00',
  `iva` tinyint(4) NOT NULL DEFAULT '0',
  `prezzo_conformato` decimal(8,2) DEFAULT NULL,
  `unita_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `campagna_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Codice Prodotto` (`codice`),
  UNIQUE KEY `descrizione_UNIQUE` (`descrizione`),
  KEY `fk_prodotti_modelli1_idx` (`modello_id`),
  KEY `fk_prodotti_unita1_idx` (`unita_id`),
  KEY `fk_prodotti_campagne1_idx` (`campagna_id`),
  CONSTRAINT `fk_prodotti_modelli1` FOREIGN KEY (`modello_id`) REFERENCES `modelli` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prodotti_unita1` FOREIGN KEY (`unita_id`) REFERENCES `unita` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prodotti_campagne1` FOREIGN KEY (`campagna_id`) REFERENCES `campagne` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subdettagli_bolle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dettagli_bolle_id` int(11) NOT NULL,
  `subdettaglio_ord_id` int(11) NOT NULL,
  `taglia` int(11) NOT NULL,
  `quantita` decimal(8,4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`id`),
  KEY `IDDettaglioBolla` (`dettagli_bolle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subdettagli_ordini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dettagli_ordini_id` int(11) NOT NULL,
  `taglia` int(11) NOT NULL,
  `quantita` decimal(8,4) NOT NULL,
  `qta_evasa` decimal(8,4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`id`),
  KEY `Taglie in ordine` (`dettagli_ordini_id`,`taglia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ultimi_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anno` int(11) NOT NULL,
  `ord_num` int(11) DEFAULT '0',
  `bolla_num` int(11) DEFAULT '0',
  `fatt_num` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PrimaryKey` (`anno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `unita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unita` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unita` (`unita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificativo` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `livello` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDUtente` (`id`),
  UNIQUE KEY `PrimaryKey` (`identificativo`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

CREATE TABLE `vettori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(50) NOT NULL DEFAULT '',
  `via` varchar(40) NOT NULL DEFAULT '',
  `citta` varchar(50) NOT NULL DEFAULT '',
  `provincia` varchar(2) NOT NULL DEFAULT '',
  `cap` varchar(5) NOT NULL DEFAULT '',
  `telefono1` varchar(15) NOT NULL DEFAULT '',
  `telefono2` varchar(15) NOT NULL DEFAULT '',
  `telefono3` varchar(15) NOT NULL DEFAULT '',
  `fax` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Vettore` (`descrizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Zonadescr` (`descrizione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

