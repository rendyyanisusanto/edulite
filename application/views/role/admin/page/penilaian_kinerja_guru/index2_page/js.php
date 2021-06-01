<script type="text/javascript">
	get_proses_now();
	$(document).on('click', '.btn-proses', function(e){
		e.stopImmediatePropagation();
		get_proses_now();
	})

	$(document).on('submit', '#app-submit-sub', function(e){
		e.stopImmediatePropagation();
		blockui($('.panel-top'));
		blockui($('.panel-proses'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){
			toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
			unblockui('.panel-top');
			unblockui('.panel-proses');
		});
		return false;
	})

	$(document).on('submit', '#app-submit-modal', function(e){
		e.stopImmediatePropagation();
		blockui($('.modal-pkg'));
		send_ajax($(this).attr('action'), $(this).serialize()).then(function(data){

			toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
			
			unblockui($('.modal-pkg'));
			$('.modal-pkg').modal('toggle');
			get_proses_now();
		});
		return false;
	})

	function get_proses_now(){
		blockui($('.panel-top'));
		blockui($('.panel-proses'));

		send_ajax('Penilaian_kinerja_guru/get_proses_now', {
			id_tahun_ajaran : $('.tahun_ajaran').val(),
			periode 		: 	$('.periode_form').val()
		}).then(function(data){

			$('.panel-nilai').html(data);
			unblockui('.panel-top');
			unblockui('.panel-proses');
		});
	}

	$(document).on('click', '.btn-edit-pkg', function(e){
		e.stopImmediatePropagation();
		$('.btn-save-modal').removeClass('btn-primary');
		$('.btn-save-modal').addClass('btn-success');
		$('.btn-save-modal').text('Ubah Data');
		$('#app-submit-modal').attr('action', 'Penilaian_kinerja_guru/update_pkg');
		set_pkg( $(this).data('idguru'), $('.htahun').val(), $('.hbulan').val(), $('.htahun_ajaran').val(), 1);
	});

	$(document).on('click', '.btn-add-pkg', function(e){
		e.stopImmediatePropagation();
		$('.btn-save-modal').addClass('btn-primary');
		$('.btn-save-modal').removeClass('btn-success');
		$('.btn-save-modal').text('Simpan Data');
		$('#app-submit-modal').attr('action', 'Penilaian_kinerja_guru/save_pkg');
		set_pkg( $(this).data('idguru'), $('.htahun').val(), $('.hbulan').val(), $('.htahun_ajaran').val(), 0);
	});

	function set_pkg(idguru, tahun,bulan, ta, is_edit)
	{
		send_ajax('Penilaian_kinerja_guru/set_pkg', 
			{
				id_guru : 	idguru, 
				tahun 	: 	tahun,
				bulan 	: 	bulan,
				tahun_ajaran : ta,
				is_edit : 	is_edit
			}).then(function(data){
			$('.modal-content-body').html(data);
			$('.modal-pkg').modal('toggle');
		});
	}
</script>