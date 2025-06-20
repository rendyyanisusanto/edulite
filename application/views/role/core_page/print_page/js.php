<script type="text/javascript">
    $( "#cek" ).on('click',function( e ) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $('.se-pre-con').css('display','block');
            $.ajax({
                url : '<?php echo $data_get['param']['table'] ?>/cetak_data',
                type: "POST",
                data: $('#frm-set').serialize(),
                success: function (ans) {
                    $(".se-pre-con").fadeOut("slow");
                    if ($('#tipe_laporan').val() == 'pdf') {
                        $( "#display_dialog").html('<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="<?php echo base_url('include/pdf_temp/') ?>'+ans+'.pdf"></iframe></div>');
                    } else if($('#tipe_laporan').val() == 'excel') {
                        var rsp = JSON.parse(ans);
                        // window.location(rsp.file, '__blank');
                       $("#display_dialog").html('<a target="__blank" href="'+rsp.file+'">Download File Excel</a>');
                    } else if($('#tipe_laporan').val() == 'website'){
                        // alert();
                        $('#display_dialog').html(ans);
                    }
                },
                error: function (jXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
            return false;
     }); 
    $('#data_yg_dicetak').on ('change', function(e){
        e.stopImmediatePropagation();
        if (this.value == 'manual') {
            
            $('.filter').css('display','');
        }else{
            $('.filter').css('display','none');
        }
    });
    $('#tipe_laporan').on('change', function(e){
        e.stopImmediatePropagation();
        if (this.value == 'pdf') {
            $('.posisi').css('display', '');
        }else{
            $('.posisi').css('display', 'none');
        }

        if (this.value == 'website') {

        }
    });
    $(document).on('click', '.btn-cetak-web', function(e){
        e.stopImmediatePropagation();
        var divToPrint=document.getElementById('DivIdToPrint');

          var newWin=window.open('','Print-Window');
           var htmlToPrint = '' +
            '<style type="text/css">' +
            'table{width:100%;}'+
            'table th, table td {' +
            'border:1px solid #000;' +
            'padding;0.5em;' +
            '}' +
            '</style>';
            htmlToPrint += divToPrint.outerHTML;

          newWin.document.open();

          newWin.document.write(htmlToPrint);
          newWin.print();
          newWin.document.close();

          setTimeout(function(){newWin.close();},10);
    })
</script>