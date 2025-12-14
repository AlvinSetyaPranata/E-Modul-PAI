// ============================================
// VIDEO UPLOAD MIDDLEWARE
// File: src/middleware/videoUpload.js  
// ============================================
// Middleware khusus untuk upload video dengan optimasi performa

const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Konfigurasi storage untuk video
const videoStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        const uploadDir = path.join(__dirname, '../../public/uploads/videos');
        if (!fs.existsSync(uploadDir)) {
            fs.mkdirSync(uploadDir, { recursive: true });
        }
        cb(null, uploadDir);
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const ext = path.extname(file.originalname);
        cb(null, 'video-' + uniqueSuffix + ext);
    }
});

// File filter untuk validasi tipe video
function videoFileFilter(req, file, cb) {
    const allowedMimeTypes = [
        'video/mp4',
        'video/mpeg',
        'video/quicktime', // .mov
        'video/x-msvideo', // .avi
        'video/webm'
    ];

    const allowedExtensions = /mp4|mpeg|mov|avi|webm/i;
    const ext = path.extname(file.originalname).toLowerCase();
    const mimeTypeValid = allowedMimeTypes.includes(file.mimetype);
    const extValid = allowedExtensions.test(ext);

    if (mimeTypeValid && extValid) {
        return cb(null, true);
    }

    cb(new Error('Format video tidak didukung! Gunakan MP4, WEBM, MOV, atau AVI.'));
}

// Konfigurasi upload untuk video
const uploadVideo = multer({
    storage: videoStorage,
    limits: {
        fileSize: 200 * 1024 * 1024 // 200MB max untuk video (support 5-10 menit)
    },
    fileFilter: videoFileFilter
});

// Konfigurasi storage untuk thumbnail/poster
const thumbnailStorage = multer.diskStorage({
    destination: function (req, file, cb) {
        const uploadDir = path.join(__dirname, '../../public/uploads/thumbnails');
        if (!fs.existsSync(uploadDir)) {
            fs.mkdirSync(uploadDir, { recursive: true });
        }
        cb(null, uploadDir);
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, 'thumb-' + uniqueSuffix + path.extname(file.originalname));
    }
});

// File filter untuk thumbnail
function thumbnailFileFilter(req, file, cb) {
    const allowedTypes = /jpeg|jpg|png|webp/i;
    const mimetype = allowedTypes.test(file.mimetype);
    const extname = allowedTypes.test(path.extname(file.originalname).toLowerCase());

    if (mimetype && extname) {
        return cb(null, true);
    }

    cb(new Error('Format thumbnail harus JPG, PNG, atau WEBP!'));
}

// Konfigurasi upload untuk thumbnail
const uploadThumbnail = multer({
    storage: thumbnailStorage,
    limits: {
        fileSize: 5 * 1024 * 1024 // 5MB max untuk thumbnail
    },
    fileFilter: thumbnailFileFilter
});

// Upload gabungan (video + thumbnail)
const uploadVideoWithThumbnail = multer({
    storage: multer.diskStorage({
        destination: function (req, file, cb) {
            let uploadDir;
            if (file.fieldname === 'video_file') {
                uploadDir = path.join(__dirname, '../../public/uploads/videos');
            } else if (file.fieldname === 'thumbnail_file') {
                uploadDir = path.join(__dirname, '../../public/uploads/thumbnails');
            } else {
                uploadDir = path.join(__dirname, '../../public/uploads/media');
            }

            if (!fs.existsSync(uploadDir)) {
                fs.mkdirSync(uploadDir, { recursive: true });
            }
            cb(null, uploadDir);
        },
        filename: function (req, file, cb) {
            const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
            const prefix = file.fieldname === 'video_file' ? 'video-' :
                file.fieldname === 'thumbnail_file' ? 'thumb-' : 'media-';
            cb(null, prefix + uniqueSuffix + path.extname(file.originalname));
        }
    }),
    limits: {
        fileSize: 200 * 1024 * 1024 // 200MB max (support video 5-10 menit)
    },
    fileFilter: function (req, file, cb) {
        if (file.fieldname === 'video_file') {
            return videoFileFilter(req, file, cb);
        } else if (file.fieldname === 'thumbnail_file') {
            return thumbnailFileFilter(req, file, cb);
        }
        cb(null, true);
    }
}).fields([
    { name: 'video_file', maxCount: 1 },
    { name: 'thumbnail_file', maxCount: 1 }
]);

module.exports = {
    uploadVideo,
    uploadThumbnail,
    uploadVideoWithThumbnail
};
