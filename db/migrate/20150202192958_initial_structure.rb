class InitialStructure < ActiveRecord::Migration
  def up
  	connection.execute %Q(
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `optiontypes`;
CREATE TABLE IF NOT EXISTS `optiontypes` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `optiontype_id` int(12) unsigned NOT NULL,
  `value` varchar(100) NOT NULL,
  `description` text,
  `rpmA` float NOT NULL DEFAULT '0',
  `rpmB` float NOT NULL DEFAULT '0',
  `rpmC` float NOT NULL DEFAULT '0',
  `rpmD` float NOT NULL DEFAULT '0',
  `rpmE` float NOT NULL DEFAULT '0',
  `modifier` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int( 12 ) unsigned NOT NULL AUTO_INCREMENT ,
  `player_id` int(11) unsigned NOT NULL,
  `name` varchar( 32 ) NOT NULL DEFAULT 'New city',
  `lat` float(10,6) DEFAULT NULL,
  `lng` float(10,6) DEFAULT NULL,  
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `calculated_at`  datetime DEFAULT NULL ,
  `resA` int( 12 ) NOT NULL DEFAULT '0',
  `resB` int( 12 ) NOT NULL DEFAULT '0',
  `resC` int( 12 ) NOT NULL DEFAULT '0',
  `resD` int( 12 ) NOT NULL DEFAULT '0',
  `resE` int( 12 ) NOT NULL DEFAULT '0',
  PRIMARY KEY ( `id` )
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE IF NOT EXISTS `buildings` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(12) unsigned NOT NULL,
  `building_type` int(12) unsigned NOT NULL,
  `lvl` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `loc` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `finished_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_id_loc` (`city_id`,`loc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  	)
  end
end
