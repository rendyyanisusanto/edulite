<style>
@media print {
    body * {
        visibility: hidden;
    }

    .panel,
    .panel * {
        visibility: visible;
    }

    .panel {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
    }

    .btn, .no-print {
        display: none !important;
    }

    th, td {
        font-size: 12pt;
    }
}
</style>

<div class="text-right" style="margin-bottom: 10px;">
    <button onclick="window.print()" class="btn btn-default">
        <i class="glyphicon glyphicon-print"></i> Cetak
    </button>
</div>
<div class="panel panel-primary">
    <div class="panel-heading">
        <strong>Hasil Rekap Presensi RFID</strong><br>
        Periode: <?= date('d M Y', strtotime($data_get['tanggal_mulai'])) ?> s.d <?= date('d M Y', strtotime($data_get['tanggal_selesai'])) ?>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr class="text-center">
                        <th style="min-width: 150px;">Nama Siswa</th>
                        <?php
                        $start = new DateTime($data_get['tanggal_mulai']);
                        $end = new DateTime($data_get['tanggal_selesai']);
                        $periode = [];
                        while ($start <= $end) {
                            echo "<th class='text-center'>" . $start->format('d-m') . "</th>";
                            $periode[] = $start->format('Y-m-d');
                            $start->modify('+1 day');
                        }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data_get['rekap'] as $r): ?>
                        <tr>
                            <td><?= $r['nama'] ?></td>
                            <?php foreach ($periode as $tgl): ?>
                                <?php $hadir = isset($r['presensi'][$tgl]) && $r['presensi'][$tgl]['KEHADIRAN']; ?>
                                <td class="text-center">
                                    <?= $hadir ? '<span class="text-success" style="font-size: 18px;">&#10004;</span>' : '<span class="text-danger" style="font-size: 18px;">&#10008;</span>' ?>
                                </td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
