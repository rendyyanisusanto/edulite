
<script type="text/javascript">
    get_stats_nav();
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

    function get_detail(id)
    {
        $('#modal-detail').modal('toggle');
        blockui(".body-detail");
        send_ajax('kontrol_sarana/get_detail/'+id,{}).then(function(data){
            
            setTimeout(function(){
                $('.body-detail').html(data);
                unblockui(".body-detail");
            }, 1000);
        });
    }

    function get_stats_nav()
    {
        blockui('.stats-nav');
        send_ajax("kontrol_sarana/get_stats_nav", {}).then(function(data){
            setTimeout(function(){
                $('.stats-nav').html(data);
                unblockui('.stats-nav');
            }, 1000)
        });
    }
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
                
                set_content('<?php echo $data_get['param']['table'] ?>/edit_page/'+$("input[name='get-check']:checked").val(),{});
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
                set_content('<?php echo $data_get['param']['table'] ?>/detail_all/'+$("input[name='get-check']:checked").val(),{});
            }
    });

    $("#cetak-btn").click(function(e){
    e.stopImmediatePropagation();
            var check = [];
                $.each($("input[name='get-check']:checked"), function(){            
                    check.push($(this).val());
                });
                console.log(check);
                set_content('<?php echo $data_get['param']['table'] ?>/cetak_page',{send_data:check});
            
    });
    

</script>