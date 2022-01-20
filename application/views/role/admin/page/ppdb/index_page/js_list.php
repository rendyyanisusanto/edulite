  <script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-database.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.2.4/firebase-analytics.js"></script>

<script type="text/javascript">

  var firebaseConfig = {
      apiKey: "AIzaSyAtZVyFCNwMMeg9XP2QFS2u-gUC-BLgmHU",
      authDomain: "smkitasy-syadzili.firebaseapp.com",
      projectId: "smkitasy-syadzili",
      storageBucket: "smkitasy-syadzili.appspot.com",
      messagingSenderId: "1057992476629",
      appId: "1:1057992476629:web:f3c8e64823cb3538781f5c",
      measurementId: "G-ZDCFD3EPEF"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    firebase.analytics();
	  var firebase=firebase.database();

	  var last = 0;

	  firebase.database().ref('pendaftaran_ppdb').on( 'value', function(val){
	  	var hasil = val.val();
	  	console.log(hasil)
	  });
</script>