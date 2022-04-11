<?php foreach ($data_get['oas_soal'] as $key => $value): ?>
	<tr>
		<td><button type="button" data-id="<?php echo $value['id_oas_soal'] ?>" class="btn-del-soal btn btn-danger btn-sm"><i class="icon-trash"></i></button></td>
		<td><?php echo $value['code_soal'] ?></td>
		<td><?php echo $value['soal'] ?></td>
	</tr>
<?php endforeach ?>