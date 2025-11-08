<?php
$rows = $data_get['rows'] ?? [];
$message = $data_get['message'] ?? '';
?>
<?php if (!empty($message) && empty($rows)): ?>
<tr>
  <td colspan="8" class="text-center text-muted"><?php echo $message; ?></td>
</tr>
<?php endif; ?>
<?php if (!empty($rows)): ?>
  <?php $no = 1; foreach ($rows as $r): ?>
  <tr>
    <td><?php echo $no++; ?></td>
    <td><?php echo htmlspecialchars($r['nama']); ?></td>
    <td><?php echo htmlspecialchars($r['kelas']); ?></td>
    <td class="text-center">&nbsp;<?php echo (int)$r['jumlah_izin']; ?></td>
    <td class="text-center">&nbsp;<?php echo (int)$r['sudah_kembali']; ?></td>
    <td class="text-center">&nbsp;<?php echo (int)$r['belum_kembali']; ?></td>
    <td><?php echo htmlspecialchars($r['total_durasi']); ?></td>
    <td><?php echo htmlspecialchars($r['rata_durasi']); ?></td>
  </tr>
  <?php endforeach; ?>
<?php endif; ?>
