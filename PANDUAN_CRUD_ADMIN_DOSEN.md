# 🎓 Panduan CRUD Video untuk Admin & Dosen

## ✅ FITUR YANG SUDAH TERSEDIA

Semua fitur CRUD (Create, Read, Update, Delete) untuk video pembelajaran **SUDAH LENGKAP** untuk Admin dan Dosen!

---

## 🔴 UNTUK ADMIN

### **Dashboard Admin:**
```
http://localhost:3000/admin/dashboard
```

### **Menu yang Tersedia:**

#### **1. Modul**
- List semua modul pembelajaran
- Bisa tambah, edit, hapus modul
- Lihat detail modul → List unit

#### **2. Materi** ⭐ **UNTUK MANAGE VIDEO**
- List SEMUA video dari semua unit
- Bisa edit dan hapus video langsung dari sini
- URL: `http://localhost:3000/admin/materials`

#### **3. Unit**
- List semua unit
- Dari sini bisa tambah video ke unit tertentu

---

## 📊 CRUD Video untuk ADMIN

### **✨ CREATE - Tambah Video Baru**

**Langkah 1: Pilih Unit**
```
Dashboard > Modul > Pilih Modul yang Ingin Ditambah Video
```

**Langkah 2: Tambah Materi**
```
Di tabel Unit, kolom "Aksi", klik "Tambah Materi"
```

**Langkah 3: Isi Form**
```
- Judul Video: (misal: "Keadilan Sosial di Era Digital")
- Deskripsi: (opsional, info tentang video)
- Metode Upload:
  • URL: Paste YouTube/Vimeo embed URL
  • File: Upload video dari komputer (max 200MB)
- Thumbnail: Upload gambar preview (opsional)
- Durasi: Isi dalam detik (misal: 126 untuk 2m6s)
```

**Langkah 4: Simpan**
```
Klik "Simpan Video"
Video akan muncul di unit tersebut
```

**URL Direct:**
```
http://localhost:3000/admin/units/{unitId}/materials/new

Contoh untuk Unit 3:
http://localhost:3000/admin/units/3/materials/new
```

---

### **📖 READ - Lihat Semua Video**

**Dari Dashboard:**
```
Dashboard > Materi
```

**Akan Tampil:**
- List semua video dari semua unit
- Setiap video ada tombol "Edit" dan "Hapus"
- Ada search box untuk cari video

**URL Direct:**
```
http://localhost:3000/admin/materials
```

**Info yang Ditampilkan:**
- Judul video
- Unit dan Modul asal
- Tipe media (VIDEO)
- Tanggal dibuat
- Tombol Edit & Hapus

---

### **✏️ UPDATE - Edit Video**

**Cara 1: Dari Halaman Materi**
```
Dashboard > Materi > Cari video > Klik "Edit"
```

**Cara 2: Direct URL**
```
http://localhost:3000/admin/units/{unitId}/materials/{materialId}/edit

Contoh:
http://localhost:3000/admin/units/3/materials/5/edit
```

**Yang Bisa Diedit:**
- Judul video
- Deskripsi
- **Ganti video** (upload file baru atau ubah URL)
- **Ganti thumbnail**
- Update durasi
- Ubah tipe media

**Preview Video:**
- Di halaman edit, video saat ini akan ditampilkan
- Bisa preview sebelum ganti

**Simpan:**
```
Klik "Simpan Perubahan"
File lama otomatis terhapus jika upload file baru
```

---

### **🗑️ DELETE - Hapus Video**

**Cara 1: Dari Halaman Materi**
```
Dashboard > Materi > Klik tombol "Hapus" (merah, kecil)
Konfirmasi → OK
Video terhapus
```

**Cara 2: Dari Halaman Edit**
```
Dashboard > Materi > Edit video
Scroll ke bawah
Klik tombol "🗑️ Hapus Video" (merah, besar, kiri bawah)
Konfirmasi → OK
Video terhapus
```

**Yang Terhapus:**
- ✅ Data video dari database
- ✅ File video dari server (jika upload file)
- ✅ Thumbnail dari server
- ✅ PERMANEN (tidak bisa di-undo)

---

## 🟢 UNTUK DOSEN/LECTURER

### **Dashboard Dosen:**
```
http://localhost:3000/lecturer/dashboard
```

### **CRUD Sama Persis dengan Admin!**

#### **CREATE:**
```
Dashboard Dosen > Modul > Pilih Modul > Tambah Materi
ATAU
http://localhost:3000/lecturer/units/3/materials/new
```

#### **READ:**
```
Dashboard Dosen > Materi
ATAU
http://localhost:3000/lecturer/materials
```

#### **UPDATE:**
```
Dashboard Dosen > Materi > Edit
ATAU
http://localhost:3000/lecturer/units/3/materials/5/edit
```

#### **DELETE:**
```
Dashboard Dosen > Materi > Hapus
Atau dari halaman Edit → "🗑️ Hapus Video"
```

---

## 🔄 Workflow CRUD Lengkap

### **Skenario 1: Tambah 7 Video ke Unit 3**

```
1. Login sebagai Admin/Dosen
2. Dashboard > Modul > Pilih Modul
3. Lihat tabel Unit, cari "Unit 3"
4. Klik "Tambah Materi" (pertama kali)
5. Upload video 1 → Simpan
6. Kembali ke Modul > Unit 3
7. Klik "Tambah Materi" lagi (kedua kali)
8. Upload video 2 → Simpan
9. Ulangi sampai 7 video
10. Selesai! Unit 3 punya 7 video
```

### **Skenario 2: Edit Video yang Salah Upload**

```
1. Dashboard > Materi
2. Cari video yang mau diedit
3. Klik "Edit"
4. Ganti file video atau URL
5. Update judul/deskripsi
6. Klik "Simpan Perubahan"
7. File lama otomatis terhapus
8. Video updated!
```

### **Skenario 3: Hapus Video yang Tidak Diperlukan**

```
1. Dashboard > Materi
2. Cari video yang mau dihapus
3. Klik "Hapus" (merah)
4. Popup konfirmasi muncul
5. Klik OK
6. Video terhapus permanen
7. File juga terhapus dari server
```

---

## 📋 Checklist Akses

### **Untuk Admin:**
- [ ] Bisa akses `/admin/materials` → Lihat semua video
- [ ] Bisa akses `/admin/units/3/materials/new` → Tambah video
- [ ] Bisa klik "Edit" di halaman Materi
- [ ] Bisa klik "Hapus" di halaman Materi
- [ ] Bisa hapus dari halaman Edit (tombol besar)

### **Untuk Dosen:**
- [ ] Bisa akses `/lecturer/materials` → Lihat semua video
- [ ] Bisa akses `/lecturer/units/3/materials/new` → Tambah video
- [ ] Bisa klik "Edit" di halaman Materi
- [ ] Bisa klik "Hapus" di halaman Materi
- [ ] Bisa hapus dari halaman Edit (tombol besar)

---

## 🎯 URL Penting

### **Admin:**
| Aksi | URL |
|------|-----|
| List semua video | `/admin/materials` |
| Tambah video Unit 3 | `/admin/units/3/materials/new` |
| Edit video ID 5 | `/admin/units/3/materials/5/edit` |
| List modul | `/admin/modules` |
| Detail modul | `/admin/modules/4` |

### **Dosen:**
| Aksi | URL |
|------|-----|
| List semua video | `/lecturer/materials` |
| Tambah video Unit 3 | `/lecturer/units/3/materials/new` |
| Edit video ID 5 | `/lecturer/units/3/materials/5/edit` |
| List modul | `/lecturer/modules` |
| Detail modul | `/lecturer/modules/4` |

---

## 💡 Tips & Tricks

### **Upload Multiple Video Cepat:**
1. Siapkan semua video di folder
2. Buka `/admin/units/3/materials/new`
3. Upload video 1 → Simpan
4. Browser auto-redirect
5. Back button → Form baru kosong
6. Upload video 2 → Simpan
7. Ulangi...

### **Manage Video per Unit:**
1. Dashboard > Modul > Detail Modul
2. Lihat tabel Unit
3. Setiap unit ada tombol "Tambah Materi"
4. Klik untuk tambah video ke unit spesifik

### **Lihat Semua Video Sekaligus:**
1. Dashboard > Materi
2. Akan tampil SEMUA video dari SEMUA unit
3. Bisa search berdasarkan judul
4. Edit/Hapus langsung dari sini

---

## 🚀 Kesimpulan

```
╔═══════════════════════════════════════════╗
║  ✅ CRUD ADMIN: LENGKAP                  ║
║  ✅ CRUD DOSEN: LENGKAP                  ║
║  ✅ CREATE: Upload video URL/File        ║
║  ✅ READ: List semua video               ║
║  ✅ UPDATE: Edit video & metadata        ║
║  ✅ DELETE: Hapus video + file           ║
║  ✅ STUDENT VIEW: Sudah berfungsi        ║
╚═══════════════════════════════════════════╝
```

**Semua fitur CRUD SUDAH READY & WORKING!** 🎉

---

**Updated:** 2025-12-14 16:00  
**Status:** ✅ CRUD Complete for Admin & Lecturer  
**Student View:** ✅ Working perfectly (as shown in screenshot)
