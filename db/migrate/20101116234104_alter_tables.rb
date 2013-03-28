class AlterTables < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE `matecal_dev`.`clienti`
            ADD CONSTRAINT `fk_clienti_mod_pags` '
            FOREIGN KEY (`mod_pag_id` )
            REFERENCES `matecal_dev`.`mod_pags` (`id` )
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
            ADD CONSTRAINT `fk_clienti_zone1`
            FOREIGN KEY (`zona_id` )
            REFERENCES `matecal_dev`.`zone` (`id` )
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          , ADD INDEX `fk_clienti_mod_pags` (`mod_pag_id` ASC)
          , ADD INDEX `fk_clienti_zone1` (`zona_id` ASC)
          , DROP PRIMARY KEY
          , ADD PRIMARY KEY (`id`, `mod_pag_id`, `zona_id`) ;"

  execute "ALTER TABLE `matecal_dev`.`destinazioni`
            ADD CONSTRAINT `fk_destinazioni_clienti1`
            FOREIGN KEY (`clienti_id` )
            REFERENCES `matecal_dev`.`clienti` (`id` )
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
          , ADD INDEX `fk_destinazioni_clienti1` (`clienti_id` ASC)
          , DROP PRIMARY KEY
          , ADD PRIMARY KEY (`id`, `clienti_id`)
          , DROP INDEX `primarykey`
          , ADD UNIQUE INDEX `primarykey` (`clienti_id` ASC, `id` ASC) ;"
  end

  def self.down
    execute "ALTER TABLE `matecal_dev`.`clienti`
            DROP CONSTRAINT `fk_clienti_mod_pags` ',
            DROP CONSTRAINT `fk_clienti_zone1`,
            DROP INDEX `fk_clienti_mod_pags`,
            DROP INDEX `fk_clienti_zone1` (`zona_id` ASC),
            DROP PRIMARY KEY;"
  execute "ALTER TABLE `matecal_dev`.`destinazioni`
            DROP CONSTRAINT `fk_destinazioni_clienti1`,
            DROP INDEX `fk_destinazioni_clienti1`,
            DROP PRIMARY KEY,
            DROP INDEX `primarykey`;"
  end
end
