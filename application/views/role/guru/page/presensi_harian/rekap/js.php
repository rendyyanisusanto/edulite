<script type="text/javascript">
    $( "#app-proses" ).on('submit',function( e ) {
        e.preventDefault();
            blockui($('.panel-head'));
            blockui($('.proses-absen'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){

                
                setTimeout(function(){ 
                    $('.panel-option').css('display','');
                    $('.proses-absen').html(data);

                    unblockui($('.panel-head'));
                    unblockui($('.proses-absen'));
                }, 1000);
            });
        return false;
    });
    $( document).on('submit',"#app-proses-save" ,function( e ) {
        e.preventDefault();
        e.stopImmediatePropagation();
        // $('.se-pre-con').css('display','block');
                $('.btn-submit').attr('disabled', 'true');
                $('.btn-submit').html('<i class="icon-spinner"></i> Menunggu Proses');
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                // $('.proses-absen').html(data);
                // toastr.success('Data berhasil proses, Refresh untuk melihat perubahan');
                set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
    $( document ).on('submit',"#app-import",function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        blockui($('.panel-upl'));
        blockui($('.proses-absen'));
           var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                setTimeout(function(){ 
                    send_ajax_file( 'presensi_harian/proses_presensi_harian',form_data).then( function(data){
                        $('.proses-absen').html(data);
                    });
                    toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                    unblockui($('.proses-absen'));
                    unblockui($('.panel-upl'));
                }, 1000);
                
            });
        return false;
    });

    $(document).on('change', '.tipe', function(e){
        send_ajax('Presensi_harian/get_laporan_tipe/'+$(this).val(),{}).then(function(data){
            $('.p-next').html(data);
        })
    });

    $(document).on('click', '.btn-prt', function(e){
        PrintElem('proses-absen');
    })
    function PrintElem(elem)
    {
        var mywindow = window.open('', 'PRINT', 'height=400,width=600');

        mywindow.document.write('<html><head><title>' + document.title  + '</title>');
        mywindow.document.write('</head><body >');
        mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById(elem).innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        mywindow.close();

        return true;
    }
</script>