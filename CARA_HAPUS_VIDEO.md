# 🗑️ Cara Hapus Video - MUDAH!

## ✅ UPDATE: Tombol Hapus Video Sudah Ditambahkan!

Sekarang ada **2 cara** untuk hapus video:

---

## 🎯 CARA 1: Dari Halaman Edit Video (TERMUDAH)

### Langkah-langkah:

**1. Buka Video yang Ingin Dihapus**
```
a. Dashboard > Materi
b. Cari video yang ingin dihapus
c. Klik "Edit"
```

**2. Klik Tombol "Hapus Video"**
```
a. Di halaman Edit, lihat bagian bawah form
b. Ada tombol merah besar: "🗑️ Hapus Video"
c. Tombol ini di kiri bawah, terpisah dari "Simpan Perubahan"
```

**3. Konfirmasi Hapus**
```
a. Popup muncul dengan konfirmasi:
   "🗑️ HAPUS VIDEO INI?
   
   Judul: [Nama Video]
   
   Video dan file terkait akan dihapus PERMANEN.
   
   Lanjutkan?"

b. Klik "OK" untuk hapus
c. Klik "Cancel" untuk batal
```

**4. Video Terhapus!**
```
✅ Video dihapus dari database
✅ File video dihapus dari server
✅ Thumbnail dihapus dari server
✅ Redirect ke halaman Materi
```

---

## 🎯 CARA 2: Dari Halaman List Materials

### Langkah-langkah:

**1. Buka Halaman Materi**
```
Dashboard > Materi
```

**2. Cari Video yang Ingin Dihapus**
```
Gunakan search box atau scroll
```

**3. Klik Tombol "Hapus"**
```
Tombol merah kecil di sebelah tombol "Edit"
```

**4. Konfirmasi dan Selesai**
```
Klik OK → Video terhapus ✅
```

---

## 📊 Visual Guide

### Halaman Edit - Lokasi Tombol:

```
┌─────────────────────────────────────────┐
│  Edit Video Pembelajaran                │
├─────────────────────────────────────────┤
│                                         │
│  [Form edit video...]                  │
│                                         │
│  ─────────────────────────────────────  │
│                                         │
│  [🗑️ Hapus Video]    [Batal] [Simpan]  │
│   ↑ TOMBOL INI                          │
└─────────────────────────────────────────┘
```

### Halaman List - Lokasi Tombol:

```
┌─────────────────────────────────────────┐
│  Video 1: Etika Digital                 │
│  Unit: Unit 2                           │
│                                         │
│  [Edit] [🗑️ Hapus]  ← TOMBOL INI       │
└─────────────────────────────────────────┘
```

---

## ⚠️ PERHATIAN!

### Penghapusan PERMANEN:
- ❌ Video **TIDAK BISA** dikembalikan setelah dihapus
- ❌ File video dan thumbnail **HILANG PERMANEN**
- ✅ Pastikan Anda yakin sebelum klik OK

### Yang Terhapus:
1. ✅ Data video dari database
2. ✅ File video dari `/public/uploads/videos/`
3. ✅ Thumbnail dari `/public/uploads/thumbnails/`

### Yang TIDAK Terhapus:
- ✅ Video lain di unit yang sama tetap ada
- ✅ Data unit dan modul tetap ada

---

## 🚀 Action Required

### **Restart Server Dulu:**
```bash
# Di terminal npm start
Ctrl + C  (stop server)
npm start (start ulang)
```

**Kenapa restart?** Agar tombol "Hapus Video" muncul di halaman edit.

---

## 🧪 Test Hapus Video

### Setelah restart:

**1. Test dari Halaman Edit:**
```
a. Buka video yang ingin dihapus: /admin/units/3/materials/2/edit
b. Scroll ke bawah
c. Lihat tombol merah "🗑️ Hapus Video" (kiri bawah)
d. Klik tombol tersebut
e. Konfirmasi: OK
f. Video terhapus, redirect ke /admin/materials
g. Cek: Video sudah tidak ada di list ✅
```

**2. Test dari Halaman List:**
```
a. Dashboard > Materi
b. Cari video
c. Klik tombol "Hapus" (kecil, merah)
d. Konfirmasi: OK
e. Video terhapus ✅
```

---

## 🔧 Troubleshooting

### Problem: Tombol "Hapus Video" Tidak Muncul

**Penyebab:** Server belum direstart

**Solusi:**
```bash
Ctrl + C (di terminal npm start)
npm start
Refresh browser: Ctrl + Shift + R
```

### Problem: Error Saat Hapus

**Penyebab:** Route DELETE belum ready

**Solusi:**
```
Pastikan sudah restart server setelah update code
Check terminal untuk error
```

### Problem: File Video Tidak Terhapus

**Penyebab:** Path file salah atau permission

**Solusi:**
```
File hanya otomatis terhapus jika path-nya:
/uploads/videos/... atau /uploads/thumbnails/...

Jika URL eksternal (YouTube dll), file tidak perlu dihapus.
```

---

## ✅ Checklist

Setelah restart server:

- [ ] Buka halaman edit video
- [ ] Lihat tombol "🗑️ Hapus Video" (kiri bawah)
- [ ] Klik tombol tersebut
- [ ] Popup konfirmasi muncul
- [ ] Klik OK
- [ ] Video terhapus dari list
- [ ] File terhapus dari server

---

## 🎯 Summary

**Cara Tercepat Hapus Video:**

```
1. Dashboard > Materi
2. Klik "Edit" di video yang mau dihapus
3. Scroll ke bawah
4. Klik tombol MERAH "🗑️ Hapus Video"
5. Konfirmasi: OK
6. Selesai! ✅
```

**Tombol ada di:**
- ✅ Halaman Edit (tombol besar, kiri bawah)
- ✅ Halaman List (tombol kecil, sebelah Edit)

---

**Updated:** 2025-12-14 14:15  
**Status:** ✅ READY - Tombol Hapus Sudah Ditambahkan  
**Next:** Restart server & test hapus video
