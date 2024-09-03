<script type="text/javascript">
	
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});
	function tambah_peserta(){
		var rand = Math.floor(Math.random() * 9999999);
		var tr  = '<br />';
			tr += '<label>Peserta</label><br/><select onchange="get_select('+rand+');" data-rand="'+rand+'" name= "data['+rand+'][table]" class="form-control table-id'+rand+'">';
			tr += '<option value="">Pilih</option>';
			tr += '<option value="siswa">Siswa</option>';
			tr += '<option value="guru">Guru</option>';
			tr += '</select>';
			tr += '<br/><label>Nama</label><br/><select name="data['+rand+'][idanggota_fk]" class="form-control select select'+rand+'">';
			tr += '<option value="">Pilih</option>';
			tr += '</select>';
			tr += '<br />';
		$('.peserta').append(tr);
	}

	function get_select(rnd){
		$(".select"+rnd).select2({
	         ajax: { 
	           url: '<?php echo $data_get['param']['table'] ?>/get_user/'+$('.table-id'+rnd).val(),
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
	}
</script>