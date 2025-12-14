# 📹 Cara Upload Multiple Video & Menghapus Video

## ✅ UPDATE TERBARU

Sistem sudah diperbaiki dengan fitur:
1. ✅ **Upload multiple video per unit** (7+ video tidak masalah)
2. ✅ **Hapus video** dengan tombol Delete
3. ✅ **Auto-delete file** (video + thumbnail terhapus otomatis)

---

## 🎯 CARA UPLOAD MULTIPLE VIDEO (Yang Benar)

### **Skenario: Upload 7 Video ke Unit 3**

#### **Langkah-langkah:**

**1. Upload Video Pertama** ✅
```
a. Login sebagai Admin
b. Dashboard > Modul > Pilih modul yang ingin ditambah video
c. Lihat tabel unit, cari "Unit 3: ..."
d. Klik tombol "Tambah Materi" di kolom Aksi
   → URL akan: /admin/units/3/materials/new
e. Upload video 1, isi judul, deskripsi dll
f. Klik "Simpan Video"
g. Video 1 berhasil tersimpan ✅
```

**2. Upload Video Kedua** ✅
```
a. JANGAN klik Edit di video 1!
b. Kembali ke halaman Modul > Unit (atau ke /admin/modules/X)
c. Lihat tabel unit, cari "Unit 3: ..." LAGI
d. Klik tombol "Tambah Materi" LAGI
   → Pastikan URL: /admin/units/3/materials/new (bukan /edit)
e. Upload video 2, isi judul berbeda
f. Klik "Simpan Video"
g. Video 2 tersimpan, video 1 tetap ada ✅
```

**3. Upload Video 3, 4, 5, 6, 7** ✅
```
Ulangi langkah nomor 2 sebanyak 5 kali lagi
Pastikan selalu klik "Tambah Materi" dari halaman Modul
JANGAN klik "Edit" kecuali mau mengedit video yang sudah ada
```

---

## ❌ **KESALAHAN YANG SERING TERJADI**

### Kesalahan 1: Klik "Edit" untuk Upload Video Baru
```
❌ SALAH:
Video 1 upload → Klik "Edit" → Upload video baru
Hasil: Video 2 menggantikan Video 1

✅ BENAR:
Video 1 upload → Kembali ke Modul → Klik "Tambah Materi" → Upload video 2
Hasil: Video 1 dan Video 2 keduanya ada
```

### Kesalahan 2: Dari Halaman Materials List
```
❌ SALAH:
Dashboard > Materi > Klik "Edit" video terakhir → Upload video baru
Hasil: Video lama tergantikan

✅ BENAR:
Dashboard > Modul > Pilih Modul > Lihat Unit > Klik "Tambah Materi"
Hasil: Video baru ditambahkan, video lama tetap ada
```

---

## 🗑️ **CARA MENGHAPUS VIDEO**

### **Metode 1: Dari Halaman Materi**

```
1. Dashboard > Materi (atau /admin/materials)
2. Cari video yang ingin dihapus
3. Klik tombol "Hapus" (warna merah)
4. Konfirmasi: Klik "OK"
5. Video terhapus (file + database) ✅
```

### **Metode 2: Dari Terminal/TablePlus** (Manual)

**Via SQL:**
```sql
-- Lihat semua video di unit tertentu
SELECT id, title, media_url FROM materials WHERE unit_id = 3;

-- Hapus video tertentu
DELETE FROM materials WHERE id = 17;
```

**⚠️ Warning:** File video tidak terhapus otomatis jika manual via SQL.
Lebih baik gunakan tombol Delete di aplikasi.

---

## 📊 **Cek Apakah Multiple Video Berhasil**

### Via Aplikasi:
```
1. Login sebagai Admin
2. Dashboard > Materi
3. Filter by unit atau modul
4. Hitung jumlah video di unit yang sama
```

### Via SQL:
```sql
-- Lihat semua video di unit 3
SELECT id, title, created_at, media_type 
FROM materials 
WHERE unit_id = 3 
ORDER BY created_at ASC;
```

**Expected:**
```
| id | title           | created_at          |
|----|-----------------|---------------------|
| 1  | Video 1: ...    | 2025-12-14 13:00:00 |
| 2  | Video 2: ...    | 2025-12-14 13:05:00 |
| 3  | Video 3: ...    | 2025-12-14 13:10:00 |
... (sampai 7 video)
```

---

## 🎬 **Student View: Lihat Multiple Video**

### Cara Student Melihat:
```
1. Login sebagai Student
2. Dashboard > Modul > Pilih Modul
3. Klik Unit 3
4. Semua 7 video akan tampil dalam grid/list
5. Klik play di video mana saja untuk menonton
```

**Expected:**
- ✅ Semua video tampil
- ✅ Lazy loading (video tidak auto-load semua)
- ✅ Bisa klik satu-satu
- ✅ Web tidak lemot

---

## 🔧 **Troubleshooting**

### Problem 1: Video Baru Menggantikan yang Lama

**Penyebab:** URL yang dibuka adalah `/edit` bukan `/new`

**Solusi:**
```
Pastikan URL saat upload video baru:
✅ BENAR: /admin/units/3/materials/new
❌ SALAH: /admin/units/3/materials/2/edit
```

### Problem 2: Tidak Ada Tombol "Tambah Materi"

**Penyebab:** Belum restart server setelah update

**Solusi:**
```bash
# Stop server
Ctrl + C

# Restart
npm start
```

### Problem 3: Tombol "Hapus" Tidak Muncul

**Penyebab:** File `views/admin/materials/index.ejs` belum terupdate

**Solusi:**
```
Pastikan file sudah ada tombol DELETE
Restart server
Clear browser cache (Ctrl + Shift + R)
```

### Problem 4: Error Saat Hapus Video

**Penyebab:** Route DELETE belum ada atau belum restart server

**Solusi:**
```
Pastikan file src/routes/admin.js sudah ada route:
router.delete('/units/:unitId/materials/:id', ...)

Restart server: Ctrl+C lalu npm start
```

---

## ✅ **Checklist Verifikasi**

Setelah restart server, test:

- [ ] Upload video 1 ke unit 3 → Berhasil ✅
- [ ] Kembali ke Modul → Klik "Tambah Materi" lagi
- [ ] Upload video 2 ke unit 3 → Berhasil ✅
- [ ] Cek /admin/materials → Ada 2 video dari unit 3 ✅
- [ ] Klik "Hapus" di salah satu video → Video terhapus ✅
- [ ] Lanjutkan upload video 3, 4, 5, 6, 7 → Semua berhasil ✅
- [ ] Login as Student → Lihat unit 3 → 7 video tampil ✅
- [ ] Web tidak lemot → Konfirm ✅

---

## 📋 **Summary: Route Penting**

| Route | Method | Fungsi |
|-------|--------|--------|
| `/admin/units/:unitId/materials/new` | GET | Form tambah video BARU |
| `/admin/units/:unitId/materials` | POST | Submit video baru (CREATE) |
| `/admin/units/:unitId/materials/:id/edit` | GET | Form edit video LAMA |
| `/admin/units/:unitId/materials/:id` | PUT | Update video lama (UPDATE) |
| `/admin/units/:unitId/materials/:id` | DELETE | Hapus video (DELETE) |

---

## 🎯 **Workflow yang Benar**

### Upload 7 Video:

```
1. Modul > Unit 3 > "Tambah Materi" → Upload Video 1 → Simpan
2. Modul > Unit 3 > "Tambah Materi" → Upload Video 2 → Simpan
3. Modul > Unit 3 > "Tambah Materi" → Upload Video 3 → Simpan
4. Modul > Unit 3 > "Tambah Materi" → Upload Video 4 → Simpan
5. Modul > Unit 3 > "Tambah Materi" → Upload Video 5 → Simpan
6. Modul > Unit 3 > "Tambah Materi" → Upload Video 6 → Simpan
7. Modul > Unit 3 > "Tambah Materi" → Upload Video 7 → Simpan
```

**Result:** 7 video tersimpan di Unit 3 ✅

---

## 🚀 **Yang Harus Dilakukan Sekarang**

1. ✅ Restart server (Ctrl+C lalu npm start)
2. ✅ Test upload 2 video ke unit yang sama
3. ✅ Verifikasi keduanya ada (tidak saling menggantikan)
4. ✅ Test tombol Delete
5. ✅ Upload 7 video ke satu unit
6. ✅ Cek student view

---

**Updated:** 2025-12-14 14:00  
**Status:** ✅ READY - Multiple video & Delete support  
**Next:** Upload video Anda dan test
