<div class="row">
<?php foreach ($data_get['penggajian'] as $key => $value): ?>
	
		<div class="col-xs-12">
			<div class="panel panel-body">

				<table style="width: 100%;">
					<tr>
						<td style="padding-left: 3%;" width="30%">Bulan/Tahun</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;"><?= $value['bulan'] ?>/<?= $value['tahun'] ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Total</td>
						<td width="1%">:</td>
						<td style="padding-left: 3%;" >Rp. <?= number_format($value['total'], 0, '.','.') ?></td>
					</tr>
					<tr>
						<td style="padding-left: 3%;" width="30%">Konfirmasi</td>
						<td width="1%">:</td>					
						<td style="padding-left: 3%;" ><span class="label label-success">Terkonfirmasi</span></td>
					</tr>
				</table>
				<hr>
				<table style="width: 100%;">
					
					<tr>
						<td width="100%">
							<a href="<?= base_url('guru/penggajian/print_nota/'.$value['idguru_fk'].'/'.$value['bulan'].'/'.$value['tahun']); ?>" target="__blank" style="background: yellow;color:black;" class="btn btn-block btn-sm btn-labeled legitRipple"><b><i class="icon-printer2"></i></b> Cetak Bukti Hr</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	
<?php endforeach ?>
</div>