<script type="text/javascript">
	hitung();
	function add_cart(kode) {
		count_tr();
		var number = 1 + Math.floor(Math.random() * 9999999);
		var td = '<tr id="tr'+number+'">';
			td += '<td><button class="btn btn-xs btn-danger btn-dl-item" data-rowid="'+number+'" type="button"><i class="icon-trash"></i></button></td>';
			td += '<td><input type="text" name="detail['+number+'][keterangan]" class="form-control"></td>';
			td += '<td><input type="number" name="detail['+number+'][jumlah]" class="form-control inp-jml" ></td>';
			td += '</tr>';
		$('.tbl-cart tbody').append(td);

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
			$('.tbl-cart tbody').append('<tr class="empty-data"><td colspan="3"><center><b>Data masih kosong</b></center></td></tr>')
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
		add_cart();
	})
	$(document).on('click', '.btn-dl-item', function(e){
		e.stopImmediatePropagation();

		$('#tr'+$(this).data('rowid')).remove();
		hitung();
		count_tr();
	})
</script>