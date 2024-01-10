<style type="text/css">
	
</style>

<div class="row">
	<div class="panel panel-body">
		<center><h4><b>Absen <?= $data_get['keterangan'] ?> - PRAKERIN</b></h4></center>
		<form  action="Jurnal_guru/save_presensi_prakerin" id="app-absen-save" method="POST">
		<input type="hidden" name="idprakerin_fk" value="<?php echo $data_get['prakerin']['idprakerin_fk'] ?>">
		<input type="hidden" name="stat" value="<?php echo $data_get['stat'] ?>">
		<input type="hidden" name="idkelompok" value="<?php echo $data_get['idkelompok'] ?>">
		<input type="hidden" name="tanggal" value="<?php echo date('Y-m-d') ?>">
		<div class="table-responsive">
		<table class="table table-bordered table-xxs table-framed" style="width: 100%;">
			<thead>
				<tr>
					<th class="sticky" width="20%">NIS</th>
					<th class="sticky">Nama</th>
					<th class="sticky" width="2%">M</th>
					<th class="sticky" width="2%">A</th>
					<th class="sticky" width="2%">I</th>
					<th class="sticky" width="2%">S</th>
				</tr>
			</thead>
			<tbody>
				
				<?php foreach ($data_get['siswa'] as $key => $value): ?>
				<tr>
					<input type="hidden" name="data[<?php echo $key ?>][idsiswa_fk]" value="<?php echo $value['siswa']['id_siswa'] ?>">
					<td><?php echo $value['siswa']['nis'] ?></td>
					<td><?php echo $value['siswa']['nama'] ?></td>
					<td><input type="radio" value="M" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "M") ? "checked" : "" ) : "checked" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
					<td><input type="radio" value="A" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "A") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
					<td><input type="radio" value="I" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "I") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
					<td><input type="radio" value="S" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi_'.(($data_get['stat'] == "M") ? "masuk" : "pulang")] == "S") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"></td>
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>
		</div>
		<hr>
		<button class="btn btn-success btn-absen-submit" type="submit"><i class=" icon-floppy-disk"></i> Simpan</button>
		</form>
	</div>
</div>

<script type="text/javascript">
	$("#app-absen-save").on('submit' ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
                $('.btn-absen-submit').attr('disabled', 'true');
                $('.btn-absen-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
            	toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                setTimeout(function(){ 
                    set_content('Dashboard/get_data');
                }, 1000);
            });
        return false;
    });

</script>