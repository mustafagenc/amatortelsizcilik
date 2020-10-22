require('./bootstrap');
const Swal = require('sweetalert2')

$(function () {
    $('[data-toggle="tooltip"]').tooltip();

    jQuery('a').filter(function() {
        return this.hostname && this.hostname !== location.hostname;
      }).click(function(e) {

        var domain = ["facebook.com", "instagram.com", "reddit.com", "linkedin.com", "twitter.com", "pinterest.com", "telegram.me", "wa.me", "github.com"];
        var n = domain.includes(this.hostname.replace('www.',''));

        if (n) {
            window.open(this.href + '?ref=amatortelsizcilik.com');
        } else {
            Swal.fire({
                text: "Harici bir web sitesine gitmek üzeresiniz...",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText : 'İptal Et',
                confirmButtonText: 'Tamam'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.open(this.href + '?ref=amatortelsizcilik.com');
                }
            });
        }
        return false;
    });
});
