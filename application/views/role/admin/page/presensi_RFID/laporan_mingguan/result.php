<?php
$rows = isset($data_get['rows']) ? $data_get['rows'] : [];
$dates = isset($data_get['dates']) ? $data_get['dates'] : [];
$hari_cols = isset($data_get['hari_cols']) ? $data_get['hari_cols'] : ['Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
$summary = isset($data_get['summary']) ? $data_get['summary'] : ['total_hadir'=>0,'total_tidak_hadir'=>0];
?>

<?php if (!empty($rows)) { $no = 1; foreach ($rows as $r) { ?>
    <tr>
        <td class="text-center"><?= $no++; ?></td>
        <td><?= htmlspecialchars($r['nama']); ?></td>
        <td><?= htmlspecialchars($r['nis']); ?></td>
        <?php foreach ($dates as $d) { $hadir = !empty($r['hari'][$d]['hadir']); ?>
            <td class="text-center"><?= $hadir ? '✔️' : '❌'; ?></td>
        <?php } ?>
        <td class="text-center"><?= (int)$r['total_hadir']; ?></td>
        <td class="text-center"><?= (int)$r['total_izin']; ?></td>
        <td class="text-center"><?= (int)$r['total_tidak_hadir']; ?></td>
    </tr>
<?php } ?>
    <!-- Ringkasan kelas -->
    <tr>
        <td colspan="9" class="text-right"><strong>JUMLAH KESELURUHAN</strong></td>
        <td class="text-center"><strong><?= (int)$summary['total_hadir']; ?></strong></td>
        <td class="text-center">&nbsp;</td>
        <td class="text-center"><strong><?= (int)$summary['total_tidak_hadir']; ?></strong></td>
    </tr>
<?php } else { ?>
    <tr>
        <td colspan="12" class="text-center">Tidak ada data</td>
    </tr>
<?php } ?>
