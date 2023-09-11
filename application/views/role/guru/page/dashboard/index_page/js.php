<script type="text/javascript">
getLocation() 
	$(document).on('click', '.btn-check', function(e){
		e.stopImmediatePropagation();

		send_ajax('Dashboard/check', {status:$(this).data('status')}).then(function(data){
			toastr.success("Berhasil check in/out");
			set_content('Dashboard/get_data');
		});
	})

	var x = document.getElementById("mesJadwal");

	function getLocation() {
	  if (navigator.geolocation) {
	    navigator.geolocation.watchPosition(showPosition);
	  } else { 
	    x.innerHTML = "Geolocation is not supported by this browser.";
	  }
	}
	    
	function showPosition(position) {

	    var dst = distance(position.coords.latitude, position.coords.longitude, -7.9710528895669945, 112.73827940793157,"K");
	
	    if (dst <= 0.05) {
	    	$('.rowabsen').css('display', '');
		    x.innerHTML="Latitude: " + position.coords.latitude + 
		    "<br>Longitude: " + position.coords.longitude +
		    "<br>Radius: " + dst ;
	    }else{
	    	$('.rowabsen').css('display', 'none');
	    	x.innerHTML = "<b class='text-danger'><i class='icon-warning'></i> Anda tidak berada dalam jangkauan Edulite</b>";
	    }
	}	

	function distance(lat1, lon1, lat2, lon2, unit) {
	if ((lat1 == lat2) && (lon1 == lon2)) {
		return 0;
	}
	else {
		var radlat1 = Math.PI * lat1/180;
		var radlat2 = Math.PI * lat2/180;
		var theta = lon1-lon2;
		var radtheta = Math.PI * theta/180;
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
		if (dist > 1) {
			dist = 1;
		}
		dist = Math.acos(dist);
		dist = dist * 180/Math.PI;
		dist = dist * 60 * 1.1515;
		if (unit=="K") { dist = dist * 1.609344 }
		if (unit=="N") { dist = dist * 0.8684 }
		return dist;

	}
}
</script>