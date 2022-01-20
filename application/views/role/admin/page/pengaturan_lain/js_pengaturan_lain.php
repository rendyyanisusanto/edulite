<script type="text/javascript">
    $( "#app-submit" ).on('submit',function( e ) {
              var foto= $('#background').prop('files')[0];
              var form_data = new FormData();

              form_data.append('wa_text', $('#wa_text').val());
              form_data.append('background', foto);
              
            $.ajax({
                url : $(this).attr('action') || window.location.pathname,
                type: "POST",
                data:form_data,
                processData:false,
                contentType:false,
                cache:false,
                async:false,
                success: function (data) {
                    
                    $('.se-pre-con').css('display','block');
                    $(".se-pre-con").fadeOut("slow");
                    
                    toastr.success('Data berhasil diubah, Refresh untuk melihat perubahan');
                    set_content('pengaturan_lain/get_data');

                },
                error: function (jXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
            return false;
     });
</script>