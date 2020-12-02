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
                <p class="card-text">2020 yılında KEGM ve MEB işbirliği ile amatör telsizcilik belge sınavlarında e-Sınav dönemine geçilmesinin ardından süreç hakkında internet üzerinde pek çok bilgi dolaşıyor.</p>
                <a href="https://erkanercan.medium.com/2020-amator-telsizcilik-sinavi-ve-belge-islemleri-4fafcfce9433">Yazının devamını için tıklayın</a>
            </div>
            </div>
        </div>
        <div class="col-sm d-flex c-mt-2">
            <div class="card flex-fill shadow-sm">
                <h5 class="card-header">
                    Faydalı Bağlantılar
                </h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="https://www.youtube.com/channel/UCwJ_TQTyNo0dk3q2yDyhS3w">Gürel Özbakış</a></li>
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="http://www.tacallbook.org/">TA Callback</a></li>
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="https://www.ta7om.com/">TA7OM - Amateur Radio</a></li>
                    <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> <a class="card-link" href="http://www.ta1lsx.com/">TA1LSX Blog</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
@endsection
