<div class="panel panel-body">
			
      	<form action="Siswa/simpan_rfid" id="app-proses-submit" method="POST">
			<table style ="border: 1px solid black;" class="table table-bordered">
				<thead>
					<tr>
						<th style ="border: 1px solid black;" class="bg-blue" width="2%" rowspan="2">No</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">Nama Siswa</th>
						<th style ="border: 1px solid black;" class="bg-blue" rowspan="2">RFID</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$no = 0;
					foreach ($data_get['siswa'] as $key => $value): ?>
						<?php $rand = rand(0,99999); ?>
						<tr>
							<td class="bg-info"><?php echo ++$no ?></td>
							<td><?php echo $value['nama'] ?></td>
							<td>
								<input type="hidden" name="data[<?php echo $key ?>][id_siswa]" class="form-control"  value="<?php echo $value['id_siswa'] ?>">
								<input type="text" name="data[<?php echo $key ?>][rfid]" class="form-control" value="<?php echo $value['rfid'] ?>">
							</td>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
      	
			<hr>

			<button class="btn btn-success btn-sm" type="submit"><i class="icon-floppy-disk"></i> Submit</button>

			</form>
</div>

<script type="text/javascript">
	$( "#app-proses-submit" ).on('submit',function( e ) {
        e.preventDefault();
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
            	var rsp = JSON.parse(data);

            	toastr.success(rsp.msg);
            });
        return false;
    });
</script>