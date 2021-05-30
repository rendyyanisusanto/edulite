<script type="text/javascript">
	$( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
        // $('.se-pre-con').css('display','block');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                $('.proses-rapor').html(data);
                // toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
    

    $(document).on("click", ".btn-upload", function(e){
        e.stopImmediatePropagation();
        $(".idsiswa_fk").val($(this).data("id"));
        $(".idtahunajaran_fk").val($(this).data("tahun_ajaran"));
        $(".idkelas_fk").val($(this).data("kelas"));
        $(".modal-title-upload").text("Upload Rapor "+$(this).data("nama"));
        $("#modal_upload").modal("toggle");
    })

    $( document ).on('submit',".app-import",function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
        // $('.se-pre-con').css('display','block');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                $(".flrp").val("");
                $("#modal_upload").modal("toggle");
                toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                $('.proses-rapor').html(data);
                // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
</script>