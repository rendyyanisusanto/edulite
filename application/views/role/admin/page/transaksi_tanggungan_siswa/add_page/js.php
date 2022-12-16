<script type="text/javascript">
	$(".siswa").select2({
	         ajax: { 
	           url: '<?php echo base_url('admin/penerimaan/get_siswa') ?>',
	           type: "post",
	           dataType: 'json',
	           delay: 250,
	           data: function (params) {
	              return {
	                searchTerm: params.term // search term
	              };
	           },
	           processResults: function (response) {
	              return {
	                 results: response
	              };
	           },
	           cache: true
	         }
	     });
	$('.siswa').on('change', function(e){
		e.stopImmediatePropagation()
		clear_table();
	})
	function add_cart(kode) {
		// 
		send_ajax('Transaksi_tanggungan_siswa/add_row', {id:$('.siswa').val()}).then(function(data){
			$('.tbl-cart tbody').append(data);
			count_tr();
		});
		// var number = 1 + Math.floor(Math.random() * 9999999);
		// var td = '<tr id="tr'+number+'">';
		// 	td += '<td width="1%"><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="'+number+'" type="button"><i class="icon-trash"></i></button></td>';
		// 	td += '<td><input type="text" name="detail['+number+'][keterangan]" class="form-control"></td>';
		// 	td += '<td><input type="number" name="detail['+number+'][jumlah]" class="form-control inp-jml" ></td>';
		// 	td += '</tr>';
		

	}
	function count_tr()
	{
		var lngth = $('.tbl-cart tbody tr').length;

		if(lngth >= 1)
		{
			$('.empty-data').remove();
			hitung();

		}else{
			$('.empty-data').remove();
			$('.tbl-cart tbody').append('<tr class="empty-data"><td colspan="5"><center><b>Data masih kosong</b></center></td></tr>')
		}

	}
	function hitung()
	{
		var total = 0;
		$('.inp-jml').each(function(e){
			total+=parseInt($(this).val());
		});
		$('.total').val(parseInt(total));
		$('.text-total').text('Total : '+parseInt(total));
	}

	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});

	$(document).on('keyup change', '.inp-jml', function(e){
		e.stopImmediatePropagation();
		hitung();
	})
	$('.btn-add').on('click', function(e){
		e.stopImmediatePropagation();

		if($('.siswa').val() !== null)
		{
			add_cart();	
		}else{
			toastr.error('Pilih siswa terlebih dahulu');
		}
	})
	
	$(document).on('click', '.btn-dl-item', function(e){
		e.stopImmediatePropagation();

		$('#tr'+$(this).data('rowid')).remove();
		hitung();
		count_tr();
	})
	function clear_table()
	{
		$('.tbl-cart tbody tr').remove();
		count_tr();
	}
	$(document).on('change click','.select-tanggungan', function(e){
		e.stopImmediatePropagation();
		var rowid = $(this).data('row');

		$('.total'+rowid).val($(this).find(':selected').attr('data-jumlah'));
		$('.sisa'+rowid).val($(this).find(':selected').attr('data-sisa'));
		if ($(this).find(':selected').attr('data-sisa') == "0") {

			$('.txtjml'+rowid).attr('disabled', 'true');
			$('.txtjml'+rowid).attr('placeholder', 'Sudah lunas...');
		}else{
			$('.txtjml'+rowid).removeAttr('disabled');
			$('.txtjml'+rowid).attr('placeholder', '');
		}

	})
</script>