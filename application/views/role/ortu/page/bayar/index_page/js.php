<script>

$('#pay-button').click(function (event) {
      event.preventDefault();
      $(this).attr("disabled", "disabled");

    $.ajax({
      url: '<?php echo base_url('ortu/Bayar') ?>/token',
      cache: false,
      method : 'POST',
      data : {
          jumlah : $('.jumlah').val(),
      },
      success: function(data) {
        //location = data;

        console.log('token = '+data);
        
        var resultType = document.getElementById('result-type');
        var resultData = document.getElementById('result-data');

        function changeResult(type,data){
          $("#result-type").val(type);
          $("#result-data").val(JSON.stringify(data));
          //resultType.innerHTML = type;
          //resultData.innerHTML = JSON.stringify(data);
        }

        snap.pay(data, {

          onSuccess: function(result){
            changeResult('success', result);
            console.log(result.status_message);
            console.log(result);
          },
          onPending: function(result){
            changeResult('pending', result);
            console.log(result.status_message);
            $("#payment-form").submit();
          },
          onError: function(result){
            changeResult('error', result);
            console.log(result.status_message);
          }
        });
      }
    });
  });

  $( "#payment-form" ).on('submit',function( e ) {
    e.preventDefault();
    e.stopImmediatePropagation();
    $('.se-pre-con').css('display','block');


       var form_data = new FormData(this);
        send_ajax_file( "<?php echo base_url('ortu/bayar/simpan') ?>",form_data).then( function(data){
            $(".se-pre-con").fadeOut("slow");
            console.log(data);
            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
            set_content('Dashboard/get_data');
        });
    return false;
});

</script>