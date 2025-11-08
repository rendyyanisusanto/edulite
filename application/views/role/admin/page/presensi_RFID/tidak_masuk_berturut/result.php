<?php
$rows = isset($data_get['rows']) ? $data_get['rows'] : [];
$filter = isset($data_get['filter']) ? $data_get['filter'] : [];
?>

<?php if (!empty($rows)) { $no = 1; foreach ($rows as $r) { ?>
    <tr>
        <td class="text-center"><?= $no++; ?></td>
        <td><?= htmlspecialchars($r['nama']); ?></td>
        <td><?= htmlspecialchars($r['nis']); ?></td>
        <td><?= htmlspecialchars($r['kelas']); ?></td>
        <td class="text-center"><?= (int)$r['streak']; ?></td>
        <td><?= htmlspecialchars($r['periode']); ?></td>
    </tr>
<?php } } else { ?>
    <tr>
        <td colspan="6" class="text-center"><?= isset($data_get['message']) && $data_get['message'] ? $data_get['message'] : 'Tidak ada data'; ?></td>
    </tr>
<?php } ?>
