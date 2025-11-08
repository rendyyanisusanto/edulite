<?php
$rows = isset($data_get['rows']) ? $data_get['rows'] : [];
$tanggal = isset($data_get['tanggal']) ? $data_get['tanggal'] : '';
?>

<?php if (!empty($rows)) { $no = 1; foreach ($rows as $r) { ?>
    <tr>
        <td class="text-center"><?= $no++; ?></td>
        <td><?= htmlspecialchars($r['nama']); ?></td>
        <td><?= htmlspecialchars($r['nis']); ?></td>
        <td><?= htmlspecialchars($r['kelas']); ?></td>
        <td><?= htmlspecialchars($tanggal); ?></td>
    </tr>
<?php } } else { ?>
    <tr>
        <td colspan="5" class="text-center"><?= isset($data_get['message']) && $data_get['message'] ? $data_get['message'] : 'Tidak ada data'; ?></td>
    </tr>
<?php } ?>
