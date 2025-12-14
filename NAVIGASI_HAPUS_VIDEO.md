# 🗺️ Panduan Navigasi: Hapus Video

## 📍 Lokasi Anda Sekarang

**URL:** `/admin/modules/4`
**Halaman:** Detail Modul
**Tabel:** List Unit

```
┌─────────────────────────────────────────────────────────┐
│  Detail Modul: Etika dan Peran Islam dalam Tantangan   │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  Unit Pembelajaran                                      │
│  ┌───────────────────────────────────────────────────┐ │
│  │ # │ Unit          │ Deskripsi │ Aktivitas │ Aksi │ │
│  ├───┼───────────────┼───────────┼───────────┼──────┤ │
│  │ 1 │ Unit 1: ...   │ ...       │ ...       │ ...  │ │
│  │   │               │           │           │ [Edit]│ │
│  │   │               │           │           │[Hapus]│ ← HAPUS UNIT!
│  │   │               │           │           │ [+]   │
│  └───┴───────────────┴───────────┴───────────┴──────┘ │
└─────────────────────────────────────────────────────────┘
```

**Tombol "Hapus" di sini = HAPUS UNIT (bukan video!)**

---

## ✅ Tempat yang Benar: Halaman Materi

### **Navigasi ke Halaman Materi:**

**Dari halaman Anda sekarang:**
```
1. Klik "Dashboard" (atas kanan)
2. Di sidebar, cari dan klik "Materi"
   Atau ketik URL: http://localhost:3000/admin/materials
```

**Di Halaman Materi:**
```
┌─────────────────────────────────────────────────────────┐
│  📝 Manajemen Materi                                    │
├─────────────────────────────────────────────────────────┤
│  [🔍 Cari judul materi...]                             │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │ 📄 Keadilan Sosial dan Etika Muamalah...       │   │
│  │ Unit: Unit 2 | Modul: Etika dan Peran Islam   │   │
│  │                                                 │   │
│  │ Tujuan Pembelajaran: ...                       │   │
│  │                                                 │   │
│  │                    [Edit] [Hapus] ← KLIK INI!  │   │
│  └─────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

**Tombol "Hapus" di sini = HAPUS VIDEO!**

---

## 🎬 Step-by-Step dengan Screenshot

### **Langkah 1: Ke Dashboard**
Click here →
```
┌────────────────────────────────┐
│ E-Modul PAI    [Dashboard]  ← KLIK
└────────────────────────────────┘
```

### **Langkah 2: Sidebar Menu**
```
Dashboard
├─ Modul
├─ Unit
├─ MATERI  ← KLIK INI!
├─ Aktivitas
└─ ...
```

### **Langkah 3: Di Halaman Materi**
```
Video Anda akan tampil seperti card:

┌──────────────────────────────────┐
│ 📹 Video Title                   │
│ Duration: 2 min 6s | Size: 22MB │
│                                  │
│              [Edit] [Hapus] ← INI!
└──────────────────────────────────┘
```

### **Langkah 4: Klik Hapus**
```
Popup akan muncul:

┌─────────────────────────────────┐
│  ⚠️ Konfirmasi Hapus            │
├─────────────────────────────────┤
│  Hapus video:                   │
│  "Keadilan Sosial dan Etika..." │
│                                 │
│  Video akan dihapus PERMANEN.  │
│                                 │
│      [Batal]     [OK]  ← KLIK  │
└─────────────────────────────────┘
```

### **Langkah 5: Video Terhapus!**
```
Terminal output:
=== DELETE (POST) ROUTE CALLED ===
Deleting material: Keadilan Sosial...
✅ Deleted video file: ...
✅ Deleted from database: 2

Browser: Redirect ke /admin/materials
Video hilang dari list ✅
```

---

## 🚨 WARNING: Jangan Hapus Unit!

**Jika Anda klik "Hapus" di tabel Unit:**
- ❌ Akan hapus SELURUH UNIT
- ❌ SEMUA video di unit tersebut akan terhapus
- ❌ Tidak bisa di-undo!

**Konfirmasi yang muncul:**
```
"Hapus unit ini beserta materi di dalamnya?"
```

**Jika tidak sengaja klik:** Klik "Cancel" / "Batal"!

---

## ✅ Checklist

Untuk hapus 1 video tertentu:

- [ ] JANGAN klik "Hapus" di tabel Unit (halaman Detail Modul)
- [ ] Klik "Dashboard" di atas kanan
- [ ] Klik "Materi" di sidebar atau URL: /admin/materials
- [ ] Cari video yang ingin dihapus
- [ ] Klik tombol "Hapus" (merah, kecil, sebelah Edit)
- [ ] Konfirmasi popup dengan klik "OK"
- [ ] Cek terminal: Ada output "DELETE (POST) ROUTE CALLED"
- [ ] Video terhapus dari list ✅

---

## 📊 Diagram Navigasi

```
Dashboard
    │
    ├─ Modul (List semua modul)
    │   └─ Detail Modul (List unit dalam 1 modul) ← ANDA DI SINI
    │       └─ Tombol "Hapus" → Hapus UNIT ❌
    │
    └─ MATERI (List semua video) ← KE SINI!
        └─ Tombol "Hapus" → Hapus VIDEO ✅
            └─ Atau "Edit" → Scroll bawah → "Hapus Video" ✅
```

---

## 🎯 Action Required

**SEKARANG:**

1. Dari halaman Detail Modul yang sekarang terbuka
2. Klik "Dashboard" (atas kanan, tombol biru)
3. Cari menu "Materi" di sidebar ATAU
4. Ketik URL: `localhost:3000/admin/materials`
5. Di sana akan ada LIST semua video
6. Klik "Hapus" di video yang ingin dihapus
7. Konfirmasi → OK
8. Selesai!

---

**Updated:** 2025-12-14 14:30
**Anda di:** `/admin/modules/4` (Detail Modul)
**Harus ke:** `/admin/materials` (List Materi)
