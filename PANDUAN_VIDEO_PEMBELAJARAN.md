# 🎥 Panduan Upload dan Kelola Video Pembelajaran

## 📚 Daftar Isi
1. [Persiapan Database](#persiapan-database)
2. [Cara Upload Video](#cara-upload-video)
3. [Optimasi Performa](#optimasi-performa)
4. [Troubleshooting](#troubleshooting)
5. [Best Practices](#best-practices)

---

## 1. Persiapan Database

### Update Database Schema
Jalankan SQL script untuk menambahkan support video:

```bash
# Buka software database Anda (TablePlus, phpMyAdmin, MySQL Workbench, dll)
# Jalankan file: sql/UPDATE_ADD_VIDEO_SUPPORT.sql
```

**Script SQL akan:**
- Menambahkan field `video_file_size` (ukuran file dalam bytes)
- Menambahkan field `video_duration` (durasi dalam detik)
- Menambahkan field `video_thumbnail` (URL thumbnail/poster)
- Menambahkan field `is_video_based` (flag untuk materi berbasis video)
- Menambahkan index untuk optimasi query

---

## 2. Cara Upload Video

### A. Untuk Admin/Dosen

#### Metode 1: Upload File Video Langsung

**Step-by-step:**
1. Login sebagai Admin atau Dosen
2. Navigasi ke `Admin/Dosen > Materi > Tambah Video Baru`
3. Pilih unit yang ingin ditambahkan video
4. Isi form:
   - **Judul Video**: Beri judul yang jelas (misal: "Etika Digital dan Akhlakul Karimah")
   - **Deskripsi**: Tambahkan ringkasan atau poin penting (opsional)
   - **Metode Upload**: Pilih "Upload File Video"
   - **File Video**: Klik atau drag-drop file video Anda
     - Format: MP4, WEBM, MOV, AVI
     - Max size: 100MB
     - Durasi Anda: 2 menit 6 detik (126 detik)
     - Ukuran Anda: ~15MB ✅
   - **Thumbnail** (opsional): Upload gambar preview
   - **Durasi**: 126 (detik)
5. Klik "Simpan Video"

**✅ Kelebihan:**
- Video disimpan di server Anda
- Tidak bergantung pada platform eksternal
- Kontrol penuh atas konten

**⚠️ Perhatian:**
- Pastikan disk space server cukup
- Upload membutuhkan waktu sesuai kecepatan internet
- Video 15MB dengan koneksi 10 Mbps = ~12 detik upload

#### Metode 2: Gunakan URL Video (YouTube/Vimeo)

**Step-by-step:**
1. Upload video Anda ke YouTube atau Vimeo terlebih dahulu
2. Dapatkan embed URL:
   
   **Untuk YouTube:**
   - Buka video di YouTube
   - Klik tombol "Share"
   - Klik "Embed"
   - Salin URL dari `src="..."`
   - Contoh: `https://www.youtube.com/embed/dQw4w9WgXcQ`

   **Untuk Vimeo:**
   - Buka video di Vimeo
   - Klik "Share"
   - Salin link dari embed code
   - Contoh: `https://player.vimeo.com/video/123456789`

3. Di form E-Modul:
   - Pilih "URL/Link Video"
   - Paste embed URL
   - Isi judul dan deskripsi
   - Klik "Simpan Video"

**✅ Kelebihan:**
- Tidak menghabiskan storage server
- Streaming lebih cepat (CDN YouTube/Vimeo)
- Tidak ada limit ukuran file
- Web akan lebih cepat/tidak lemot

**💡 Rekomendasi:** Gunakan metode ini untuk performa optimal!

---

### B. Edit Video yang Sudah Ada

1. Navigasi ke `Admin/Dosen > Materi`
2. Cari materi yang ingin diedit
3. Klik tombol "Edit"
4. Form akan menampilkan video saat ini
5. Anda bisa:
   - Ganti judul/deskripsi
   - Upload video baru (file lama akan otomatis terhapus)
   - Ganti URL video
   - Update thumbnail
   - Update durasi
6. Klik "Simpan Perubahan"

---

### C. Hapus Video (CRUD - Delete)

1. Navigasi ke `Admin/Dosen > Materi`
2. Cari materi yang ingin dihapus
3. Klik tombol "Hapus"
4. Konfirmasi penghapusan
5. File video dan thumbnail akan otomatis terhapus dari server

---

## 3. Optimasi Performa (Agar Web Tidak Lemot)

### Strategi Optimasi yang Sudah Diterapkan:

#### A. **Lazy Loading**
- Video tidak langsung dimuat saat halaman dibuka
- Video hanya dimuat ketika akan ditonton
- Menghemat bandwidth dan mempercepat loading halaman

```html
<!-- Thumbnail muncul dulu, video dimuat saat diklik -->
<video preload="metadata" ...>
```

#### B. **Compression & Format**
**Rekomendasi encoding video:**
```bash
# Gunakan HandBrake atau FFmpeg untuk kompres video
# Target: 720p, H.264, AAC audio

ffmpeg -i input.mp4 -vcodec h264 -acodec aac -b:v 1500k -b:a 128k output.mp4
```

**Pengaturan optimal:**
- Resolusi: 720p (1280x720) atau 480p (854x480)
- Bitrate Video: 1-2 Mbps
- Bitrate Audio: 128 kbps
- Format: MP4 (H.264)
- Frame rate: 24-30 fps

#### C. **Streaming instead of Download**
- Video distream chunk-by-chunk, bukan download penuh
- Browser hanya download bagian yang sedang ditonton
- Mengurangi beban server dan client

#### D. **CDN untuk Video Eksternal**
- YouTube/Vimeo menggunakan CDN global
- Loading lebih cepat dari berbagai lokasi
- Mengurangi beban server Anda

#### E. **Database Indexing**
- Index pada field `is_video_based`, `media_type`
- Query lebih cepat saat load halaman material

#### F. **Client-Side Caching**
```javascript
// Progress tracking disimpan di localStorage
localStorage.setItem('watchedVideos', JSON.stringify(watchedVideos));
```

#### G. **Thumbnail/Poster Image**
- Gambar ringan ditampilkan sebelum video dimuat
- User bisa preview sebelum klik play
- Hemat bandwidth

---

### Tips Agar Web Tetap Cepat:

1. **Batasi Jumlah Video Per Halaman**
   - Gunakan pagination jika ada banyak video
   - Tampilkan maksimal 5-10 video per halaman

2. **Gunakan Format yang Tepat**
   - MP4 (H.264) untuk kompatibilitas terbaik
   - WebM untuk file lebih kecil (tapi kurang support di Safari)

3. **Compress Thumbnail**
   - Maksimal 200KB per thumbnail
   - Gunakan WebP jika memungkinkan (75% lebih kecil dari JPG)

4. **Monitor Server Resources**
   ```bash
   # Cek disk space
   df -h
   
   # Cek memory usage
   free -m
   ```

5. **Enable Browser Caching**
   - Video yang sudah pernah dimuat akan di-cache browser
   - Loading berikutnya lebih cepat

---

## 4. Troubleshooting

### Masalah 1: Video Tidak Muncul/Error 404

**Solusi:**
- Pastikan folder `/public/uploads/videos/` ada dan writable
- Cek permission folder: `chmod 755 public/uploads`
- Pastikan file video benar-benar terupload
- Cek path di database: `SELECT media_url FROM materials WHERE id = X`

### Masalah 2: Upload Video Gagal - File Terlalu Besar

**Solusi:**
- Kompres video terlebih dahulu (gunakan HandBrake/FFmpeg)
- Update limit di `src/middleware/videoUpload.js`:
  ```javascript
  limits: { fileSize: 200 * 1024 * 1024 } // 200MB
  ```
- Update PHP limits (jika ada):
  ```ini
  upload_max_filesize = 200M
  post_max_size = 200M
  ```

### Masalah 3: Video Lambat/Buffering

**Solusi:**
1. **Gunakan YouTube/Vimeo** untuk video besar
2. **Kompres video** dengan bitrate lebih rendah
3. **Enable gzip compression** di server:
   ```nginx
   gzip_types video/mp4;
   ```
4. **Gunakan CDN** seperti Cloudflare

### Masalah 4: Database Error

**Solusi:**
```sql
-- Cek apakah kolom sudah ada
DESCRIBE materials;

-- Jika belum ada, jalankan UPDATE_ADD_VIDEO_SUPPORT.sql
SOURCE sql/UPDATE_ADD_VIDEO_SUPPORT.sql;
```

### Masalah 5: Thumbnail Tidak Muncul

**Solusi:**
- Pastikan folder `/public/uploads/thumbnails/` ada
- Cek format gambar (JPG/PNG/WEBP only)
- Maksimal size 5MB
- Cek permission: `chmod 755 public/uploads/thumbnails`

---

## 5. Best Practices

### ✅ DO (Lakukan):

1. **Kompres video sebelum upload**
   - Target: 720p, 1-2 Mbps
   - Tool: HandBrake, FFmpeg, Adobe Media Encoder

2. **Gunakan YouTube untuk video > 50MB**
   - Gratis, unlimited storage
   - Streaming cepat dengan CDN
   - Tidak membebani server Anda

3. **Tambahkan thumbnail custom**
   - Lebih menarik
   - Faster perceived loading time
   - Preview konten video

4. **Isi deskripsi video**
   - Bantu mahasiswa pahami konten
   - SEO-friendly
   - Accessibility

5. **Test di berbagai device**
   - Desktop, tablet, mobile
   - Chrome, Firefox, Safari
   - Koneksi cepat & lambat

6. **Backup database reguler**
   ```bash
   mysqldump -u root -p emodul_pai > backup_$(date +%Y%m%d).sql
   ```

### ❌ DON'T (Jangan):

1. **Jangan upload video RAW/uncompressed**
   - File terlalu besar
   - Loading lambat
   - Boros bandwidth

2. **Jangan gunakan format eksotis**
   - Stick to MP4 (H.264)
   - Hindari AVI, FLV, WMV

3. **Jangan lupa isi durasi video**
   - Penting untuk tracking
   - Mahasiswa tahu berapa lama video

4. **Jangan upload video dengan kualitas terlalu rendah**
   - Minimal 480p
   - Audio jelas (128 kbps)

5. **Jangan delete file manual dari server**
   - Gunakan fitur delete di aplikasi
   - Database dan file akan sync otomatis

---

## 📊 Monitoring Performa

### Check Loading Speed
```javascript
// Paste di Browser Console
performance.getEntriesByType("navigation")[0].loadEventEnd
```

### Check Video Load Time
```javascript
const video = document.querySelector('video');
video.addEventListener('loadeddata', function() {
  console.log('Video loaded in:', performance.now(), 'ms');
});
```

### Server Monitoring
```bash
# CPU Usage
top

# Memory Usage
free -m

# Disk Space
df -h

# Network Usage
iftop
```

---

## 🎯 Kesimpulan

Sistem video pembelajaran ini dirancang untuk:
✅ **Mudah digunakan** - Interface intuitif untuk admin/dosen
✅ **Performa tinggi** - Lazy loading, compression, CDN ready
✅ **Flexible** - Support upload file atau URL external
✅ **Scalable** - Siap untuk ratusan video
✅ **Stabil** - Error handling dan validation lengkap

**Rekomendasi Utama:**
- Video < 50MB: Upload ke server
- Video > 50MB: Gunakan YouTube/Vimeo
- Selalu kompres video sebelum upload
- Tambahkan thumbnail untuk UX lebih baik

---

## 📞 Need Help?

Jika ada masalah atau pertanyaan:
1. Cek section [Troubleshooting](#troubleshooting)
2. Review kode di `src/routes/admin.js` dan `src/middleware/videoUpload.js`
3. Pastikan database sudah diupdate dengan `UPDATE_ADD_VIDEO_SUPPORT.sql`

**Happy Teaching! 🎓**
