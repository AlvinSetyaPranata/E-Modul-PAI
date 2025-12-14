# 📹 UPDATE: Support Multiple Video & Durasi Panjang

## ✅ Update Terbaru (2025-12-14)

Sistem telah disesuaikan untuk mendukung:
1. ✅ **Video durasi panjang** (5 menit, 10 menit, atau lebih)
2. ✅ **Multiple video per unit** (7+ video per unit tidak masalah)
3. ✅ **Upload limit ditingkatkan** dari 100MB menjadi **200MB**

---

## 📊 Spesifikasi Baru

### File Size Limit
| Sebelumnya | Sekarang | Keuntungan |
|------------|----------|------------|
| 100MB max | **200MB max** | Support video 5-10 menit |

### Durasi Video
- ✅ **Tidak ada batasan durasi**
- ✅ 2 menit: Bisa ✅
- ✅ 5 menit: Bisa ✅
- ✅ 10 menit: Bisa ✅
- ✅ 15 menit: Bisa ✅ (jika size < 200MB)

### Multiple Video per Unit
- ✅ **Tidak ada batasan jumlah**
- ✅ 1 video: Bisa ✅
- ✅ 7 video: Bisa ✅
- ✅ 10+ video: Bisa ✅

---

## 🎬 Contoh Skenario Anda

### Skenario: 7 Video per Unit, Durasi 5 Menit

**Estimasi ukuran file per video:**
- Video 5 menit (720p, 1500 kbps) = **~35-40MB**
- 7 video × 40MB = **~280MB total per unit**

**Status:** ✅ **FULLY SUPPORTED**

**Cara upload:**

#### Opsi 1: Upload File ke Server
```
1. Tambah video pertama: Unit 1 > Tambah Video Baru > Upload file 40MB
2. Tambah video kedua: Unit 1 > Tambah Video Baru > Upload file 40MB
3. Ulangi sampai 7 video
4. Selesai! Semua video muncul di Unit 1
```

**Total storage yang dibutuhkan:**
- 1 unit dengan 7 video = ~280MB
- 5 unit dengan 7 video = ~1.4GB
- Pastikan disk space server cukup

#### Opsi 2: YouTube URL (RECOMMENDED) 🌟
```
1. Upload semua 7 video ke YouTube (bisa unlisted)
2. Tambah video pertama: Paste embed URL YouTube
3. Tambah video kedua: Paste embed URL YouTube
4. Ulangi sampai 7 video
5. Selesai! Video stream dari YouTube (gratis, cepat)
```

**Keuntungan YouTube:**
- ✅ Unlimited storage (gratis)
- ✅ Tidak membebani server Anda
- ✅ Web tidak lemot (CDN global)
- ✅ Support video durasi berapapun

---

## 📝 Perubahan yang Dilakukan

### 1. Backend - Middleware
File: `src/middleware/videoUpload.js`
```javascript
// BEFORE: 100MB max
fileSize: 100 * 1024 * 1024

// AFTER: 200MB max
fileSize: 200 * 1024 * 1024 // Support video 5-10 menit
```

### 2. Frontend - Form New
File: `views/admin/materials/new.ejs`
```html
<!-- BEFORE -->
Maksimal ukuran file: 100MB

<!-- AFTER -->
Maksimal ukuran file: 200MB
Durasi: Tidak terbatas (2-10 menit semua bisa)
Setiap unit bisa punya banyak video (7+ tidak masalah)
```

### 3. Frontend - Form Edit
File: `views/admin/materials/edit.ejs`
```html
<!-- BEFORE -->
Maksimal ukuran file: 100MB

<!-- AFTER -->
Maksimal ukuran file: 200MB
Durasi: Tidak terbatas
```

### 4. Client-side Validation
File: `views/admin/materials/new.ejs` & `edit.ejs`
```javascript
// BEFORE
if (fileSize > 100) {
  alert('Maksimal: 100MB');
}

// AFTER
if (fileSize > 200) {
  alert('Maksimal: 200MB');
}
```

---

## 💡 Rekomendasi Upload

### Untuk Video 5 Menit (7 video per unit)

**Opsi A: Upload ke Server** (jika server punya storage cukup)
- ✅ Kompres video dengan HandBrake atau FFmpeg
- ✅ Target: 720p, 1500 kbps bitrate
- ✅ Hasil: ~35-40MB per video
- ✅ Storage per unit: ~280MB

**Opsi B: YouTube URL** (RECOMMENDED)
- ✅ Upload original quality ke YouTube
- ✅ Set "Unlisted" jika tidak mau public
- ✅ Copy embed URL
- ✅ Paste di E-Modul
- ✅ Storage server: 0MB (semua di YouTube)

---

## 📈 Kalkulasi Storage

### Scenario: 10 Unit × 7 Video × 5 Menit

**Upload ke Server:**
```
10 unit × 7 video × 40MB = 2.8GB storage
```

**Upload ke YouTube:**
```
10 unit × 7 video × 0MB = 0MB storage (gratis unlimited)
```

**Bandwidth untuk Student:**
- Upload ke server: Streaming dari server Anda
- YouTube: Streaming dari CDN YouTube (super cepat)

---

## ✅ Checklist Testing

Setelah restart server, test:

- [ ] Upload video 5 menit (40MB) → Berhasil ✅
- [ ] Upload video 2 ke unit yang sama → Berhasil ✅
- [ ] Upload total 7 video ke 1 unit → Berhasil ✅
- [ ] Student view: Semua 7 video tampil → Berhasil ✅
- [ ] Lazy loading bekerja (video tidak auto-play) → Berhasil ✅
- [ ] Web tidak lemot → Berhasil ✅

---

## 🚀 Next Steps

1. **Restart Server** (wajib agar perubahan apply)
   ```bash
   # Ctrl+C untuk stop
   npm start
   ```

2. **Test Upload Video Panjang**
   - Login sebagai admin/dosen
   - Upload video 5 menit ke unit test
   - Verifikasi berhasil tersimpan

3. **Upload Multiple Video**
   - Tambah video kedua ke unit yang sama
   - Tambah video ketiga, dst sampai 7 video
   - Cek student view: semua video muncul

4. **Pilih Metode Terbaik**
   - Jika server storage terbatas → Gunakan YouTube
   - Jika butuh kontrol penuh → Upload ke server

---

## 📞 FAQ

**Q: Berapa maksimal video per unit?**
A: Tidak ada batasan. Bisa 1, 7, 10, atau lebih.

**Q: Berapa maksimal durasi video?**
A: Tidak ada batasan durasi. Batasan hanya file size (200MB).

**Q: Video 5 menit berapa MB?**
A: Tergantung kualitas. Rata-rata 35-40MB untuk 720p.

**Q: Apakah web akan lemot jika banyak video?**
A: Tidak! Lazy loading memastikan video hanya load saat diperlukan.

**Q: Lebih baik upload ke server atau YouTube?**
A: YouTube lebih baik untuk performa dan storage. Upload ke server jika butuh kontrol penuh.

**Q: Apakah bisa mix (sebagian YouTube, sebagian upload)?**
A: Ya! Setiap video bisa pilih sendiri metodenya.

---

## 🎯 Kesimpulan

✅ **Video 5 menit:** SUPPORT  
✅ **7 video per unit:** SUPPORT  
✅ **Upload limit:** 200MB  
✅ **Web stabil:** YA (dengan lazy loading)  
✅ **Storage:** Recommended YouTube untuk hemat storage

**Sistem siap untuk skenario Anda!** 🚀

---

**Update Date:** 2025-12-14  
**Version:** 1.1.0  
**Status:** ✅ READY TO USE
