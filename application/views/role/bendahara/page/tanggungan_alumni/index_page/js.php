
<script type="text/javascript">
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

    var id_alumni_var = 0;

    $(document).on('click', '.btn-proc', function(e){
        e.stopImmediatePropagation();

        send_ajax('Tanggungan_alumni/content_panel',{id_alumni:$(this).data('id')}).then(function(data){
            id_alumni_var = $(this).data('id')
            $('.content-panel').html(data);
        })
    })
    
    $(document).on('submit', '#app-submit-modal', function(e){
        e.stopImmediatePropagation();

        send_ajax('Tanggungan_alumni/simpan_data', $(this).serialize()).then(function(data){
            $('#modal_add_tanggungan').modal("toggle");

            send_ajax('Tanggungan_alumni/content_panel',{id_alumni:$('.id_alumni').val()}).then(function(data){
                table.ajax.reload();
                $('.content-panel').html(data);
            })
        })

        
        return false;
    })

    $(document).on('submit', '#app-submit-update', function(e){
        e.stopImmediatePropagation();

        send_ajax('Tanggungan_alumni/update_data', $(this).serialize()).then(function(data){
            $('#modal_edit_tanggungan').modal("toggle");

            send_ajax('Tanggungan_alumni/content_panel',{id_alumni:$('.id_alumni').val()}).then(function(data){
                table.ajax.reload();
                $('.content-panel').html(data);
            })
        })

        
        return false;
    })

    $(document).on('click', '.btn-add-tanggungan', function(e){
        e.stopImmediatePropagation();

        $('#modal_add_tanggungan').modal("toggle");
    })

    $(document).on('click', '.btn-upd-tanggungan', function(e){
        e.stopImmediatePropagation();
        $(".id_tanggungan_alumni").val($(this).data('id'));
        $(".keterangan").val($(this).data('keterangan'));
        $(".jumlah").val($(this).data('jumlah'));
        $(".kas").val($(this).data('kas')).change();
        $(".diskon").val($(this).data('diskon')).change();
        $(".pendapatan").val($(this).data('pendapatan')).change();
        $(".piutang").val($(this).data('piutang')).change();
        $('#modal_edit_tanggungan').modal("toggle");
    })

    

    $(document).on('click', '.btn-del-tanggungan', function(e){
        var id_alumni = $(this).data("id");
        if (confirm("Apakah anda yakin menghapus tanggungan - "+ $(this).data("text")) == true) {
                    
                    send_ajax("Tanggungan_alumni/delete_tanggungan",{
                        id  : $(this).data("id")
                    }).then(function(data){
                        toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                        call_func(id_alumni);
                    });
       } 
    })

    function call_func(id_alumni)
    {
        send_ajax('Tanggungan_alumni/content_panel',{id_alumni:id_alumni}).then(function(data){
                table.ajax.reload();
                $('.content-panel').html(data);
        })
    }
</script>