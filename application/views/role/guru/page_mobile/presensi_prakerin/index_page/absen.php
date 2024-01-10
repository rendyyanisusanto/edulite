
<form  action="Jurnal_guru/save_presensi_prakerin" id="app-absen-save" method="POST">
		<input type="hidden" name="idprakerin_fk" value="<?php echo $data_get['prakerin']['idprakerin_fk'] ?>">
		<input type="hidden" name="stat" value="<?php echo $data_get['stat'] ?>">
		<input type="hidden" name="tanggal" value="<?php echo date('Y-m-d') ?>">
<?php foreach ($data_get['siswa'] as $key => $value): ?>
	<div class="panel panel-body">
		<b><?php echo $value['siswa']['nama'] ?></b>
		<br>
		
		<input type="hidden" name="data[<?php echo $key ?>][idsiswa_fk]" value="<?php echo $value['siswa']['id_siswa'] ?>">
		
		
		
		<div class="btn-group" style="width: 100%;" >
								
							
		<label class="radio-inline btn btn-success">
	      <input type="radio" value="M" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "M") ? "checked" : "" ) : "checked" ; ?> name="data[<?php echo $key ?>][presensi]"> M
	    </label>
	    <label class="radio-inline btn btn-danger">
	      <input type="radio" value="A" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "A") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"> A
	    </label>
	    <label class="radio-inline btn btn-info">
	      <input type="radio" value="I" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "I") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"> I
	    </label>
	    <label class="radio-inline btn btn-warning">
	      <input type="radio" value="S" <?php echo (!empty($value['presensi'])) ?( ($value['presensi']['presensi'] == "S") ? "checked" : "" ) : "" ; ?> name="data[<?php echo $key ?>][presensi]"> S
	    </label>

	    </div>
	</div>
<?php endforeach ?>
<hr>
<button class="btn btn-success btn-absen-submit" type="submit"><i class=" icon-floppy-disk"></i> Simpan</button>
</form>


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