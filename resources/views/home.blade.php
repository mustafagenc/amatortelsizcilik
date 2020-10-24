@extends('layouts.app')

@section('content')
<div class="container">
    <div class="jumbotron shadow-sm">
        <h1 class="display-5">Amatör Radyo (Amatör Telsizcilik)</h1>
        <p class="lead">Amatör radyo, ticari olmayan mesaj alışverişi, kablosuz deneyler, kendi kendini eğitme, özel rekreasyon, radyospor, yarışma ve acil iletişim amacıyla radyo frekansı spektrumunun kullanımıdır. Terim, tamamen kişisel bir amaçla ve maddi menfaatleri olmaksızın radyoelektrik uygulamayla ilgilenen usule uygun yetkili bir kişiyi belirtmek için kullanılır.</p>
        <hr class="my-4">
        <p>Amatör telsizcilik sizinle aynı tür ilgi alanları olan Dünyanın bir başka yerindeki milyonlarca amatörden biri ile bağlantı kurmanızı sağlayacak sosyal bir hobidir.</p>
        <p><a href="https://amatortelsizcilik.com/warden/sorubankasi.rar" class="font-weight-bold">Amatör telsizcilik soru bankası indir</a></p>
    </div>

    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill shadow-sm">
                <h5 class="card-header">
                    Başvuru, Sınav Süreç Rehberi
                </h5>
            <div class="card-body">
                <p class="card-text">KEGM Duyuru sayfasından ya da E-Devlet Amatör Telsizcilik Sınav Başvuru Sayfasından ya da KEGM E-Hizmetler Amatör Telsizcilik Sınav Başvuru sayfasından bir sonraki sınav döneminin duyurulup duyurulmadığını takip edin.</p>
                <a href="https://ugurarici.com/2019/06/01/amator-telsizcilik-basvuru-sinav-surec-rehberi/">Yazının devamını için tıklayın</a>
            </div>
            </div>
        </div>
        <div class="col-sm d-flex">
            <div class="card flex-fill shadow-sm">
                <h5 class="card-header">
                    Faydalı Bağlantılar
                </h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="https://www.kiyiemniyeti.gov.tr/duyurular">Kıyı Emniyeti Genel Müdürlüğü Duyuru Listesi</a></li>
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="http://www.tacallbook.org/">TA Callback</a></li>
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="https://www.ta7om.com/">TA7OM - Amateur Radio</a></li>
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="http://www.ta1lsx.com/">TA1LSX Blog</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection
