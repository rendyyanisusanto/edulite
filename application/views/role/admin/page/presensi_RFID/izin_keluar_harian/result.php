<?php
$rows = $data_get['rows'] ?? [];
$message = $data_get['message'] ?? '';
?>
<?php if (!empty($message) && empty($rows)): ?>
<tr>
  <td colspan="6" class="text-center text-muted"><?php echo $message; ?></td>
</tr>
<?php endif; ?>
<?php if (!empty($rows)): ?>
  <?php $no = 1; foreach ($rows as $r): ?>
  <tr>
    <td><?php echo $no++; ?></td>
    <td><?php echo htmlspecialchars($r['nama']); ?></td>
    <td><?php echo htmlspecialchars($r['kelas']); ?></td>
    <td><?php echo htmlspecialchars($r['keluar']); ?></td>
    <td><?php echo htmlspecialchars($r['kembali']); ?></td>
    <td><?php echo htmlspecialchars($r['lama']); ?></td>
  </tr>
  <?php endforeach; ?>
<?php endif; ?>
