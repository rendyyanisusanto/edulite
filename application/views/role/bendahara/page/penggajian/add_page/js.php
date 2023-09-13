<script type="text/javascript">
	
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    // $('.se-pre-con').css('display','block');
	        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            // $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            // toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});

	function proses_penggajian(){
		send_ajax('Penggajian/proses', {idtemplate : $('.template_penggajian').val()}).then(function(data){
			$('.content-penggajian').html(data);
		})
	}

	function remove_div(id)
	{
		$('.md'+id).remove();
	}
	function remove_tr(id){
		$('.tr'+id).remove();
	}
	function remove_trk(id){
		$('.trk'+id).remove();
	}
	function addtr(id){
		var rnd = Math.floor(Math.random() * 99999);
		var tr = '<tr class="tr'+rnd+'">';
			tr += '<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_tr('+rnd+')"><i class="icon-close2"></i></button></td>'
			tr +='	<td><input class="form-control" name="data['+id+'][komponen_tambahan_debit]['+rnd+'][nama]"></input></td>';
			tr +='	<td colspan="4"><input class="form-control" name="data['+id+'][komponen_tambahan_debit]['+rnd+'][keterangan]" placeholder="Keterangan ..."></input></td>';
			tr +='	<td>';
		    tr +='      <div class="input-group">';
		    tr +='        	<span class="input-group-addon">Rp.</span>';
		    tr +='        	<input class="form-control " name="data['+id+'][komponen_tambahan_debit]['+rnd+'][jumlah]"></input>';
		    tr +='       </div>';
		    tr +='   </td>';
		    tr +='</tr>';

		  $('.tbl'+id).append(tr)
	}
	function addtrk(id){
		var rnd = Math.floor(Math.random() * 99999);
		var tr = '<tr class="tr'+rnd+'">';
			tr += '<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_tr('+rnd+')"><i class="icon-close2"></i></button></td>'
			tr +='	<td><input class="form-control" name="data['+id+'][komponen_tambahan_kredit]['+rnd+'][nama]"></input></td>';
			tr +='	<td><input class="form-control" name="data['+id+'][komponen_tambahan_kredit]['+rnd+'][keterangan]"></input></td>';
			tr +='	<td>';
		    tr +='      <div class="input-group">';
		    tr +='        	<span class="input-group-addon">Rp.</span>';
		    tr +='        	<input class="form-control" name="data['+id+'][komponen_tambahan_kredit]['+rnd+'][jumlah]"></input>';
		    tr +='       </div>';
		    tr +='   </td>';
		    tr +='</tr>';

		  $('.tblk'+id).append(tr)
	}
	function count_total(id){
		// alert(id);
		let jumlah = $('.jml'+id).val();
		let sum = $('.sum'+id).val();

		$('.total'+id).val(jumlah*sum);
	}
</script>