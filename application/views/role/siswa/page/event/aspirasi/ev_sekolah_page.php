<div class="panel panel-body">
	Sekolah

	<hr>


<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data_sekolah" id="app-submit-data" method="POST">
			
			<fieldset>
	            <div class="form-group">
	              <label class="col-lg-2 control-label">Kritik</label>
	              <div class="col-lg-6">
	              	<textarea name="kritik" required class="form-control"></textarea>
	              </div>
	            </div>
	            <div class="form-group">
	              <label class="col-lg-2 control-label">Saran</label>
	              <div class="col-lg-6">
	              	<textarea name="saran" required class="form-control"></textarea>
	              </div>
	            </div>
	           
				
            </fieldset>
<button class="btn btn-success" type="submit"><i class="icon-floppy-disk"></i> Simpan</button>

</form>



</div>

<script type="text/javascript">
	$( "#app-submit-data" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('Event/aspirasi');
	        });
	    return false;
	});
</script>