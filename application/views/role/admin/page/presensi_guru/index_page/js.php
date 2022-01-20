
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
    send_ajax( 'Presensi_guru/get_presensi',{} ).then( function(data){
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
                    send_ajax( 'Presensi_guru/save_presensi_firebase',{
                        id_guru:id,
                        status:status,
                        kode:newKode
                    } ).then( function(data){
                        let userRef = database.ref('edulite/'+id);
                            userRef.remove()
                        call_guru();
                    });
                 });
                
            })
          }
</script>