<script type="text/javascript">
  set_map(<?php echo $data_get['alumni'] ?>);
  var map;
    function set_map(locations)
    {
      console.log(locations)
      map = new google.maps.Map(document.getElementById('gmap'), {
        zoom: 9,
        center: new google.maps.LatLng(<?php echo $profil_website['lat'] ?>, <?php echo $profil_website['lng'] ?>),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });

      var infowindow = new google.maps.InfoWindow();

      var marker, i;

      for (i = 0; i < locations.length; i++) {  
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
          map: map,
          label: locations[i].id_alumni,
          icon: locations[i].icon
        });

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
            infowindow.setContent(locations[i].nama);
            infowindow.open(map, marker);
          }
        })(marker, i));
      }
    }

    function routeMap(routeLat, routeLng) {
      set_map(<?php echo $data_get['alumni'] ?>);
      infoWindow = new google.maps.InfoWindow();
      
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(
            (position) => {
              const pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude,
              };
              

              var start = new google.maps.LatLng(pos.lat, pos.lng);
            //var end = new google.maps.LatLng(38.334818, -181.884886);
              var end = new google.maps.LatLng(routeLat, routeLng);
                var option ={
                    zoom : 10,
                    center : start 
                };
              var display = new google.maps.DirectionsRenderer();
              var services = new google.maps.DirectionsService();
              display.setMap(map);
                  var request ={
                      origin : start,
                      destination:end,
                      travelMode: 'DRIVING'
                  };
                  services.route(request,function(result,status){
                      if(status =='OK'){
                          display.setDirections(result);
                      }
                  });

                console.log(pos)
              },
              () => {
                handleLocationError(true, infoWindow, map.getCenter());
              }
          );
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      


    }
</script>