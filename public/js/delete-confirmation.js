// Confirmation untuk hapus video
document.addEventListener('DOMContentLoaded', function () {
    console.log('✅ Delete confirmation script loaded');

    // Cari semua form hapus video
    const deleteForms = document.querySelectorAll('form[action*="/delete"]');

    console.log('Found', deleteForms.length, 'delete forms');

    deleteForms.forEach(function (form) {
        form.addEventListener('submit', function (e) {
            console.log('Delete form submitted, showing confirmation...');

            // Get video title from form or nearby elements
            const formHTML = form.innerHTML;
            let videoTitle = 'video ini';

            // Try to find title in the card/container
            const card = form.closest('.card, .material-card, .list-group-item');
            if (card) {
                const titleElement = card.querySelector('h5, h6, .card-title, .material-title');
                if (titleElement) {
                    videoTitle = titleElement.textContent.trim();
                }
            }

            const confirmed = confirm('🗑️ HAPUS VIDEO INI?\n\nJudul: ' + videoTitle + '\n\nVideo dan file terkait akan dihapus PERMANEN.\n\nLanjutkan?');

            if (!confirmed) {
                console.log('Delete cancelled by user');
                e.preventDefault();
                return false;
            }

            console.log('Delete confirmed, submitting form...');
            return true;
        });
    });
});
