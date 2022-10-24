<script type="text/javascript">
	
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
	        send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	        });
	    return false;
	});
	var map = new google.maps.Map(document.getElementById('gmap'), {
      zoom: 10,
      center: new google.maps.LatLng(<?php echo $profil_website['lat'] ?>, <?php echo $profil_website['lng'] ?>),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });


    var infowindow = new google.maps.InfoWindow();
   
   	google.maps.event.addListener(map, 'click', function(event) {
      addMarker(this, event.latLng);
    });

	var marker;
	
	function addMarker(peta, posisiTitik){
	    var latlngpos = posisiTitik.toJSON();
	    if( marker ){
	      // pindahkan marker
	      marker.setPosition(posisiTitik);
	    } else {
	      // buat marker baru
	      marker = new google.maps.Marker({
	        position: posisiTitik,
	        map: peta
	      });
	    }

	    $('.lat').val(latlngpos.lat);
	    $('.lng').val(latlngpos.lng);


	}

</script>