# 🔧 QUICK FIX: Error "Gagal memperbarui materi"

## ❌ Error yang Terjadi
```
Update material error: Error: Bind parameters must not contain undefined
```

## ✅ Sudah Diperbaiki

### 1. **Backend Routes** (FIXED)
File yang sudah diperbaiki:
- ✅ `src/routes/admin.js` - Handle undefined values dengan default null
- ✅ `src/routes/lecturer.js` - Handle undefined values dengan default null

### 2. **Database Migration** (PERLU DIJALANKAN)
File SQL yang aman untuk dijalankan:
- ✅ `sql/UPDATE_ADD_VIDEO_SUPPORT_SAFE.sql` - Safe migration (idempotent)

---

## ⚡ Langkah Perbaikan (2 Menit)

### **Langkah 1: Update Database** (WAJIB)

Buka **TablePlus** atau **MySQL Workbench**, lalu jalankan:

**File: `sql/UPDATE_ADD_VIDEO_SUPPORT_SAFE.sql`**

Script ini AMAN dan bisa dijalankan berulang kali tanpa error.

**Atau via terminal:**
```bash
mysql -u root -p emodul_pai < d:\EModul\sql\UPDATE_ADD_VIDEO_SUPPORT_SAFE.sql
```

### **Langkah 2: Restart Server Node.js** (WAJIB)

```bash
# Di terminal npm start, tekan Ctrl+C untuk stop
# Lalu jalankan ulang:
npm start
```

---

## 🧪 Test Setelah Fix

### Test 1: Edit Materi yang Sudah Ada
1. Login sebagai Admin
2. Buka "Materi" > Pilih materi yang sudah ada
3. Klik "Edit"
4. Ubah judul atau deskripsi (JANGAN upload file baru dulu)
5. Klik "Simpan Perubahan"
6. **Expected:** ✅ Berhasil tersimpan tanpa error

### Test 2: Upload Video Baru
1. Login sebagai Admin
2. Pilih unit yang ingin ditambah video
3. Klik "Tambah Video Baru"
4. Pilih metode:
   - **URL:** Paste YouTube embed URL
   - **File:** Upload video file Anda
5. Isi judul, deskripsi, dan durasi
6. Klik "Simpan Video"
7. **Expected:** ✅ Video berhasil terupload

### Test 3: Edit Video dengan Upload File Baru
1. Edit video yang sudah ada
2. Pilih "Upload File Video"
3. Upload video baru
4. Klik "Simpan Perubahan"
5. **Expected:** ✅ File lama terhapus, file baru tersimpan

---

## 🔍 Apa yang Diperbaiki?

### Problem:
Field baru (`video_thumbnail`, `video_file_size`, `video_duration`) belum ada di database untuk materi yang sudah ada sebelumnya. Saat edit materi lama, values jadi `undefined` dan menyebabkan SQL error.

### Solution:
1. **Backend:** Tambahkan default `|| null` untuk semua field video
   ```javascript
   // BEFORE
   let thumbnailUrl = oldMaterial.video_thumbnail;
   
   // AFTER
   let thumbnailUrl = oldMaterial.video_thumbnail || null;
   ```

2. **Database:** Jalankan safe migration yang menambah kolom hanya jika belum ada

---

## 📊 Verifikasi Database

Setelah jalankan SQL, cek apakah kolom sudah ada:

```sql
DESCRIBE materials;
```

**Expected output harus ada:**
- `video_file_size` INT
- `video_duration` INT
- `video_thumbnail` VARCHAR(500)
- `is_video_based` TINYINT(1)
- `media_url` TEXT

---

## ✅ Checklist

- [ ] Jalankan `UPDATE_ADD_VIDEO_SUPPORT_SAFE.sql`
- [ ] Restart Node.js server
- [ ] Test edit materi lama → Berhasil ✅
- [ ] Test upload video baru → Berhasil ✅
- [ ] Test edit video dengan upload file → Berhasil ✅

---

## 🎯 Setelah Fix, Sistem Akan:

✅ Edit materi lama tanpa error
✅ Upload video baru (file atau URL)
✅ Edit video dengan ganti file
✅ Handle backward compatibility (materi lama tetap bisa diedit)
✅ Support video 200MB, 5-10 menit
✅ Support 7+ video per unit

---

## 📞 Troubleshooting

**Jika masih error setelah fix:**

1. **Cek database:**
   ```sql
   SELECT * FROM materials LIMIT 1;
   ```
   Pastikan kolom `video_thumbnail`, `video_file_size`, `video_duration`, `is_video_based` ada.

2. **Cek terminal error:**
   - Baca error message
   - Pastikan server sudah direstart setelah jalankan SQL

3. **Clear browser cache:**
   - Tekan `Ctrl + Shift + R` (hard refresh)
   - Atau buka incognito mode

---

## 🚀 Status Fix

```
╔═══════════════════════════════════════╗
║  ✅ BACKEND: FIXED                   ║
║  ✅ SQL MIGRATION: READY             ║
║  ⏳ USER ACTION: Run SQL + Restart   ║
╚═══════════════════════════════════════╝
```

**Tinggal 2 langkah:**
1. Jalankan SQL safe migration
2. Restart server

**Selesai! Error akan hilang.** ✅

---

**Updated:** 2025-12-14 13:25  
**Status:** READY TO FIX
