@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">
                    <h2 class="d-inline">{{ __('all.mors') }}</h2><br />
                    <hr class="mt-1 mb-3">

                    <iframe id="embed-iframe" src="https://embed.morsedecoder.com/tr/" scrolling="no" style="width: 100%; min-height: 200px; border: 0; overflow:hidden;"></iframe>

                    <h3>Mors Alfabesi</h3>
                    <table class="table table-striped table-bordered table-hover table-responsive-lg">
                        <tbody>
                            <tr>
                                <td class="font-weight-bold">A</td>
                                <td>.-</td>
                                <td class="font-weight-bold">B</td>
                                <td>-...</td>
                                <td class="font-weight-bold">C</td>
                                <td>-.-.</td>
                                <td class="font-weight-bold">D</td>
                                <td>-..</td>
                                <td class="font-weight-bold">E</td>
                                <td>.</td>
                                <td class="font-weight-bold">F</td>
                                <td>..-.</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">G</td>
                                <td>--.</td>
                                <td class="font-weight-bold">H</td>
                                <td>....</td>
                                <td class="font-weight-bold">I</td>
                                <td>..</td>
                                <td class="font-weight-bold">J</td>
                                <td>.---</td>
                                <td class="font-weight-bold">K</td>
                                <td>-.-</td>
                                <td class="font-weight-bold">L</td>
                                <td>.-..</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">M</td>
                                <td>--</td>
                                <td class="font-weight-bold">N</td>
                                <td>-.</td>
                                <td class="font-weight-bold">O</td>
                                <td>---</td>
                                <td class="font-weight-bold">P</td>
                                <td>.--.</td>
                                <td class="font-weight-bold">Q</td>
                                <td>--.-</td>
                                <td class="font-weight-bold">R</td>
                                <td>.-.</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">S</td>
                                <td>...</td>
                                <td class="font-weight-bold">T</td>
                                <td>-</td>
                                <td class="font-weight-bold">U</td>
                                <td>..-</td>
                                <td class="font-weight-bold">V</td>
                                <td>...-</td>
                                <td class="font-weight-bold">W</td>
                                <td>.--</td>
                                <td class="font-weight-bold">X</td>
                                <td>-..-</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">Y</td>
                                <td>-.--</td>
                                <td class="font-weight-bold">Z</td>
                                <td>--..</td>
                                <td class="font-weight-bold">Ç</td>
                                <td>-.-..</td>
                                <td class="font-weight-bold">Ğ</td>
                                <td>--.-.</td>
                                <td class="font-weight-bold">İ</td>
                                <td>.-..-</td>
                                <td class="font-weight-bold">Ö</td>
                                <td>---.</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">Ş</td>
                                <td>.--..</td>
                                <td class="font-weight-bold">Ü</td>
                                <td>..--</td>
                            </tr>
                        </tbody>
                    </table>

                    <h3>Sayılar</h3>
                    <table class="table table-striped table-bordered table-hover table-responsive-lg">
                        <tbody>
                            <tr>
                                <td class="font-weight-bold">0</td>
                                <td>-----</td>
                                <td class="font-weight-bold">1</td>
                                <td>.----</td>
                                <td class="font-weight-bold">2</td>
                                <td>..---</td>
                                <td class="font-weight-bold">3</td>
                                <td>...--</td>
                                <td class="font-weight-bold">4</td>
                                <td>....-</td>
                                <td class="font-weight-bold">5</td>
                                <td>.....</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">6</td>
                                <td>-....</td>
                                <td class="font-weight-bold">7</td>
                                <td>--...</td>
                                <td class="font-weight-bold">8</td>
                                <td>---..</td>
                                <td class="font-weight-bold">9</td>
                                <td>----.</td>
                            </tr>
                        </tbody>
                    </table>

                    <h3>Noktalama</h3>
                    <table class="table table-striped table-bordered table-hover table-responsive-lg">
                        <tbody>
                            <tr>
                                <td class="font-weight-bold">.</td>
                                <td>.-.-.-</td>
                                <td class="font-weight-bold">,</td>
                                <td>--..--</td>
                                <td class="font-weight-bold">?</td>
                                <td>..--..</td>
                                <td class="font-weight-bold">'</td>
                                <td>.----.</td>
                                <td class="font-weight-bold">!</td>
                                <td>-.-.--</td>
                                <td class="font-weight-bold">/</td>
                                <td>-..-.</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">(</td>
                                <td>-.--.</td>
                                <td class="font-weight-bold">)</td>
                                <td>-.--.-</td>
                                <td class="font-weight-bold">&amp;</td>
                                <td>.-...</td>
                                <td class="font-weight-bold">:</td>
                                <td>---...</td>
                                <td class="font-weight-bold">;</td>
                                <td>-.-.-.</td>
                                <td class="font-weight-bold">=</td>
                                <td>-...-</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">+</td>
                                <td>.-.-.</td>
                                <td class="font-weight-bold">-</td>
                                <td>-....-</td>
                                <td class="font-weight-bold">_</td>
                                <td>..--.-</td>
                                <td class="font-weight-bold">"</td>
                                <td>.-..-.</td>
                                <td class="font-weight-bold">$</td>
                                <td>...-..-</td>
                                <td class="font-weight-bold">@</td>
                                <td>.--.-.</td>
                            </tr>
                            <tr>
                                <td class="font-weight-bold">¿</td>
                                <td>..-.-</td>
                                <td class="font-weight-bold">¡</td>
                                <td>--...-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @endsection
