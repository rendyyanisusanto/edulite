<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Surat Izin Siswa - <?= $surat['kode'] ?></title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            font-size: 12pt;
            line-height: 1.15;
            margin: 0;
            padding: 0 25px 25px;
            color: #000;
            box-sizing: border-box;
        }
        
        .container {
           width: 100%;
            max-width: 210mm; /* A4 width */
            margin: 0 auto;
            padding: 10mm 15mm 15mm 15mm; /* Consistent padding */
            box-sizing: border-box;
            position: relative;
        }
        
        /* Fixed kop surat styling */
        .kop-surat {
            width: 100%;
            margin: 0 0 20px 0;
            text-align: center;
            box-sizing: border-box;
        }
        
        .kop-image {
            width: 100%;
            height: auto;
            max-height: 150px;
            object-fit: contain;
            object-position: center;
            display: block;
            margin: -15px auto;
        }
        
        /* Fallback styling */
        .kop-fallback {
            display: none;
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
            border: 2px dashed #ccc;
            background-color: #f9f9f9;
            font-style: italic;
            color: #666;
            box-sizing: border-box;
        }
        
        /* Content sections with consistent spacing */
        .nomor-surat {
            margin: 20px 0;
            font-size: 12pt;
            line-height: 1.15;
        }
        
        .penerima {
            margin: 20px 0;
            line-height: 1.15;
        }
        
        .content {
            text-align: justify;
            margin: 20px 0;
            line-height: 1.15;
        }
        
        .content p {
            margin: 12px 0;
            text-indent: 0;
        }
        
        .kegiatan-detail {
            margin: 15px 0;
            padding-left: 40px;
            line-height: 1.15;
        }
        
        /* Fixed table styling */
        .table-siswa {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 12pt;
            table-layout: fixed; /* Prevents table from shifting */
        }
        
        .table-siswa th,
        .table-siswa td {
            border: 1px solid #000;
            padding: 8px 6px;
            text-align: left;
            vertical-align: middle;
            word-wrap: break-word;
        }
        
        .table-siswa th {
            background-color: #f0f0f0;
            font-weight: bold;
            text-align: center;
        }
        
        /* Fixed column widths */
        .table-siswa col:nth-child(1) { width: 8%; }  /* No */
        .table-siswa col:nth-child(2) { width: 45%; } /* Nama */
        .table-siswa col:nth-child(3) { width: 15%; } /* Kelas */
        .table-siswa col:nth-child(4) { width: 32%; } /* Pendamping */
        
        .table-siswa td:first-child {
            text-align: center;
        }
        
        .table-siswa td:nth-child(3) {
            text-align: center;
        }
        
        .table-siswa td:last-child {
            text-align: center;
            vertical-align: middle;
        }
        
        .pendamping-cell {
            background-color: #f8f8f8;
            font-weight: bold;
            vertical-align: middle !important;
        }
        
        .pendamping-cell small {
            font-size: 12pt;
            color: #666;
            font-style: italic;
            font-weight: normal;
        }
        
        /* Signature section */
        .ttd-section {
            margin-top: 30px;
            text-align: right;
            clear: both;
        }
        
        .ttd-box {
            display: inline-block;
            text-align: left;
            width: 350px;
            margin-right: 0;
        }
        
        .ttd-space {
            height: 50px;
            margin: 10px 0;
        }
        
        .tembusan {
            margin-top: 30px;
            font-size: 12pt;
            clear: both;
        }
        
        /* Lampiran section */
        .lampiran-section {
            margin-top: 25px;
            page-break-before: always;
            padding-top: 0;
        }
        
        .lampiran-header {
            text-align: center;
            font-weight: bold;
            margin-bottom: 20px;
            text-decoration: underline;
            font-size: 12pt;
        }
        
        /* Utility classes */
        .italic {
            font-style: italic;
        }
        
        .bold {
            font-weight: bold;
        }
        
        .underline {
            text-decoration: underline;
        }
        
        .text-center {
            text-align: center;
        }
        
        /* Print optimizations */
        @media print {
            body {
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
                margin: 0;
                padding: 0;
            }
            
            .container {
                padding: 8mm 12mm 12mm 12mm;
                max-width: none;
                width: 100%;
            }
            
            .kop-image {
                max-height: 120px;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
            
            .table-siswa {
                page-break-inside: avoid;
            }
            
            .table-siswa th,
            .table-siswa td {
                padding: 6px 4px;
            }
            
            .ttd-section {
                page-break-inside: avoid;
            }
        }
        
        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            .container {
                padding: 10px 15px;
            }
            
            .ttd-box {
                width: 200px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- KOP SURAT dengan gambar -->
        <div class="kop-surat">
            <?php
            $kop_path = FCPATH . 'include/media/kop.png';
            if (file_exists($kop_path)) {
                $image_data = base64_encode(file_get_contents($kop_path));
                $kop_base64 = 'data:image/png;base64,' . $image_data;
                echo '<img src="' . $kop_base64 . '" alt="Kop Surat" class="kop-image">';
            } else {
                echo '<div class="kop-fallback">KOP SURAT SMK IT ASY-SYADZILI<br>Gambar tidak ditemukan</div>';
            }
            ?>
        </div>
        
        <!-- Nomor Surat -->
        <div class="nomor-surat">
            Nomor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <?= $surat['kode'] ?><br>
            Lampiran&nbsp;&nbsp;&nbsp;: 1 lbr<br>
            Hal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Permohonan Ijin
        </div>
        
        <!-- Penerima -->
        <div class="penerima">
            Yth. Pengasuh PPSQ Asy-Syadzili 1<br>
            Di<br>
            Tempat
        </div>
        
        <!-- Pembuka -->
        <div class="content">
            <p class="italic">Assalamu'alaikum Warahmatullahi Wabarokatuh.</p>    
            <p class="italic">Salam silaturrahim kami haturkan, teriring do'a semoga Bapak/Ibu senantiasa mendapatkan rahmat, hidayah, inayah serta ma'unnah Allah SWT, sehingga dalam menjalankan aktifitas sehari-hari dapat terlaksana dengan sebaik-baiknya, Amin.</p>
            <p>Sehubungan dengan adanya <span class="bold"><?= $surat['kegiatan'] ?></span>, maka kami bermaksud memohonkan ijin beberapa siswa (nama terlampir) untuk mengikuti kegiatan tersebut pada :</p>
            
            <div class="kegiatan-detail">
                <?php
                $tanggal_mulai = $surat['tanggal_mulai'];
                $tanggal_selesai = $surat['tanggal_selesai'];
                
                if ($tanggal_mulai == $tanggal_selesai) {
                    // Jika tanggal sama (1 hari)
                    echo "Hari&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " . format_hari(date('N', strtotime($tanggal_mulai))) . ", " . date('j', strtotime($tanggal_mulai)) . " " . format_bulan(date('n', strtotime($tanggal_mulai))) . " " . date('Y', strtotime($tanggal_mulai));
                } else {
                    // Jika tanggal berbeda (multi hari)
                    echo "Hari&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " . format_hari(date('N', strtotime($tanggal_mulai))) . ", " . date('j', strtotime($tanggal_mulai)) . " " . format_bulan(date('n', strtotime($tanggal_mulai))) . " " . date('Y', strtotime($tanggal_mulai)) . " s/d " . format_hari(date('N', strtotime($tanggal_selesai))) . ", " . date('j', strtotime($tanggal_selesai)) . " " . format_bulan(date('n', strtotime($tanggal_selesai))) . " " . date('Y', strtotime($tanggal_selesai));
                }
                ?>
                <br>
                Waktu&nbsp;&nbsp;&nbsp;: <?= date('H.i', strtotime($surat['waktu_mulai'])) ?> – <?= $surat['waktu_selesai'] ? date('H.i', strtotime($surat['waktu_selesai'])) : 'Selesai' ?><br>
                Tempat&nbsp;: <?= $surat['tempat'] ?>
            </div>
            
            <p>Demikian surat permohonan ini kami sampaikan, atas perhatian dan ijin yang diberikan kami sampaikan terima kasih.</p>
            
            <p class="italic">Wallahul Mawafiq illa aqwamith thariq<br>
            Wassalamu'alaikum Warahmatullahi Wabarokatuh.</p>
        </div>
        
        <!-- Tanggal dan TTD -->
        <div class="ttd-section">
            <div class="ttd-box">
                Pakis, <?= date('j', strtotime($surat['tanggal_mulai'])) ?> <?= format_bulan(date('n', strtotime($surat['tanggal_mulai']))) ?> <?= date('Y', strtotime($surat['tanggal_mulai'])) ?><br>
                Kepala SMK IT Asy-Syadzili<br>
                <div class="ttd-space"></div>
                <span class="bold underline">Avi Hendratmoko, S.Kom</span>
            </div>
        </div>
        
        <!-- Tembusan -->
        <div class="tembusan">
            <span class="bold">Tembusan:</span><br>
            1. Ketua Asrama<br>
            2. Bagian Keamanan<br>
            3. Kepala Tahfidz
        </div>
        
        <!-- Lampiran Daftar Siswa -->
        <div class="lampiran-section">
            <div class="nomor-surat">
                <span class="bold">Lampiran:</span><br>
                Nomor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <?= $surat['kode'] ?><br>
                Hal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Permohonan Ijin
            </div>
            
            <div class="lampiran-header">
                DAFTAR NAMA SISWA
            </div>
            
            <table class="table-siswa">
                <thead>
                    <tr>
                        <th width="5%">No</th>
                        <th>Nama Siswa</th>
                        <th>Kelas</th>
                        <th>Pendamping</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($siswa_list as $index => $siswa): ?>
                    <tr>
                        <td><?= $index + 1 ?></td>
                        <td><?= ucwords(strtolower($siswa['nama'])) ?></td>
                        <td><?= $siswa['kelas'] ?></td>
                        <?php if ($index == 0): ?>
                            <td rowspan="<?= count($siswa_list) ?>" class="pendamping-cell">
                                <strong><?= $surat['pendamping'] ?></strong><br>
                                <small>Guru Pendamping</small>
                            </td>
                        <?php endif; ?>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
        // JavaScript fallback untuk gambar yang gagal dimuat
        document.addEventListener('DOMContentLoaded', function() {
            var img = document.querySelector('.kop-image');
            var fallback = document.querySelector('.kop-fallback');
            
            if (img) {
                img.onerror = function() {
                    this.style.display = 'none';
                    if (fallback) {
                        fallback.style.display = 'block';
                    }
                };
            }
        });
    </script>
</body>
</html>