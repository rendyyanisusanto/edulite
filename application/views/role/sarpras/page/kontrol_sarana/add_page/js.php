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

	$('.table_pemohon').on('change', function(e){
			$(".idtablepemohon_fk").select2({
		         ajax: { 
		           url: '<?php echo base_url('admin/kontrol_sarana/get_pemohon/') ?>'+$(this).val(),
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

	});

	function add_cart(kode) {
		// 
		send_ajax('kontrol_sarana/add_row', {id:$('.siswa').val()}).then(function(data){
			$('.tbl-cart tbody').append(data);
			count_tr();
		});
		

	}

	function all_cart() {
		// 
		send_ajax('kontrol_sarana/add_row_all', {}).then(function(data){
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
			$('.tbl-cart tbody').append('<tr class="empty-data"><td colspan="6"><center><b>Data masih kosong</b></center></td></tr>')
		}

	}
	$('.btn-add').on('click', function(e){
		e.stopImmediatePropagation();
		add_cart();	
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
	function get_item(val){
		// console.log($('.select-sarana'+val).val());

		send_ajax('kontrol_sarana/get_detail_item/'+$('.select-sarana'+val).val(),{}).then(function(data){
			var resp = JSON.parse(data);
			$('.jumlah_awal'+val).val(resp.sarana.jumlah);
			$('.jumlah_akhir'+val).val(resp.sarana.jumlah);
			// console.log();
		});
	}
	
</script>