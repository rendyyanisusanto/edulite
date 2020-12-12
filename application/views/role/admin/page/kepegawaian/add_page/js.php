<script type="text/javascript">
	
	$('.select').select2();
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    // $('.se-pre-con').css('display','block');
	        var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
	            $(".se-pre-con").fadeOut("slow");
	            // console.log(data);
	            // toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	            // set_content('kepegawaian/get_data');
	        });
	    return false;
	});

	$('.btn-add-anak').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr id="anak_'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "anak_'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="anak['+rnd+'][nama]" class="form-control" ></td>'
			tr += '<td><input type="text" name="anak['+rnd+'][tempat_lahir]" class="form-control" ></td>'
			tr += '<td><input type="date" name="anak['+rnd+'][tanggal_lahir]" class="form-control" ></td>'
			tr += '<td><input type="text" name="anak['+rnd+'][nama_ibu]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-anak tbody').append(tr)
	})

	$('.btn-add-pendidikan').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr id="pdd'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "pdd'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="pdd['+rnd+'][jenis]" class="form-control" ></td>'
			tr += '<td><input type="text" name="pdd['+rnd+'][berijazah]" class="form-control" ></td>'
			tr += '<td><input type="date" name="pdd['+rnd+'][tahun]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-pendidikan tbody').append(tr)
	})
	$('.btn-add-kursus').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr  id="kursus'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "kursus'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="kursus['+rnd+'][jenis]" class="form-control" ></td>'
			tr += '<td><input type="text" name="kursus['+rnd+'][tahun]" class="form-control" ></td>'
			tr += '<td><input type="text" name="kursus['+rnd+'][bulan]" class="form-control" ></td>'
			tr += '<td><input type="text" name="kursus['+rnd+'][hari]" class="form-control" ></td>'
			tr += '<td><input type="text" name="kursus['+rnd+'][tingkat]" class="form-control" ></td>'
			tr += '<td><input type="text" name="kursus['+rnd+'][keterangan]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-kursus tbody').append(tr)
	})
	$('.btn-add-riwayat-pns').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr  id="riwpns'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "riwpns'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="riwpns['+rnd+'][pangkat]" class="form-control" ></td>'
			tr += '<td><input type="text" name="riwpns['+rnd+'][jabatan]" class="form-control" ></td>'
			tr += '<td><input type="number" name="riwpns['+rnd+'][gaji]" class="form-control" ></td>'
			tr += '<td><input type="text" name="riwpns['+rnd+'][terhitung_mulai]" class="form-control" ></td>'
			tr += '<td><input type="text" name="riwpns['+rnd+'][keterangan]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-riwayat-pns tbody').append(tr)
	})
	$('.btn-add-riwayat-swasta').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr  id="riwswasta'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "riwswasta'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text"  name="riwswasta['+rnd+'][jenis]" class="form-control" ></td>'
			tr += '<td><input type="text" name="riwswasta['+rnd+'][tahun]" class="form-control" ></td>'
			tr += '<td><input type="text" name="riwswasta['+rnd+'][keterangan]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-riwayat-swasta tbody').append(tr)
	})
	$('.btn-add-mapel').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr  id="mapel'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "mapel'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="mapel['+rnd+'][mapel]" class="form-control" ></td>'
			tr += '<td><input type="text" name="mapel['+rnd+'][sekolah]" class="form-control" ></td>'
			tr += '<td><input type="text" name="mapel['+rnd+'][kelas]" class="form-control" ></td>'
			tr += '<td><input type="text" name="mapel['+rnd+'][tahun]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-mapel tbody').append(tr)
	})
	$('.btn-add-organisasi').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr  id="organisasi'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "organisasi'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="organisasi['+rnd+'][organisasi]" class="form-control" ></td>'
			tr += '<td><input type="text" name="organisasi['+rnd+'][jabatan]" class="form-control" ></td>'
			tr += '<td><input type="text" name="organisasi['+rnd+'][tahun]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-organisasi tbody').append(tr)
	})
	$('.btn-add-hobi').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
		var tr = '<tr  id="hobi'+rnd+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "hobi'+rnd+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="hobi['+rnd+'][jenis]" class="form-control" ></td>'
			tr += '<td><input type="text" name="hobi['+rnd+'][aktif]" class="form-control" ></td>'
			tr += '<td><input type="text" name="hobi['+rnd+'][kapan]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-hobi tbody').append(tr)
	})
	$('.btn-add-dokumen').on('click', function(e){
		e.stopImmediatePropagation();
		rnd = random_string(5);
	    var tbl = $('.tbl-dokumen tbody');
	    var tblcount = $('.tbl-dokumen tbody tr').length;
		var tr = '<tr  id="dokumen'+tblcount+'">'
			tr += '<td><button class="btn-danger btn-del" data-rnd = "dokumen'+tblcount+'" type="button"><i class="icon-trash"></i></button></td>'
			tr += '<td><input type="text" name="dokumen['+tblcount+'][nama]" class="form-control" ></td>'
			tr += '<td><input type="file" name="dokumen['+tblcount+'][file_doc]" class="form-control" ></td>'
			tr += '<td><input type="text" name="dokumen['+tblcount+'][keterangan]" class="form-control" ></td>'
			tr += '</tr>'
		$('.tbl-dokumen tbody').append(tr)
	})

	$(document).on('click','.btn-del', function(e){
		e.stopImmediatePropagation();
		$('#'+$(this).data('rnd')).remove();
	});
</script>