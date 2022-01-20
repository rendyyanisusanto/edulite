<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->

    <link href="<?php echo base_url('include/template/limitless2/')?>global_assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <script src="<?php echo base_url('include/template/limitless2/')?>global_assets/js/core/libraries/jquery.min.js"></script>

    <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-analytics.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.3.1/firebase-database.js"></script>
    <link rel="stylesheet" href="<?php echo base_url('include/template/toastr/toastr.css')?>">
    <link rel="stylesheet" href="<?php echo base_url('include/core/core.css')?>">
    <script src="<?php echo base_url('include/core/core.js')?>"></script>
    <script src="<?php echo base_url('include/template/toastr/toastr.min.js')?>"></script>
    <title>Presensi Guru</title>
  </head>
  <body>
    <nav class="navbar navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand">V-Attendance</a>
      </div>
    </nav>
    <div class="container" style="margin-top: 5%;">
      <div class="row">
        <div class="col-md-4">
          <img src="<?php echo base_url('include/media/qr/'.date('Y-m-d').'.png') ?>" class="rounded mx-auto d-block" alt="...">
        </div>
        <div class="col-md-8">
          <div class="card">
            <div class="card-body">
              <div class="notif"></div>
              <div class="panel-guru"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
  

<script>
  var firebaseConfig = {
    apiKey: "AIzaSyD1QDYvFlK2Mtm2Gw9JVwji3msn-4QQkXM",
    authDomain: "edulite-adc7a.firebaseapp.com",
    projectId: "edulite-adc7a",
    storageBucket: "edulite-adc7a.appspot.com",
    messagingSenderId: "569083660451",
    appId: "1:569083660451:web:d2356ff8725722b6251716"
  };
  firebase.initializeApp(firebaseConfig);
  var database = firebase.database();
</script>
<script type="text/javascript">
$( "#app-submit" ).on('submit',function( e ) {
    e.preventDefault();
        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
            call_guru();
        });
    return false;
});
call_guru();
function call_guru()
{
    send_ajax( '<?php echo base_url('presensi_guru/get_presensi') ?>',{} ).then( function(data){
        $('.panel-guru').html(data);
    });
}
get_data();

          function get_data()
          {
            var data = database.ref('edulite');

            data.on('value', (snapshot)=>{
                // const ref = snapshot.val();
                snapshot.forEach(function(childSnapshot) {
                      var childData = childSnapshot.val();
                      var id=childData.id;
                        var status = childData.status;
                        var kode = childData.kode;
                    var newKode = kode.replace(/[\\"]/g, '');

                    console.log(id);
                    send_ajax( '<?php echo base_url('Presensi_guru/save_presensi_firebase') ?>',{
                        id_guru:id,
                        status:status,
                        kode:newKode
                    } ).then( function(data){
                        $('.notif').html(data);
                        call_guru();
                        setTimeout(function(){ 
                         let userRef = database.ref('edulite/'+id);
                            userRef.remove();

                          $('.notif').html("");
                        }, 5000);
                       
                        
                        
                    });
                 });
                
            })
          }
</script>
  </body>
</html>