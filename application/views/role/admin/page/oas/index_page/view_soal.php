<?php foreach ($data_get['bank'] as $key => $value): ?>
	<div class="col-md-12">
		<div class="panel">
			<div class=" panel-body">
				<b><?php echo $value['code_soal'] ?></b> - 
				<?php echo $value['soal'] ?>
				<br>
			</div>
			<div class="panel-footer" style="padding: 1%;">
				<button class="btn btn-success btn-xs btn-add-soal" data-kode="<?php echo $value['code_soal'] ?>" data-soal="<?php echo $value['soal'] ?>" data-id="<?php echo $value['id_bank_soal'] ?>" type="button" style="float:right;"><i class="icon-stack-plus"></i> Tambah Soal</button>
			</div>
		</div>
	</div>
<?php endforeach ?>
