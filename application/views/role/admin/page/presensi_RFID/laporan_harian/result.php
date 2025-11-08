<?php if (!empty($data_get['rows'])) { $no = 1; foreach ($data_get['rows'] as $r) { ?>
    <tr>
        <td class="text-center"><?= $no++; ?></td>
        <td><?= htmlspecialchars($r['nama']); ?></td>
        <td><?= htmlspecialchars($r['nis']); ?></td>
        <td><?= htmlspecialchars($r['tanggal']); ?></td>
        <td><?= htmlspecialchars($r['jam_masuk']); ?></td>
        <td><?= htmlspecialchars($r['jumlah_ijin']); ?></td>
        <td><?= htmlspecialchars($r['jam_pulang']); ?></td>
        <td><?= htmlspecialchars($r['status_akhir']); ?></td>
    </tr>
<?php } } else { ?>
    <tr>
        <td colspan="8" class="text-center"><?= isset($message) && $message ? $message : 'Tidak ada data'; ?></td>
    </tr>
<?php } ?>
