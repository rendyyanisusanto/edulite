<div class="panel panel-body">
	<?php echo $data_get['guru']['nama'] ?>

	<hr>


<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit-data" method="POST">
			<input type="hidden" value="<?php echo $data_get['guru']['id_guru'] ?>" name="idguru_fk">
			<fieldset>
				<table class="table table-bordered table-framed table-xxs">
					<thead>
						<tr>
							<th width="1%">No</th>
							<th>Pertanyaan</th>
							<th style="text-align:center;">TP</th>
							<th style="text-align:center;">KD</th>
							<th style="text-align:center;">S</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						$no = 0;
						foreach ($data_get['question'] as $key => $value): ?>
						<tr>
							<td><?php echo ++$no; ?></td>
							<td><?php echo $value['question'] ?></td>
							<td style="text-align:center;"><input type="radio" value="1" required name="question[<?php echo $value['id_aspirasi_question'] ?>]"></td>
							<td style="text-align:center;"><input type="radio" value="2" required name="question[<?php echo $value['id_aspirasi_question'] ?>]"></td>
							<td style="text-align:center;"><input type="radio" value="3" required name="question[<?php echo $value['id_aspirasi_question'] ?>]"></td>
						</tr>
						<?php endforeach ?>
					</tbody>
				</table>
				<hr>
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