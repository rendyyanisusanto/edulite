<script type="text/javascript">
	setTimeout(function(){ 
                    start();
                }, 1000);
	$(".siswa").select2({
         ajax: { 
           url: '<?php echo base_url('BK/pelanggaran_siswa/get_siswa') ?>',
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
  $(".poinpelanggaran").select2({
         ajax: { 
           url: '<?php echo base_url('BK/pelanggaran_siswa/get_poinpelanggaran') ?>',
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

	function start()
	{
		$('.poinpelanggaran').val('<?php echo $data_get['pelanggaran_siswa']['idpoinpelanggaran_fk'] ?>').trigger('change');
	}
</script>