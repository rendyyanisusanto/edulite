<script type="text/javascript">
	$(".siswa").select2({
         ajax: { 
           url: '<?php echo base_url('admin/pelanggaran_siswa/get_siswa') ?>',
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
	    var id = $('.siswa').val();
	    window.open('<?php echo base_url('admin/pelanggaran_siswa/print_kartu/') ?>' + id);
	});
</script>