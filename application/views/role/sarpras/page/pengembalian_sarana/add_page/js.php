<script type="text/javascript">
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

	$(".no_peminjaman_sarana").select2({
		         ajax: { 
		           url: '<?php echo base_url('sarpras/pengembalian_sarana/get_peminjaman_sarana') ?>',
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

	$('.no_peminjaman_sarana').on("select2:select", function(e) { 

	   send_ajax("pengembalian_sarana/process_data/"+$(this).val(),{}).then(function(data){
	   	$('.proses').html(data);
	   });
	});
	function add_cart(kode) {
		// 
		send_ajax('pengembalian_sarana/add_row', {id:$('.siswa').val()}).then(function(data){
			$('.tbl-cart tbody').append(data);
			count_tr();
		});
	}
	function count_tr()
	{
		var lngth = $('.tbl-cart tbody tr').length;

		if(lngth >= 1)
		{
			$('.empty-data').remove();

		}else{
			$('.empty-data').remove();
			$('.tbl-cart tbody').append('<tr class="empty-data"><td colspan="5"><center><b>Data masih kosong</b></center></td></tr>')
		}

	}
	$('.btn-add').on('click', function(e){
		e.stopImmediatePropagation();

		if($('.idtablepemohon_fk').val() !== null)
		{
			add_cart();	
		}else{
			toastr.error('Pilih pemohon terlebih dahulu');
		}
	})
	$(document).on('click', '.btn-dl-item', function(e){
		e.stopImmediatePropagation();

		$('#tr'+$(this).data('rowid')).remove();
		count_tr();
	})
	function clear_table()
	{
		$('.tbl-cart tbody tr').remove();
		count_tr();
	}
	
</script>