ALTER TABLE `isu_condition` ADD COLUMN `is_dirty` TINYINT(1) GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) STORED;

ALTER TABLE `isu_condition` ADD COLUMN `is_overweight` TINYINT(1) GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) STORED;

ALTER TABLE `isu_condition` ADD COLUMN `is_broken` TINYINT(1) GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) STORED;


ALTER TABLE `isu_condition` ADD COLUMN `level` INTEGER GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 2
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 2
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 2
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 3
 END) STORED;