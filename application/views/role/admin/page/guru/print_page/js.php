<script type="text/javascript">
    $( ".cek" ).on('click',function( e ) {
            e.preventDefault();
            $('.se-pre-con').css('display','block');
            $.ajax({
                url : 'jadwal_kegiatan_sekolah/cetak_data',
                type: "POST",
                data: $('#frm-set').serialize(),
                success: function (data) {
                    
                    
                    $(".se-pre-con").fadeOut("slow");
                    if ($('#tipe_laporan').val() == 'pdf') {
                        $( "#display_dialog").html('<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="<?php echo base_url('include/pdf_temp/') ?>'+data+'.pdf"></iframe></div>');
                    } else if($('#tipe_laporan').val() == 'excel') {
                            $('#frm-set').submit();
                    }
                },
                error: function (jXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
            return false;
     }); 
    $('#data_yg_dicetak').on ('change', function(e){
        if (this.value == 'manual') {
            e.preventDefault();
            $.ajax({
                url     :   'jadwal_kegiatan_sekolah/filter',
                type    :   "POST",
                success :   function(data){
                    $('.filter').html(data);
                }  
            });
        }else{
            $('.filter').html('');
        }
    });
</script>
