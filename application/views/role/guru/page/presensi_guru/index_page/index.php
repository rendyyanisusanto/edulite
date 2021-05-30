<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body">
			<?php if ($data_get['jadwal_guru'] > 0){ ?>
				
			
			<div class="col-md-4">
				<div class="panel panel-body" style="text-align: center;">
					<b  class=" text-success">Barcode Presensi Masuk/Pulang</b>
					<img src="<?php echo base_url('include/media/qr/'.date('Y-m-d').'.png') ?>" class="img">
				</div>
				
			</div>
			<div class="col-md-8">
				<div class="col-md-12">
					<div class="panel panel-body">
						<b>Check In : <?php echo (!empty($data_get['presensi']['jam_masuk'])) ? (($data_get['presensi']['jam_masuk'] == '00:00:00') ? '<b class="icon-close2 text-danger"></b> <b class="text-danger"> Belum Absen </b>': '<b class="text-success">'.$data_get['presensi']['jam_masuk'].'</b>') : '<b class="icon-close2 text-danger"></b> <b class="text-danger"> Belum Absen </b>' ?></b>
					</div>
				</div>
				<div class="col-md-12">
					<div class="panel panel-body"><b>Check Out : <?php echo (!empty($data_get['presensi']['jam_keluar'])) ? (($data_get['presensi']['jam_keluar'] == '00:00:00') ? '<b class="icon-close2 text-danger"></b> <b class="text-danger"> Belum Absen </b>': '<b class="text-success">'.$data_get['presensi']['jam_keluar'].'</b>') : '<b class="icon-close2 text-danger"></b> <b class="text-danger"> Belum Absen </b>' ?></b></div>
				</div>
			</div>

		<?php }else{ ?>
			<center><b><h3 class="text-danger">Hari ini tidak ada jadwal</h3></b></center>
		<?php } ?>
		</div>
	</div>
</div>