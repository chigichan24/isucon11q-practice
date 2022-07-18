DROP TABLE IF EXISTS `isu_association_config`;
DROP TABLE IF EXISTS `isu_condition`;
DROP TABLE IF EXISTS `isu`;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `isu` (
  `id` bigint AUTO_INCREMENT,
  `jia_isu_uuid` CHAR(36) NOT NULL UNIQUE,
  `name` VARCHAR(255) NOT NULL,
  `image` LONGBLOB,
  `character` VARCHAR(255),
  `jia_user_id` VARCHAR(255) NOT NULL,
  `created_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
   PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE `isu_condition` (
  `id` bigint AUTO_INCREMENT,
  `jia_isu_uuid` CHAR(36) NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `is_sitting` TINYINT(1) NOT NULL,
  `condition` VARCHAR(255) NOT NULL,
  `message` VARCHAR(255) NOT NULL,
  `created_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE `user` (
  `jia_user_id` VARCHAR(255) PRIMARY KEY,
  `created_at` DATETIME(6) DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE `isu_association_config` (
  `name` VARCHAR(255) PRIMARY KEY,
  `url` VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4;

ALTER TABLE `isu_condition` ADD INDEX idx_jia_isu_uuid_timestamp(`jia_isu_uuid`, `timestamp`);

ALTER TABLE `isu_condition` ADD COLUMN `is_dirty` TINYINT(1) GENERATED ALWAYS AS (CASE 
 WHEN condition = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 0
 WHEN condition = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) VIRTUAL;

ALTER TABLE `isu_condition` ADD COLUMN `is_overweight` TINYINT(1) GENERATED ALWAYS AS (CASE 
 WHEN condition = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 1
 WHEN condition = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 0
 WHEN condition = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) VIRTUAL;

ALTER TABLE `isu_condition` ADD COLUMN `is_broken` TINYINT(1) GENERATED ALWAYS AS (CASE 
 WHEN condition = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 1
 WHEN condition = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 1
 WHEN condition = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 0
 WHEN condition = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) VIRTUAL;