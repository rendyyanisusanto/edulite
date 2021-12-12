<script type="text/javascript">
	$(".tipe").select2({});

	$(document.body).on('change', '.tipe', function(e){
		send_ajax('Pelanggaran_siswa/set_laporan', {tipe:$(this).val()}).then(function(data){
			$('.p-next').html(data);
		})
	});

	$(document).on('submit', '#app-submit', function(e){
		blockui($('.panel-presensi'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			$('.panel-presensi').html(data);
			unblockui($('.panel-presensi'));
		});

		return false;
	});

	$(document).on('click', '.btn-prt', function(e){
        PrintElem('proses-pelanggaran');
    })
    function PrintElem(elem)
    {
        var mywindow = window.open('', 'PRINT', 'height=400,width=600');

        mywindow.document.write('<html><head><title>' + document.title  + '</title>');
        mywindow.document.write('</head><body >');
        mywindow.document.write('<h1>' + document.title  + '</h1>');
        mywindow.document.write(document.getElementById(elem).innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        mywindow.close();

        return true;
    }
</script>