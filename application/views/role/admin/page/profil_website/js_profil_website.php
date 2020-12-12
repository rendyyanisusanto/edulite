<script type="text/javascript">
    $( "#app-submit" ).on('submit',function( e ) {
              var foto= $('#logo').prop('files')[0];
              var form_data = new FormData();

              form_data.append('nama_website', $('#nama_website').val());
              form_data.append('singkatan', $('#singkatan').val());
              form_data.append('pemilik', $('#pemilik').val());
              form_data.append('alamat', $('#alamat').val());
              form_data.append('no_hp', $('#no_hp').val());

              form_data.append('email', $('#email').val());
              form_data.append('facebook', $('#facebook').val());
              form_data.append('twitter', $('#twitter').val());
              form_data.append('youtube', $('#youtube').val());
              form_data.append('instagram', $('#instagram').val());
              form_data.append('logo', foto);
              
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
                    set_content('profil_website/get_data');

                },
                error: function (jXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
            return false;
     });
</script>