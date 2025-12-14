-- ============================================
-- UPDATE: Menambahkan Support Video untuk Materials
-- File: UPDATE_ADD_VIDEO_SUPPORT.sql
-- ============================================
-- 
-- Script ini menambahkan field untuk mendukung video pembelajaran
-- yang menggantikan konten teks tradisional
--

-- 1. Tambahkan kolom video_file_size untuk tracking ukuran file
ALTER TABLE materials ADD COLUMN video_file_size INT DEFAULT NULL COMMENT 'Ukuran file video dalam bytes';

-- 2. Tambahkan kolom video_duration untuk durasi video
ALTER TABLE materials ADD COLUMN video_duration INT DEFAULT NULL COMMENT 'Durasi video dalam detik';

-- 3. Tambahkan kolom video_thumbnail untuk preview
ALTER TABLE materials ADD COLUMN video_thumbnail VARCHAR(500) DEFAULT NULL COMMENT 'URL thumbnail/poster video';

-- 4. Tambahkan kolom is_video_based untuk identifikasi materi berbasis video
ALTER TABLE materials ADD COLUMN is_video_based TINYINT(1) DEFAULT 0 COMMENT '1 jika materi utama adalah video, 0 jika teks';

-- 5. Update column media_url untuk VARCHAR yang lebih besar (support long URLs)
ALTER TABLE materials MODIFY COLUMN media_url TEXT;

-- 6. Tambahkan index untuk performa query
ALTER TABLE materials ADD INDEX idx_is_video_based (is_video_based);
ALTER TABLE materials ADD INDEX idx_media_type (media_type);

-- Update existing materials dengan media_type VIDEO to set is_video_based = 1
UPDATE materials SET is_video_based = 1 WHERE media_type = 'VIDEO';

-- ============================================
-- CATATAN PENGGUNAAN:
-- ============================================
-- 1. Jalankan script ini di database MySQL Anda
-- 2. Pastikan backup database terlebih dahulu
-- 3. Field video_file_size digunakan untuk tracking size (dalam bytes)
-- 4. Field video_duration digunakan untuk durasi (dalam detik)
-- 5. Field video_thumbnail untuk preview image sebelum video dimuat
-- 6. Field is_video_based membedakan materi video vs teks
-- ============================================
