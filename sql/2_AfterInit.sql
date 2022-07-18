ALTER TABLE `isu_condition` ADD COLUMN `is_dirty` TINYINT(1) NOT NULL GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) VIRTUAL;

ALTER TABLE `isu_condition` ADD COLUMN `is_overweight` TINYINT(1) NOT NULL GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) VIRTUAL;

ALTER TABLE `isu_condition` ADD COLUMN `is_broken` TINYINT(1) NOT NULL GENERATED ALWAYS AS (CASE 
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=false,is_overweight=true,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=false,is_broken=true' THEN 1
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=false' THEN 0
 WHEN `condition` = 'is_dirty=true,is_overweight=true,is_broken=true' THEN 1
 END) VIRTUAL;