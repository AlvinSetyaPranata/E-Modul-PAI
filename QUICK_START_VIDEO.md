# 🚀 Quick Start: Video Pembelajaran

## ⚡ Langkah Cepat (5 Menit)

### 1. Update Database (WAJIB)
```sql
-- Buka TablePlus/phpMyAdmin/MySQL Workbench
-- Jalankan file berikut:
sql/UPDATE_ADD_VIDEO_SUPPORT.sql
```

**Atau manual di terminal:**
```bash
mysql -u root -p emodul_pai < sql/UPDATE_ADD_VIDEO_SUPPORT.sql
```

### 2. Restart Server
```bash
# Stop server (Ctrl+C)
# Jalankan ulang
npm start
```

### 3. Upload Video Pertama
1. Login sebagai **Admin** atau **Dosen**
2. Navigasi: `Dashboard > Materi > Tambah Video Baru`
3. Pilih Unit
4. Upload video 15MB Anda atau paste URL YouTube

---

## 📹 Dua Cara Upload Video

### A. Upload File (untuk video Anda 15MB) ✅
- Klik "Upload File Video"
- Pilih file video (MP4/WEBM/MOV/AVI)
- Upload thumbnail (opsional)
- Isi durasi: **126** detik
- Simpan

### B. YouTube URL (RECOMMENDED) 🌟
- Upload video ke YouTube (unlisted jika private)
- Copy embed URL: `https://www.youtube.com/embed/VIDEO_ID`
- Paste di form
- Simpan

**Keuntungan YouTube:**
- ✅ Gratis unlimited storage
- ✅ Web tidak lemot (CDN YouTube)
- ✅ Streaming cepat

---

## ✅ Fitur yang Sudah Ready

**CRUD Lengkap:**
- ✅ Create (Upload video baru)
- ✅ Read (Lihat semua video)
- ✅ Update (Edit video/ganti file)
- ✅ Delete (Hapus video + file)

**Akses:**
- ✅ Admin: Full access
- ✅ Dosen: Full access
- ✅ Mahasiswa: View only (dengan lazy loading)

**Optimasi:**
- ✅ Lazy loading (video load saat diperlukan)
- ✅ Thumbnail preview
- ✅ Streaming (chunk-by-chunk)
- ✅ Auto file cleanup saat delete/update
- ✅ Progress tracking (localStorage)

---

## 📊 URL Routes

### Admin
- `/admin/materials` - List semua video
- `/admin/units/:unitId/materials/new` - Tambah video baru
- `/admin/units/:unitId/materials/:id/edit` - Edit video

### Dosen/Lecturer
- `/lecturer/materials` - List semua video
- `/lecturer/units/:unitId/materials/new` - Tambah video baru
- `/lecturer/units/:unitId/materials/:id/edit` - Edit video

### Student
- `/student/units/:unitId` - Lihat video pembelajaran

---

## 🔧 Troubleshooting Cepat

**Video tidak muncul?**
```bash
# Pastikan folder ada
mkdir -p public/uploads/videos
mkdir -p public/uploads/thumbnails
chmod 755 public/uploads
```

**Error saat upload?**
- Cek ukuran file max 100MB
- Format video: MP4, WEBM, MOV, AVI
- Restart server setelah update database

**Database error?**
```sql
-- Cek apakah kolom sudah ada
DESCRIBE materials;
-- Jika belum, jalankan UPDATE_ADD_VIDEO_SUPPORT.sql
```

---

## 📖 Dokumentasi Lengkap

Untuk panduan detail, lihat:
- `PANDUAN_VIDEO_PEMBELAJARAN.md` - User guide lengkap
- `IMPLEMENTASI_VIDEO_SUMMARY.md` - Technical details

---

## 🎯 Tips Pro

1. **Kompres video sebelum upload**
   - Target: 720p, 1-2 Mbps
   - Tool: HandBrake (gratis)

2. **Gunakan YouTube untuk video >50MB**
   - Lebih cepat dan hemat storage

3. **Tambahkan thumbnail**
   - Lebih menarik dan faster loading

4. **Isi deskripsi video**
   - Bantu mahasiswa memahami konten

---

## ✨ Status: READY FOR USE

Sistem sudah **siap digunakan**. Tinggal:
1. ✅ Jalankan SQL update
2. ✅ Restart server
3. ✅ Upload video pertama

**Selamat menggunakan! 🎓**
