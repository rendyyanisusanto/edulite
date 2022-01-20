
<script type="text/javascript">
    get_stats_all();
    get_stats_today();
    var table=$('#tabel-data').DataTable( {
       "processing": true, 
            "serverSide": true, 
            "order": [], 
             
            "ajax": {
                "url": "<?php echo $data_get['param']['table'] ?>/datatable",
                "type": "POST",
            },
 
            "columnDefs": [
            { 
                "targets": [ 0 ], 
                "orderable": false, 
            },
            ],
    } );
    $('#filter_submit').on('click',function(){
        table.ajax.reload();
    });  
    $("#del-btn").click(function(){
            var check = [];
            if ($("input[name='get-check']:checked").length==0) {

                toastr.options.positionClass = "toast-bottom-right";
                toastr.options.progressBar = true;
                toastr.options.closeButton = true;
                toastr.error('PILIH DATA TERLEBIH DAHULU');
            }else{
                $.each($("input[name='get-check']:checked"), function(){            
                    check.push($(this).val());
                });
                $.ajax({
                    url : '<?php echo $data_get['param']['table'] ?>/hapus',
                    type: "POST",
                    data: {data_get:check},
                    success: function (data) {
                        set_content('<?php echo $data_get['param']['table'] ?>/get_data');
                        $('.se-pre-con').css('display','block');
                        $(".se-pre-con").fadeOut("slow");
                        toastr.options.positionClass = "toast-bottom-right";
                        toastr.options.progressBar = true;
                        toastr.options.closeButton = true;
                        toastr.success('Data berhasil dihapus, Refresh untuk melihat perubahan');
                        

                    },
                    error: function (jXHR, textStatus, errorThrown) {
                        alert(errorThrown);
                    }
                });
               
            }
    });

    $("#edit-btn").click(function(){
            var check = [];
            if ($("input[name='get-check']:checked").length==0) {

                toastr.options.positionClass = "toast-bottom-right";
                toastr.options.progressBar = true;
                toastr.options.closeButton = true;
                toastr.error('PILIH DATA TERLEBIH DAHULU');
            }else if ($("input[name='get-check']:checked").length>1) {

                toastr.options.positionClass = "toast-bottom-right";
                toastr.options.progressBar = true;
                toastr.options.closeButton = true;
                toastr.error('PILIH SATU DATA');
            }else{
                
                // set_content('<?php echo $data_get['param']['table'] ?>/edit_page',{send_data:$("input[name='get-check']:checked").val()});
            }
    });

    $('#import-btn').click(function(){
        set_content('<?php echo $data_get['param']['table'] ?>/import',{});
    });
    $("#dtl-btn").click(function(){
            var check = [];
            if ($("input[name='get-check']:checked").length==0) {

                toastr.options.positionClass = "toast-bottom-right";
                toastr.options.progressBar = true;
                toastr.options.closeButton = true;
                toastr.error('PILIH DATA TERLEBIH DAHULU');
            }else if ($("input[name='get-check']:checked").length>1) {

                toastr.options.positionClass = "toast-bottom-right";
                toastr.options.progressBar = true;
                toastr.options.closeButton = true;
                toastr.error('PILIH SATU DATA');
            }else{
                set_content('<?php echo $data_get['param']['table'] ?>/detail_all',{send_data:$("input[name='get-check']:checked").val()});
            }
    });

    $("#cetak-btn").click(function(){
            var check = [];
            
                $.each($("input[name='get-check']:checked"), function(){            
                    check.push($(this).val());
                });
                set_content('<?php echo $data_get['param']['table'] ?>/cetak_page',{send_data:check});
            
    });
    
/* function */
    function get_stats_all(){
        blockui('.panel-stats-all');
        send_ajax( 'Global_controller/get_stats_all/<?php echo $data_get['param']['table'] ?>',{} ).then( function(data){
            setTimeout(function(){
                $('.txt-total').text(data);
                unblockui($('.panel-stats-all'));
            }, 500);
        });
    }
    function get_stats_today(){
        blockui('.panel-stats-today');
        send_ajax( 'Global_controller/get_stats_today/<?php echo $data_get['param']['table'] ?>',{} ).then( function(data){
            setTimeout(function(){
                $('.txt-today').text(data);
                unblockui($('.panel-stats-today'));
            }, 500);
        });
    }
/* end function*/
</script>