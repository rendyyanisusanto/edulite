
<script type="text/javascript">
    var table=$('#tabel-data').DataTable( {
       "processing": true, 
            "serverSide": true, 
            "order": [], 
             
            "ajax": {
                "url": "transaksi_tanggungan_siswa/datatable",
                "type": "POST",
                "data":function(data){
                    data.tanggal_mulai = $(".tanggal_mulai").val();
                    data.tanggal_selesai = $(".tanggal_selesai").val();

                }
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
    $(document).on('click', '.btn-dtl-pemasukan', function(e){
        e.stopImmediatePropagation();
        // alert(); 
        send_ajax('transaksi_tanggungan_siswa/get_detail/'+$(this).data("id"),{} ).then( function(data){
            $('.modal-panel').html(data);
           $('.modal-title').text("Detail pemasukan")
            $("#modal_animation").modal('toggle');
        });
        
    })
    $('.tanggal_mulai').on('change', function(e){
        e.stopImmediatePropagation();

        table.ajax.reload();
    })
    $('.tanggal_selesai').on('change', function(e){
        e.stopImmediatePropagation();

        table.ajax.reload();
    })
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