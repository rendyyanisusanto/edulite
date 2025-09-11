<script type="text/javascript">
    // Initialize DataTable
    const initializeDataTable = () => {
        return $('#tabel-data').DataTable({
            processing: true,
            serverSide: true,
            order: [],
            ajax: {
                url: "<?php echo $data_get['param']['table'] ?>/datatable_poin",
                type: "POST",
                beforeSend: function() {
                    $('.panel-pelanggaran').addClass('loading');
                },
                complete: function() {
                    $('.panel-pelanggaran').removeClass('loading');
                }
            },
            dom: '<"datatable-header"fl><"datatable-scroll"t><"datatable-footer"ip>',
            language: {
                search: '<span>Filter:</span> _INPUT_',
                searchPlaceholder: 'Ketik untuk mencari...',
                lengthMenu: '<span>Tampilkan:</span> _MENU_',
                paginate: { 'first': 'Pertama', 'last': 'Terakhir', 'next': '→', 'previous': '←' },
                processing: '<i class="icon-spinner2 spinner"></i> Memuat data...',
                emptyTable: 'Tidak ada data yang tersedia'
            },
            columnDefs: [
                {
                    targets: [0],
                    orderable: false,
                },
                {
                    targets: [-2, -1],
                    orderable: false,
                    width: '60px',
                    className: 'text-center'
                },
                {
                    targets: [3],
                    className: 'text-center',
                    render: function(data, type, row) {
                        const badgeClass = data === 'PELANGGARAN' ? 'badge-warning' : 'badge-success';
                        return `<span class="badge ${badgeClass}">${data}</span>`;
                    }
                }
            ],
            drawCallback: function() {
                $('[data-popup="tooltip"]').tooltip();
            }
        });
    };

    // Handle form submission
    const handleFormSubmit = (table) => {
        $("#app-submit").on('submit', function (e) {
            e.preventDefault();

            const $submitButton = $('.btn-submit');
            $submitButton.attr('disabled', true).html('<i class="icon-spinner"></i> Menunggu Proses');

            blockui($('.panel-pelanggaran'));
            const formData = new FormData(this);

            send_ajax_file($(this).attr('action'), formData).then(() => {
                toastr.success('Data berhasil diproses. Refresh untuk melihat perubahan.');
                setTimeout(() => {
                    unblockui($('.panel-pelanggaran'));
                    table.ajax.reload();
                    $submitButton.attr('disabled', false);
                    resetForm();
                }, 1000);
            }).catch(() => {
                toastr.error('Terjadi kesalahan saat memproses data.');
                unblockui($('.panel-pelanggaran'));
                $submitButton.attr('disabled', false).html('Simpan');
            });
        });
    };

    // Handle edit button click
    const handleEditButtonClick = () => {
        $(document).on('click', '.btn-edit', function (e) {
            e.stopImmediatePropagation();

            const data = $(this).data();
            $('.id').val(data.id);
            $('.kode_pelanggaran').val(data.kode_pelanggaran);
            $('.nama_pelanggaran').val(data.nama_pelanggaran);
            $('.poin').val(data.poin);
            $('.idjenispelanggaran_fk').val(data.idjenispelanggaran_fk).trigger('change');

            $('#app-submit').attr('action', 'pelanggaran_siswa/update_poin');
            updateSubmitButton('Update', 'btn-warning', 'btn-success');
            $('.btn-batal').show();
        });
    };

    // Handle cancel button click
    const handleCancelButtonClick = () => {
        $(document).on('click', '.btn-batal', function (e) {
            e.stopImmediatePropagation();
            resetForm();
        });
    };

    // Update submit button text and classes
    const updateSubmitButton = (text, addClass, removeClass) => {
        const $submitButton = $('.btn-submit');
        $submitButton.text(text).removeClass(removeClass).addClass(addClass);
    };

    // Handle export buttons
    const handleExport = () => {
        $('.btn-export-excel').on('click', function() {
            window.location.href = 'pelanggaran_siswa/export_excel';
        });

        $('.btn-export-pdf').on('click', function() {
            window.location.href = 'pelanggaran_siswa/export_pdf';
        });
    };

    // Reset form to default state
    const resetForm = () => {
        $('.kode_pelanggaran, .nama_pelanggaran, .poin').val('');
        $('.idjenispelanggaran_fk, .kategori_pelanggaran').val('').trigger('change');
        $('#app-submit').attr('action', 'pelanggaran_siswa/simpan_poin');
        updateSubmitButton('<i class="icon-floppy-disk"></i> Simpan', 'btn-success', 'btn-warning');
        $('.btn-batal').hide();
    };

    // Handle delete button click
    const handleDeleteButton = (table) => {
        $(document).on('click', '.btn-hps', function () {
            const id = $(this).data('id');

            if (confirm('Apakah Anda yakin ingin menghapus data ini? Data yang dihapus tidak dapat dikembalikan!')) {
                $.ajax({
                    url: 'pelanggaran_siswa/hapus_poin',
                    type: 'POST',
                    data: { id: id },
                    success: function (response) {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            toastr.success(res.message);
                            table.ajax.reload();
                        } else {
                            toastr.error(res.message);
                        }
                    },
                    error: function () {
                        toastr.error('Terjadi kesalahan saat menghapus data.');
                    }
                });
            }
        });
    };

    // Initialize the script
    $(document).ready(() => {
        const table = initializeDataTable();
        handleFormSubmit(table);
        handleEditButtonClick();
        handleCancelButtonClick();
        handleExport();
        handleDeleteButton(table);

        // Initialize select2 if available
        if($.fn.select2) {
            $('.idjenispelanggaran_fk, .kategori_pelanggaran').select2();
        }
    });
</script>