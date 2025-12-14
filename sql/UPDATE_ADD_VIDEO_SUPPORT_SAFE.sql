-- ============================================
-- UPDATE: Safe Migration untuk Video Support
-- File: UPDATE_ADD_VIDEO_SUPPORT_SAFE.sql
-- ============================================
-- 
-- Script ini aman untuk dijalankan berulang kali (idempotent)
-- Akan menambahkan kolom hanya jika belum ada
--

-- Set safe update mode
SET SQL_SAFE_UPDATES = 0;

-- 1. Tambahkan kolom video_file_size jika belum ada
SET @dbname = DATABASE();
SET @tablename = 'materials';
SET @columnname = 'video_file_size';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT NULL COMMENT ''Ukuran file video dalam bytes''')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- 2. Tambahkan kolom video_duration jika belum ada
SET @columnname = 'video_duration';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @tablename, ' ADD COLUMN ', @columnname, ' INT DEFAULT NULL COMMENT ''Durasi video dalam detik''')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- 3. Tambahkan kolom video_thumbnail jika belum ada
SET @columnname = 'video_thumbnail';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @tablename, ' ADD COLUMN ', @columnname, ' VARCHAR(500) DEFAULT NULL COMMENT ''URL thumbnail/poster video''')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- 4. Tambahkan kolom is_video_based jika belum ada
SET @columnname = 'is_video_based';
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
  ) > 0,
  'SELECT 1',
  CONCAT('ALTER TABLE ', @tablename, ' ADD COLUMN ', @columnname, ' TINYINT(1) DEFAULT 0 COMMENT ''1 jika materi utama adalah video, 0 jika teks''')
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- 5. Update media_url ke TEXT jika masih VARCHAR
ALTER TABLE materials MODIFY COLUMN media_url TEXT;

-- 6. Tambahkan index jika belum ada (akan skip jika sudah ada)
CREATE INDEX IF NOT EXISTS idx_is_video_based ON materials (is_video_based);
CREATE INDEX IF NOT EXISTS idx_media_type ON materials (media_type);

-- 7. Update existing materials dengan media_type VIDEO
UPDATE materials SET is_video_based = 1 WHERE media_type = 'VIDEO' AND (is_video_based IS NULL OR is_video_based = 0);

-- Reset safe update mode
SET SQL_SAFE_UPDATES = 1;

-- Verify update
SELECT 
    'Video support columns added successfully!' AS Status,
    COUNT(*) AS total_materials,
    SUM(CASE WHEN is_video_based = 1 THEN 1 ELSE 0 END) AS video_based_materials
FROM materials;

-- Show new structure
DESCRIBE materials;

SELECT '✅ Database update completed successfully!' AS Result;
