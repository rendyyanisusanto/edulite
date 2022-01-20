<script type="text/javascript">
	var table=$('#tabel-data').DataTable( {
       "processing": true, 
            "serverSide": true, 
            "order": [], 
             
            "ajax": {
                "url": "<?php echo $data_get['param']['table'] ?>/datatable_poin",
                "type": "POST",
            },
 
            "columnDefs": [
            { 
                "targets": [ 0 ], 
                "orderable": false, 
            },
            ],
    } );
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	   
	        var form_data = new FormData(this);
        	send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	        });
	    return false;
	});
</script>