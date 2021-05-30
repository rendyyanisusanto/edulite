<script type="text/javascript">
	$(".kd").select2({
         ajax: { 
           url: '<?php echo base_url('guru/nilai/get_kd') ?>',
           type: "post",
           dataType: 'json',
           delay: 250,
           data: function (params) {
              return {
                searchTerm: params.term,
                idkelas : $('.idkelas_fk').val(),
                idmapel : $('.idmatapelajaran_fk').val(), // search term
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

  $( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
          blockui($('.proses-nilai'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                $('.proses-nilai').html(data);
                unblockui($('.proses-nilai'));
            });
        return false;
    });
  $( document ).on('submit',"#app-import",function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        blockui($('.proses-nilai'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                send_ajax_file( 'Nilai/proses_nilai_harian',form_data).then( function(data){
                    $('.proses-nilai').html(data);
                });
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                unblockui($('.proses-nilai'));
            });
        return false;
    });
</script>