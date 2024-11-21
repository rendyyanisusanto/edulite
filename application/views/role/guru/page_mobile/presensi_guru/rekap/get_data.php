<div class="row">
<?php 
$current_month = ''; // Variabel untuk menyimpan bulan saat ini dalam loop

foreach ($data_get['hari'] as $key => $value): 
    // Ambil bulan dari tanggal saat ini dalam loop
    $month_label = date('F Y', strtotime($value['tanggal']));

    // Jika bulan saat ini berbeda dengan `current_month`, tambahkan label bulan baru
    if ($month_label !== $current_month):
        $current_month = $month_label; // Update bulan saat ini
?>
        <!-- Label Bulan Baru -->
        <div class="col-xs-12">
            <h3 class="text-center"><?php echo $current_month; ?></h3>
        </div>
<?php 
    endif; 
?>
    <div class="col-xs-12">
        <div class="panel panel-body">
            <table style="width: 100%;">
                <tr>
                    <td style="padding-left: 3%;" width="30%">Tanggal</td>
                    <td width="1%">:</td>
                    <td style="padding-left: 3%;"><?php echo ucfirst($value['hari']) ?>, <?php echo $value['tanggal'] ?></td>
                </tr>
                <tr>
                    <td style="padding-left: 3%;" width="30%">Jam Masuk</td>
                    <td width="1%">:</td>
                    <td style="padding-left: 3%;"><?php echo ($value['is_jadwal'] == 0) ? "Tidak ada jadwal" : ((!empty($value['presensi_guru']['jam_masuk']) && $value['presensi_guru']['jam_masuk'] !== '00:00:00') ? "<b class='text-success'>".$value['presensi_guru']['jam_masuk']."</b>" : "<b class='text-danger'><i class='icon-close2'></i></b>"); ?></td>
                </tr>
                <tr>
                    <td style="padding-left: 3%;" width="30%">Jam Pulang</td>
                    <td width="1%">:</td>
                    <td style="padding-left: 3%;"><?php echo ($value['is_jadwal'] == 0) ? "Tidak ada jadwal" : ((!empty($value['presensi_guru']['jam_keluar']) &&  $value['presensi_guru']['jam_keluar'] !== '00:00:00') ? "<b class='text-success'>".$value['presensi_guru']['jam_keluar']."</b>" : "<b class='text-danger'><i class='icon-close2'></i></b>") ?></td>
                </tr>
            </table>
        </div>
    </div>
<?php endforeach; ?>
</div>