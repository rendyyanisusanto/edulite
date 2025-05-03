<script type="text/javascript">

// Define element

	// Initialize with options
	// Data dummy komponen dari server (bisa replace dengan ajax)
	var komponenList = [
	];
	
	var komponenDropdown = komponenList.map(k => k.nama); // Untuk dropdown saja
	var komponenMap = {}; // Untuk lookup data
	komponenList.forEach(k => komponenMap[k.nama] = k);

	// Handsontable config
	var hot_headers = document.getElementById('hot_headers');
	var hot_headers_init = new Handsontable(hot_headers, {
		data: Array.from({ length: 10 }, () => ({})),
		rowHeaders: true,
		colHeaders: ['Komponen Pembayaran', 'Total', 'Sisa', 'Periode',  'Jumlah', 'Keterangan'],
		columns: [
			{
				data: 'komponen',
				type: 'dropdown',
				source: komponenDropdown
			},
			{ data: 'total', 
				readOnly: true,
				type: 'numeric',
				numericFormat: {
					pattern: '0,0',
					culture: 'id-ID'
				},
				renderer: function (instance, td, row, col, prop, value, cellProperties) {
					td.innerHTML = value ? formatRupiah(value) : '';
					return td;
				}
			 },
			{ data: 'sisa', readOnly: true,
				type: 'numeric',
				numericFormat: {
					pattern: '0,0',
					culture: 'id-ID'
				},
				renderer: function (instance, td, row, col, prop, value, cellProperties) {
					td.innerHTML = value ? formatRupiah(value) : '';
					return td;
				}
			 },
			{
				data: 'periode',
				type: 'date',
				dateFormat: 'YYYY-MM',
				correctFormat: true,
				allowInvalid: false,
				renderer: PeriodeRenderer,
				datePickerConfig: {
				firstDay: 1,
				showWeekNumber: false
				}// custom renderer tetap boleh
			},{
				data: 'jumlah',
				type: 'numeric',
				numericFormat: {
					pattern: '0,0',
					culture: 'id-ID'
				},
				renderer: function (instance, td, row, col, prop, value, cellProperties) {
					td.innerHTML = value ? formatRupiah(value) : '';
					return td;
				}
			},
			{ data: 'keterangan' },
			
		],
		cells: function (row, col) {
			const cellProperties = {};
			const rowData = this.instance.getSourceDataAtRow(row);

			if (col === 3 && rowData && rowData.bulanan == 0) {
				cellProperties.readOnly = true;
			}

			return cellProperties;
		},
		afterChange: function(changes, source) {
		if (source === 'edit' && changes) {
				changes.forEach(([row, prop, oldVal, newVal]) => {
					if (prop === 'komponen' && newVal && window.komponenMap[newVal]) {
						const selected = window.komponenMap[newVal];

						hot_headers_init.setDataAtRowProp(row, 'total', selected.jumlah);
						hot_headers_init.setDataAtRowProp(row, 'sisa', selected.jumlah - selected.pembayaran);
						hot_headers_init.setDataAtRowProp(row, 'jumlah', selected.jumlah_bayar);
						hot_headers_init.setDataAtRowProp(row, 'bulanan', selected.bulanan);
					}
					const isLastRow = row === hot_headers_init.countRows() - 1;

					// Jika user mengisi kolom "komponen" di baris terakhir, tambah baris
					if (isLastRow && prop === 'komponen' && newVal) {
						hot_headers_init.alter('insert_row');
					}

					if (prop === 'periode' && newVal) {
						const dataRow = hot_headers_init.getSourceDataAtRow(row);
						const komponenNama = hot_headers_init.getDataAtRowProp(row, 'komponen'); // misalnya 'Pendaftaran'
						const komponen = komponenMap[komponenNama]; // ambil dari map

						const idjenispenerimaan = komponen?.id; 
						$.post('<?= base_url('admin/Transaksi_tanggungan_siswa/cek_periode_terpakai') ?>', {
							idsiswa_fk: $('select[name="idsiswa_fk"]').val(),
							idjenispenerimaan_fk: idjenispenerimaan,
							periode: newVal
						}, function (res) {
							if (res.status) {
								toastr.warning(res.msg);
								hot_headers_init.setDataAtCell(row, hot_headers_init.propToCol('periode'), null); // reset
							}
						}, 'json');
					}
				});
			}
			hitungTotalJumlah();
		},
		enterMoves: {
			row: 0,    // Tetap di baris yang sama
			col: 1     // Pindah ke kolom kanan
		},

		afterSelection: function (row, col, row2, col2, preventScrolling, selectionLayerLevel) {
        	selectedRow = row;
        },
		stretchH: 'all',
		width: '100%',
		height: 250,
		licenseKey: 'non-commercial-and-evaluation',
	});

	function formatRupiah(angka, prefix = 'Rp ') {
		const numberString = angka.toString().replace(/[^,\d]/g, '');
		const split = numberString.split(',');
		let sisa = split[0].length % 3;
		let rupiah = split[0].substr(0, sisa);
		const ribuan = split[0].substr(sisa).match(/\d{3}/g);

		if (ribuan) {
			rupiah += (sisa ? '.' : '') + ribuan.join('.');
		}

		rupiah = split[1] !== undefined ? rupiah + ',' + split[1] : rupiah;
		return prefix + rupiah;
	}

	function rupiahToNumber(rupiahString) {
		if (!rupiahString) return 0;
		return parseInt(rupiahString.replace(/[^,\d]/g, '').replace(',', ''), 10) || 0;
	}

	function PeriodeEditor(instance, td, row, col, prop, value, cellProperties) {
		const rowData = instance.getSourceDataAtRow(row);
		if (rowData && rowData.bulanan == 0) {
			// Disable input editor
			cellProperties.readOnly = true;
		}
		return Handsontable.editors.DateEditor.prototype;
	}
	function PeriodeRenderer(instance, td, row, col, prop, value, cellProperties) {
		const rowData = instance.getSourceDataAtRow(row);
		Handsontable.renderers.TextRenderer.apply(this, arguments);

		if (rowData && rowData.bulanan == 0) {
			td.innerText = 'Tanpa Periode';
			td.style.color = '#999';
			td.style.fontStyle = 'italic';
		}
	}
	function loadKomponenListToDropdown() {
		const sourceList = window.komponenList ? window.komponenList.map(k => k.nama) : [];
		const dropdownColumn = hot_headers_init.getSettings().columns[0];

		// Update source
		dropdownColumn.source = sourceList;

		// Refresh dropdown dengan force render
		hot_headers_init.updateSettings({
			columns: hot_headers_init.getSettings().columns
		});
	}

	$('.btn-add').on('click', function(e){
		e.stopImmediatePropagation();

		if($('.siswa').val() !== null)
		{
			send_ajax('Transaksi_tanggungan_siswa/get_tanggungan', {id:$('.siswa').val()}).then(function(res){
				 // Misal data = array of componentList
				 let data = JSON.parse(res);
					console.log(data.tanggungan);

					// Simpan ke variable global
					window.komponenList = data.tanggungan.map(function(item) {
						return {
							id: item.id,
							nama: item.nama,
							jumlah: parseInt(item.jumlah),
							pembayaran: item.pembayaran ? parseInt(item.pembayaran) : 0,
							jumlah_bayar: item.jumlah_bayar,
							bulanan: parseInt(item.bulanan) || 0 // ⬅️ fix: pastikan 0 jika kosong/null
						};
					});

					// 🧠 Update komponenMap baru!
					window.komponenMap = {};
					window.komponenList.forEach(k => window.komponenMap[k.nama] = k);

					// Tambah row kosong 1 baris
					hot_headers_init.alter('insert_row');
					const rowIndex = hot_headers_init.countRows() - 1;
					hot_headers_init.setDataAtRowProp(rowIndex, 'komponen', '');
					hot_headers_init.setDataAtRowProp(rowIndex, 'total', '');
					hot_headers_init.setDataAtRowProp(rowIndex, 'sisa', '');
					hot_headers_init.setDataAtRowProp(rowIndex, 'keterangan', '');
					hot_headers_init.setDataAtRowProp(rowIndex, 'jumlah', '');
					hot_headers_init.setDataAtRowProp(rowIndex, 'periode', '');
					hot_headers_init.setDataAtRowProp(rowIndex, 'bulanan', 1); // default nilai bulanan
					
					loadKomponenListToDropdown();
			});
		}else{
			toastr.error('Pilih siswa terlebih dahulu');
		}
	})

	function hitungTotalJumlah() {
		if (!hot_headers_init) return;

		let total = 0;
		const data = hot_headers_init.getData(); // aman dan tidak undefined

		data.forEach(row => {
			if (row && typeof row[5] !== 'undefined' && row[5] !== null &&row[5]!== '') {
				const jumlah =  parseInt((row[5])) || 0;
				total += jumlah;
			}
			// console.log(row[5]);
		});
		$('.total').val(total);
		$('.text-total').text('Total : Rp.' + total.toLocaleString('id-ID'));
	}

	// end handsontable

	$(".siswa").select2({
	         ajax: { 
	           url: '<?php echo base_url('admin/penerimaan/get_siswa') ?>',
	           type: "post",
	           dataType: 'json',
	           delay: 250,
	           data: function (params) {
	              return {
	                searchTerm: params.term // search term
	              };
	           },
	           processResults: function (response) {
	              return {
	                 results: response
	              };
	           },
	           cache: true
	         }
	     });
	$('.siswa').on('select2:select', function (e) {
			var data = e.params.data; // Ambil data yang dipilih
			// console.log('ID:', data.id, 'Text:', data.text);
			
			send_ajax('Transaksi_tanggungan_siswa/get_content_siswa', {id:data.id}).then(function(data){
				$('.content-siswa').html(data);
			});

			send_ajax('Transaksi_tanggungan_siswa/get_tanggungan', {id:$('.siswa').val()}).then(function(res){
				 // Misal data = array of componentList
				 let data = JSON.parse(res);
					// console.log(data.tanggungan);

					// Simpan ke variable global
					window.komponenList = data.tanggungan.map(function(item) {
						return {
							id: item.id,
							nama: item.nama,
							jumlah: parseInt(item.jumlah),
							jumlah_bayar: item.jumlah_bayar,
							pembayaran: item.pembayaran ? parseInt(item.pembayaran) : 0,
							bulanan: parseInt(item.bulanan) || 0 // ⬅️ fix: pastikan 0 jika kosong/null
						};
					});

					// 🧠 Update komponenMap baru!
					window.komponenMap = {};
					window.komponenList.forEach(k => window.komponenMap[k.nama] = k);

					loadKomponenListToDropdown();

			});
	});
	
	$('.siswa').on('change', function(e){
		e.stopImmediatePropagation()
		clear_table();
	})
	function add_cart(kode) {
		send_ajax('Transaksi_tanggungan_siswa/add_row', {id:$('.siswa').val()}).then(function(data){
			$('.tbl-cart tbody').append(data);
			count_tr();
		});
	}
	function count_tr()
	{
		var lngth = $('.tbl-cart tbody tr').length;

		if(lngth >= 1)
		{
			$('.empty-data').remove();
			hitung();

		}else{
			$('.empty-data').remove();
			$('.tbl-cart tbody').append('<tr class="empty-data"><td colspan="5"><center><b>Data masih kosong</b></center></td></tr>')
		}

	}
	function hitung()
	{
		var total = 0;
		$('.inp-jml').each(function(e){
			total+=parseInt($(this).val());
		});
		$('.total').val(parseInt(total));
		$('.text-total').text('Total : '+parseInt(total));
	}
	function appendHidden(name, value) {
		$('<input>', {
			type: 'hidden',
			name: name,
			value: value
		}).appendTo('#app-submit');
	}
	$( "#app-submit" ).on('submit',function( e ) {
	    e.stopImmediatePropagation();
	    e.preventDefault();
	    $('.se-pre-con').css('display','block');
		
		// Filter detail yang valid
		const dataDetail = hot_headers_init.getSourceData().filter(row => {
			const jumlah = parseInt(row.jumlah);
			return row.komponen && jumlah > 0;
		});


		// Validasi minimal satu baris
		if (dataDetail.length === 0) {
			toastr.warning('Silakan isi minimal satu komponen dengan jumlah > 0');
			$(".se-pre-con").hide();
			return false;
		}

		// Bersihkan input detail lama
		$('input[name^="detail"]').remove();

		// Buat input hidden
		
		let valid = true;
		dataDetail.forEach((row, index) => {
			const komponen = window.komponenMap[row.komponen] || {};
			// 🔍 Validasi jika komponen bersifat bulanan dan periode kosong
			if (komponen.bulanan == 1 && (!row.periode || row.periode.trim() === '')) {
				valid = false;
				toastr.warning(`Periode wajib diisi untuk komponen bulanan di baris ${index + 1}`);
			}
			appendHidden(`detail[${index}][idjenispenerimaan_fk]`, komponen.id || '');
			appendHidden(`detail[${index}][jumlah]`, (row.jumlah) || 0);
			appendHidden(`detail[${index}][keterangan]`, row.keterangan || '');
			appendHidden(`detail[${index}][periode]`, row.periode || '');
		});
		if (!valid) return false;
	    send_ajax( $(this).attr('action'),$(this).serialize() ).then( function(data){
	        $(".se-pre-con").fadeOut("slow");
	        // console.log(data);
	        toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
	         set_content('<?php echo $data_get['param']['table'] ?>/get_data');
	    });
	    return false;
	});

	$(document).on('keyup change', '.inp-jml', function(e){
		e.stopImmediatePropagation();
		hitung();
	})
	
	
	$(document).on('click', '.btn-dl-item', function(e){
		e.stopImmediatePropagation();

		$('#tr'+$(this).data('rowid')).remove();
		hitung();
		count_tr();
	})
	function clear_table()
	{
		$('.tbl-cart tbody tr').remove();
		count_tr();
	}
	$(document).on('change','.select-tanggungan', function(e){
		e.stopImmediatePropagation();
		var rowid = $(this).data('row');
		if($(this).find(':selected').attr('data-bulanan') == 1){
			$('.periode'+rowid).css('display', '');
			$('.bulanan'+rowid).val(1);
		}else{
			$('.periode'+rowid).css('display', 'none');
			$('.bulanan'+rowid).val(0);
		}
		
		$('.total'+rowid).val($(this).find(':selected').attr('data-jumlah'));
		$('.sisa'+rowid).val($(this).find(':selected').attr('data-sisa'));
		if ($(this).find(':selected').attr('data-sisa') == "0") {

			$('.txtjml'+rowid).attr('disabled', 'true');
			$('.txtjml'+rowid).attr('placeholder', 'Sudah lunas...');
		}else{
			$('.txtjml'+rowid).removeAttr('disabled');
			$('.txtjml'+rowid).attr('placeholder', '');
		}

	})
</script>