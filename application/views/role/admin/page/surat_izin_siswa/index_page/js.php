<script type="text/javascript">
    var table, currentPage = 1, currentPageEdit = 1, searchTimeout, searchTimeoutEdit;
    var selectedStudents = [], selectedStudentsEdit = [];

    $(document).ready(function() {
        // Initialize DataTable
        table = $('#tabel-data').DataTable({
            "processing": true, 
            "serverSide": true, 
            "order": [], 
            "ajax": {
                "url": "<?php echo $data_get['param']['table'] ?>/datatable",
                "type": "POST",
                "data": function(data){
                    data.tanggal_mulai = $(".tanggal_mulai").val();
                    data.tanggal_selesai = $(".tanggal_selesai").val();
                }
            },
            "columnDefs": [
                { 
                    "targets": [0], 
                    "orderable": false,
                    "className": "text-center"
                },
                {
                    "targets": [1, 7],
                    "className": "text-center"
                }
            ],
            "language": {
                "processing": "Memproses data...",
                "lengthMenu": "Tampilkan _MENU_ data per halaman",
                "zeroRecords": "Data tidak ditemukan",
                "info": "Menampilkan _START_ sampai _END_ dari _TOTAL_ data",
                "infoEmpty": "Tidak ada data yang tersedia",
                "infoFiltered": "(difilter dari _MAX_ total data)",
                "search": "Cari:",
                "paginate": {
                    "first": "Pertama",
                    "last": "Terakhir", 
                    "next": "Selanjutnya",
                    "previous": "Sebelumnya"
                }
            }
        });

        // Initialize events
        initializeEvents();
    });

    function initializeEvents() {
        // Modal tambah events
        $('#modal-tambah').on('show.bs.modal', function() {
            resetModalTambah();
        });

        // Search siswa tambah
        $('#search-siswa').on('keyup', function() {
            clearTimeout(searchTimeout);
            var query = $(this).val();
            searchTimeout = setTimeout(function() {
                if (query.length >= 2 || query.length === 0) {
                    currentPage = 1;
                    searchSiswa(query, false);
                }
            }, 500);
        });

        // Search siswa edit
        $('#search-siswa-edit').on('keyup', function() {
            clearTimeout(searchTimeoutEdit);
            var query = $(this).val();
            searchTimeoutEdit = setTimeout(function() {
                if (query.length >= 2 || query.length === 0) {
                    currentPageEdit = 1;
                    searchSiswaEdit(query, false);
                }
            }, 500);
        });

        // Load more buttons
        $('#load-more-btn').on('click', function() {
            var query = $('#search-siswa').val();
            currentPage++;
            searchSiswa(query, true);
        });

        $('#load-more-btn-edit').on('click', function() {
            var query = $('#search-siswa-edit').val();
            currentPageEdit++;
            searchSiswaEdit(query, true);
        });

        // Form submissions
        $("#form-tambah").on('submit', handleFormTambah);
        $("#form-edit").on('submit', handleFormEdit);

        // Filter events
        $('.tanggal_mulai, .tanggal_selesai').on('change', function(e){
            e.stopImmediatePropagation();
            table.ajax.reload();
        });

        // Button events
        $("#del-btn").on('click', handleDelete);
        $("#edit-btn").on('click', handleEdit);
    }

    function resetModalTambah() {
        selectedStudents = [];
        currentPage = 1;
        $('#form-tambah')[0].reset();
        $('#search-siswa').val('');
        updateSelectedStudentsDisplay();
        $('#daftar-siswa').html(`
            <div class="text-center text-muted p-20">
                <i class="icon-search4 icon-2x mb-10"></i>
                <div>Mulai ketik untuk mencari siswa...</div>
            </div>
        `);
        $('#load-more-container').hide();
    }

    function searchSiswa(query, append = false) {
        var container = '#daftar-siswa';
        var loadMoreContainer = '#load-more-container';
        
        if (!append) {
            $(container).html('<div class="text-center"><i class="icon-spinner2 spinner"></i> Mencari siswa...</div>');
        }

        send_ajax('surat_izin_siswa/get_siswa', {
            search: query,
            page: currentPage
        }).then(function(response) {
            var data = JSON.parse(response);
            displayStudentList(data, container, loadMoreContainer, append, 'tambah');
        }).catch(function() {
            $(container).html('<div class="text-center text-danger p-20">Gagal memuat data siswa</div>');
        });
    }

    function searchSiswaEdit(query, append = false) {
        var container = '#daftar-siswa-edit';
        var loadMoreContainer = '#load-more-container-edit';
        
        if (!append) {
            $(container).html('<div class="text-center"><i class="icon-spinner2 spinner"></i> Mencari siswa...</div>');
        }

        send_ajax('surat_izin_siswa/get_siswa', {
            search: query,
            page: currentPageEdit
        }).then(function(response) {
            var data = JSON.parse(response);
            displayStudentList(data, container, loadMoreContainer, append, 'edit');
        }).catch(function() {
            $(container).html('<div class="text-center text-danger p-20">Gagal memuat data siswa</div>');
        });
    }

    function displayStudentList(data, container, loadMoreContainer, append, mode) {
        var html = '';
        var selectedIds = mode === 'tambah' ? selectedStudents : selectedStudentsEdit;

        if (data.data.length === 0 && !append) {
            html = '<div class="text-center text-muted p-20">Tidak ada siswa ditemukan</div>';
        } else {
            data.data.forEach(function(siswa) {
                var isSelected = selectedIds.some(s => s.id_siswa == siswa.id_siswa);
                html += `
                    <div class="student-item ${isSelected ? 'selected' : ''}" 
                         data-id="${siswa.id_siswa}" 
                         data-nama="${siswa.nama}" 
                         data-kelas="${siswa.kelas}"
                         onclick="toggleStudent(this, '${mode}')">
                        <div class="student-name">${siswa.nama}</div>
                        <div class="student-class">Kelas: ${siswa.kelas}</div>
                    </div>
                `;
            });
        }

        if (append) {
            $(container).append(html);
        } else {
            $(container).html(html);
        }

        // Handle load more button
        if (data.has_more) {
            $(loadMoreContainer).show();
        } else {
            $(loadMoreContainer).hide();
        }
    }

    function toggleStudent(element, mode) {
        var $el = $(element);
        var studentData = {
            id_siswa: $el.data('id'),
            nama: $el.data('nama'),
            kelas: $el.data('kelas')
        };

        var selectedArray = mode === 'tambah' ? selectedStudents : selectedStudentsEdit;
        var existingIndex = selectedArray.findIndex(s => s.id_siswa == studentData.id_siswa);

        if (existingIndex > -1) {
            // Remove from selection
            selectedArray.splice(existingIndex, 1);
            $el.removeClass('selected');
        } else {
            // Add to selection
            selectedArray.push(studentData);
            $el.addClass('selected');
        }

        if (mode === 'tambah') {
            selectedStudents = selectedArray;
        } else {
            selectedStudentsEdit = selectedArray;
        }

        updateSelectedStudentsDisplay(mode);
    }

    function updateSelectedStudentsDisplay(mode = 'tambah') {
        var selectedArray = mode === 'tambah' ? selectedStudents : selectedStudentsEdit;
        var containerSelector = mode === 'tambah' ? '#selected-students' : '#selected-students-edit';
        var listSelector = mode === 'tambah' ? '#selected-list' : '#selected-list-edit';
        var countSelector = mode === 'tambah' ? '#selected-count' : '#selected-count-edit';

        if (selectedArray.length > 0) {
            $(containerSelector).show();
            $(countSelector).text(selectedArray.length);

            var html = '';
            selectedArray.forEach(function(siswa) {
                html += `
                    <span class="selected-student-tag">
                        ${siswa.nama} - ${siswa.kelas}
                        <span class="remove-student" onclick="removeStudent(${siswa.id_siswa}, '${mode}')">&times;</span>
                    </span>
                `;
            });
            $(listSelector).html(html);
        } else {
            $(containerSelector).hide();
        }
    }

    function removeStudent(id_siswa, mode) {
        var selectedArray = mode === 'tambah' ? selectedStudents : selectedStudentsEdit;
        var index = selectedArray.findIndex(s => s.id_siswa == id_siswa);
        
        if (index > -1) {
            selectedArray.splice(index, 1);
            
            if (mode === 'tambah') {
                selectedStudents = selectedArray;
            } else {
                selectedStudentsEdit = selectedArray;
            }

            // Update visual state
            updateSelectedStudentsDisplay(mode);
            $(`.student-item[data-id="${id_siswa}"]`).removeClass('selected');
        }
    }

    function handleFormTambah(e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        
        if (selectedStudents.length === 0) {
            toastr.error('Pilih minimal satu siswa!');
            return false;
        }

        $('.se-pre-con').css('display','block');
        var form_data = new FormData(this);
        
        // Add selected students
        selectedStudents.forEach(function(siswa) {
            form_data.append('siswa_terpilih[]', siswa.id_siswa);
        });
        
        send_ajax_file($(this).attr('action'), form_data).then(function(data) {
            $(".se-pre-con").fadeOut("slow");
            toastr.success('Data berhasil ditambahkan');
            $('#modal-tambah').modal('hide');
            table.ajax.reload();
        }).catch(function() {
            $(".se-pre-con").fadeOut("slow");
            toastr.error('Gagal menyimpan data');
        });
        return false;
    }

    function handleFormEdit(e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        
        if (selectedStudentsEdit.length === 0) {
            toastr.error('Pilih minimal satu siswa!');
            return false;
        }

        $('.se-pre-con').css('display','block');
        var form_data = new FormData(this);
        
        // Add selected students
        selectedStudentsEdit.forEach(function(siswa) {
            form_data.append('siswa_terpilih[]', siswa.id_siswa);
        });
        
        send_ajax_file($(this).attr('action'), form_data).then(function(data) {
            // $(".se-pre-con").fadeOut("slow");
            toastr.success('Data berhasil diupdate');
            $('#modal-edit').modal('hide');
            table.ajax.reload();
        }).catch(function() {
            // $(".se-pre-con").fadeOut("slow");
            toastr.error('Gagal mengupdate data');
        });
        return false;
    }

    function handleDelete() {
        var check = [];
        if ($("input[name='get-check']:checked").length == 0) {
            toastr.error('Pilih data terlebih dahulu!');
        } else {
            if(confirm('Apakah Anda yakin ingin menghapus data ini?')) {
                $.each($("input[name='get-check']:checked"), function(){            
                    check.push($(this).val());
                });
                
                $('.se-pre-con').css('display','block');
                $.ajax({
                    url: '<?php echo $data_get['param']['table'] ?>/hapus',
                    type: "POST",
                    data: {data_get: check},
                    success: function (data) {
                        $('.se-pre-con').fadeOut("slow");
                        table.ajax.reload();
                        toastr.success('Data berhasil dihapus');
                    },
                    error: function (jXHR, textStatus, errorThrown) {
                        $('.se-pre-con').fadeOut("slow");
                        toastr.error('Gagal menghapus data');
                    }
                });
            }
        }
    }
    function generate_kode_surat() {
    // Show loading state
        $('.kode').prop('disabled', true).val('Generating...');
        
        $.ajax({
            url: 'surat_izin_siswa/generate_kode', // sesuaikan dengan controller Anda
            type: 'POST',
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    $('.kode').val(response.kode);
                    
                } else {
                    alert('Gagal generate kode surat');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('Terjadi kesalahan saat generate kode');
            },
            complete: function() {
                // Remove loading state
                $('.kode').prop('disabled', false);
            }
        });
    }
    function handleEdit() {
        var checked = $("input[name='get-check']:checked");
        if (checked.length == 0) {
            toastr.error('Pilih data terlebih dahulu!');
        } else if (checked.length > 1) {
            toastr.error('Pilih hanya satu data untuk diedit!');
        } else {
            var id = checked.val();
            loadDataEdit(id);
        }
    }

    function loadDataEdit(id) {
        // $('.se-pre-con').css('display','block');
        send_ajax('surat_izin_siswa/get_data_edit', {id: id}).then(function(data) {
            var result = JSON.parse(data);
            var surat = result.surat;
            var siswa_terpilih = result.siswa_terpilih;
            
            // Reset edit modal
            selectedStudentsEdit = siswa_terpilih;
            currentPageEdit = 1;
            
            // Fill form fields
            $('#edit_id').val(surat.id_surat_izin_siswa);
            $('#edit_kode').val(surat.kode);
            $('#edit_kegiatan').val(surat.kegiatan);
            $('#edit_tanggal_mulai').val(surat.tanggal_mulai);
            $('#edit_tanggal_selesai').val(surat.tanggal_selesai);
            $('#edit_waktu_mulai').val(surat.waktu_mulai);
            $('#edit_waktu_selesai').val(surat.waktu_selesai);
            $('#edit_tempat').val(surat.tempat);
            $('#edit_pendamping').val(surat.pendamping);
            $('#edit_status').val(surat.status);
            
            // Update selected students display
            updateSelectedStudentsDisplay('edit');
            
            // Clear search and show initial state
            $('#search-siswa-edit').val('');
            $('#daftar-siswa-edit').html(`
                <div class="text-center text-muted p-20">
                    <i class="icon-search4 icon-2x mb-10"></i>
                    <div>Mulai ketik untuk mencari siswa...</div>
                </div>
            `);
            $('#load-more-container-edit').hide();
            
            $('.se-pre-con').fadeOut("slow");
            $('#modal-edit').modal('show');
        }).catch(function() {
            $('.se-pre-con').fadeOut("slow");
            toastr.error('Gagal memuat data untuk diedit');
        });
    }

    // Configure toastr
    toastr.options = {
        "closeButton": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "timeOut": "3000"
    };
</script>