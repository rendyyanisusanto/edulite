<script>
// Global variables
var currentPage = 1;
var isLoading = false;
var hasMore = true;
var selectedSiswaIds = []; // Simple array untuk menyimpan ID yang dipilih

// MAIN INITIALIZATION FUNCTION - Panggil ini setelah halaman di-load
function initSuratIzin() {
    console.log('=== INIT SURAT IZIN START ===');
    
    // Reset variables
    currentPage = 1;
    isLoading = false;
    hasMore = true;
    selectedSiswaIds = [];
    
    // Check if elements exist
    if ($('#form-surat-izin').length === 0) {
        console.error('Form not found!');
        return;
    }
    
    if ($('#siswa-container').length === 0) {
        console.error('Container not found!');
        return;
    }
    
    console.log('Elements found, proceeding with initialization...');
    
    // Load siswa setelah delay
    setTimeout(function() {
        console.log('Loading siswa...');
        loadSiswa();
    }, 500);
    
    // Setup events - REMOVE OLD ONES FIRST
    setupAllEvents();
    
    console.log('=== INIT SURAT IZIN COMPLETE ===');
}

// Setup all events
function setupAllEvents() {
    console.log('Setting up events...');
    
    // Remove existing events first
    $('#search-siswa').off('input keyup change');
    $('#tanggal_mulai').off('change');
    $('#waktu_mulai').off('change');
    $('#form-surat-izin').off('submit');
    $('#siswa-container').off('click change');
    
    // Search event with delay
    let searchTimeout;
    $('#search-siswa').on('input keyup', function() {
        const searchValue = $(this).val();
        console.log('Search triggered:', searchValue);
        
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            console.log('Executing search for:', searchValue);
            currentPage = 1;
            loadSiswa(true);
        }, 500);
    });
    
    // Date events
    $('#tanggal_mulai').on('change', function() {
        const tanggalMulai = $(this).val();
        if (!$('#tanggal_selesai').val() || $('#tanggal_selesai').val() < tanggalMulai) {
            $('#tanggal_selesai').val(tanggalMulai);
        }
    });
    
    $('#waktu_mulai').on('change', function() {
        const waktuMulai = $(this).val();
        if (waktuMulai && !$('#waktu_selesai').val()) {
            const [hours, minutes] = waktuMulai.split(':');
            const newTime = new Date();
            newTime.setHours(parseInt(hours) + 1, parseInt(minutes));
            const formattedTime = newTime.toTimeString().slice(0, 5);
            $('#waktu_selesai').val(formattedTime);
        }
    });
    
    // Form submit
    $('#form-surat-izin').on('submit', function(e) {
        e.preventDefault();
        console.log('Form submitted');
        
        if (!validateForm()) {
            return false;
        }
        
        if (!confirm(`Simpan surat izin dengan ${selectedSiswaIds.length} siswa?`)) {
            return false;
        }
        
        submitForm();
    });
    
    console.log('Events setup completed');
}

// Load siswa dengan AJAX
function loadSiswa(reset = false) {
    if (isLoading) {
        console.log('Already loading, skipping...');
        return;
    }
    
    console.log('loadSiswa called - reset:', reset, 'page:', currentPage);
    
    if (reset) {
        currentPage = 1;
        $('#siswa-container').html('<div class="text-center"><i class="glyphicon glyphicon-refresh glyphicon-spin"></i> Memuat siswa...</div>');
    }
    
    isLoading = true;
    const search = $('#search-siswa').val() || '';
    
    console.log('Making AJAX request with search:', search);
    
    $.ajax({
        url: 'Surat_izin_siswa/get_siswa',
        type: 'POST',
        data: {
            search: search,
            page: currentPage
        },
        dataType: 'json',
        timeout: 10000,
        success: function(response) {
            console.log('AJAX Success:', response);
            
            if (reset) {
                $('#siswa-container').html('');
            }
            
            if (response && response.status === 'success' && response.data) {
                hasMore = response.has_more || false;
                
                if (response.data.length > 0) {
                    renderSiswaList(response.data, reset);
                } else if (currentPage === 1) {
                    $('#siswa-container').html('<div class="text-center text-muted"><p>Tidak ada siswa ditemukan</p><button onclick="loadSiswa(true)" class="btn btn-sm btn-primary">Coba Lagi</button></div>');
                }
            } else {
                console.error('Invalid response:', response);
                if (currentPage === 1) {
                    $('#siswa-container').html('<div class="text-center text-danger"><p>Error loading data</p><button onclick="loadSiswa(true)" class="btn btn-sm btn-primary">Coba Lagi</button></div>');
                }
            }
            
            updateLoadMoreButton();
            isLoading = false;
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', {
                status: status,
                error: error,
                responseText: xhr.responseText,
                readyState: xhr.readyState
            });
            
            let errorMsg = 'Error: ' + error;
            if (status === 'timeout') {
                errorMsg = 'Request timeout - coba lagi';
            } else if (status === 'parsererror') {
                errorMsg = 'Invalid JSON response';
            }
            
            if (currentPage === 1) {
                $('#siswa-container').html(`
                    <div class="text-center text-danger">
                        <p>${errorMsg}</p>
                        <button onclick="loadSiswa(true)" class="btn btn-sm btn-primary">Coba Lagi</button>
                        <br><small>Response: ${xhr.responseText.substring(0, 200)}</small>
                    </div>
                `);
            }
            isLoading = false;
        }
    });
}

// Render siswa list
function renderSiswaList(siswaData, reset) {
    console.log('Rendering siswa list:', siswaData.length, 'items');
    
    let html = '';
    
    siswaData.forEach(function(siswa) {
        const id = siswa.id_siswa;
        const nama = siswa.nama || 'No Name';
        const nis = siswa.nis || 'No NIS';
        const kelas = siswa.kelas || 'No Class';
        
        // Cek apakah siswa ini sudah dipilih sebelumnya
        const isSelected = selectedSiswaIds.includes(parseInt(id));
        
        html += `
            <div class="siswa-card ${isSelected ? 'selected' : ''}" data-id="${id}" style="border: 2px solid #ddd; border-radius: 8px; margin-bottom: 12px; cursor: pointer; padding: 15px; ${isSelected ? 'background-color: #d4edda; border-color: #28a745;' : ''}">
                <div style="display: flex; align-items: center;">
                    <div style="margin-right: 15px;">
                        <input type="checkbox" 
                               class="siswa-checkbox" 
                               value="${id}" 
                               style="width: 20px; height: 20px; cursor: pointer;"
                               ${isSelected ? 'checked' : ''}>
                    </div>
                    <div style="flex: 1;">
                        <div style="font-weight: bold; font-size: 16px; margin-bottom: 4px;">${nama}</div>
                        <div style="font-size: 13px; color: #666;">NIS: ${nis} | Kelas: ${kelas}</div>
                    </div>
                </div>
            </div>
        `;
    });
    
    if (reset || currentPage === 1) {
        $('#siswa-container').html(html);
    } else {
        $('#siswa-container').append(html);
    }
    
    // Attach events untuk siswa cards
    attachSiswaEvents();
    updateSelectedCount();
}

// Attach events untuk siswa
function attachSiswaEvents() {
    console.log('Attaching siswa events...');
    
    // Remove existing events
    $('#siswa-container').off('click', '.siswa-card');
    $('#siswa-container').off('change', '.siswa-checkbox');
    
    // Card click event
    $('#siswa-container').on('click', '.siswa-card', function(e) {
        // Prevent double trigger if checkbox clicked directly
        if (e.target.type === 'checkbox') return;
        
        const checkbox = $(this).find('.siswa-checkbox');
        const currentState = checkbox.prop('checked');
        
        // Toggle checkbox
        checkbox.prop('checked', !currentState);
        checkbox.trigger('change');
    });
    
    // Checkbox change event
    $('#siswa-container').on('change', '.siswa-checkbox', function() {
        const siswaId = parseInt($(this).val());
        const isChecked = $(this).prop('checked');
        const card = $(this).closest('.siswa-card');
        
        console.log('Checkbox changed:', siswaId, 'checked:', isChecked);
        
        if (isChecked) {
            // Add to selected list if not already there
            if (!selectedSiswaIds.includes(siswaId)) {
                selectedSiswaIds.push(siswaId);
            }
            card.addClass('selected').css({
                'background-color': '#d4edda',
                'border-color': '#28a745'
            });
        } else {
            // Remove from selected list
            selectedSiswaIds = selectedSiswaIds.filter(id => id !== siswaId);
            card.removeClass('selected').css({
                'background-color': '',
                'border-color': '#ddd'
            });
        }
        
        updateSelectedCount();
        console.log('Selected siswa IDs:', selectedSiswaIds);
    });
    
    console.log('Siswa events attached');
}

// Update selected count
function updateSelectedCount() {
    const count = selectedSiswaIds.length;
    
    if (count > 0) {
        $('#count-text').text(`${count} siswa dipilih`);
        $('#selected-count').show();
    } else {
        $('#selected-count').hide();
    }
}

// Update load more button
function updateLoadMoreButton() {
    const btn = $('#btn-load-more');
    if (hasMore && !isLoading) {
        btn.show().html('<i class="glyphicon glyphicon-plus"></i> Muat Lebih Banyak');
    } else if (isLoading) {
        btn.html('<i class="glyphicon glyphicon-refresh glyphicon-spin"></i> Memuat...');
    } else {
        btn.hide();
    }
}

// Load more function
function loadMoreSiswa() {
    if (!hasMore || isLoading) return;
    currentPage++;
    loadSiswa(false);
}

// Clear all selection
function clearAllSelection() {
    if (selectedSiswaIds.length === 0) {
        alert('Tidak ada siswa yang dipilih');
        return;
    }
    
    if (confirm(`Hapus ${selectedSiswaIds.length} siswa yang dipilih?`)) {
        selectedSiswaIds = [];
        $('.siswa-checkbox').prop('checked', false);
        $('.siswa-card').removeClass('selected').css({
            'background-color': '',
            'border-color': '#ddd'
        });
        updateSelectedCount();
    }
}

// Select all visible
function selectAllVisible() {
    $('.siswa-checkbox:visible').each(function() {
        const siswaId = parseInt($(this).val());
        const card = $(this).closest('.siswa-card');
        
        if (!selectedSiswaIds.includes(siswaId)) {
            selectedSiswaIds.push(siswaId);
        }
        
        $(this).prop('checked', true);
        card.addClass('selected').css({
            'background-color': '#d4edda',
            'border-color': '#28a745'
        });
    });
    
    updateSelectedCount();
}

// Form validation
function validateForm() {
    const errors = [];
    
    if (!$('#kegiatan').val().trim()) errors.push('Kegiatan harus diisi');
    if (!$('#tempat').val().trim()) errors.push('Tempat harus diisi');
    if (!$('#tanggal_mulai').val()) errors.push('Tanggal mulai harus diisi');
    if (!$('#tanggal_selesai').val()) errors.push('Tanggal selesai harus diisi');
    if (!$('#waktu_mulai').val()) errors.push('Waktu mulai harus diisi');
    if (!$('#waktu_selesai').val()) errors.push('Waktu selesai harus diisi');
    if (selectedSiswaIds.length === 0) errors.push('Pilih minimal 1 siswa');
    
    if (errors.length > 0) {
        alert('Error:\n' + errors.join('\n'));
        return false;
    }
    
    return true;
}

// Submit form
function submitForm() {
    // Add hidden inputs for selected siswa
    $('input[name="siswa_terpilih[]"]').not('.siswa-checkbox').remove();
    
    selectedSiswaIds.forEach(function(id) {
        $('<input>').attr({
            type: 'hidden',
            name: 'siswa_terpilih[]',
            value: id
        }).appendTo('#form-surat-izin');
    });
    
    const btn = $('#form-surat-izin button[type="submit"]');
    const originalText = btn.html();
    
    btn.prop('disabled', true).html('<i class="glyphicon glyphicon-refresh glyphicon-spin"></i> Menyimpan...');
    
    $.ajax({
        url: $('#form-surat-izin').attr('action'),
        type: 'POST',
        data: $('#form-surat-izin').serialize(),
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                toastr.success('Berhasil disimpan!');
                // Redirect atau reload sesuai kebutuhan
                
	            set_content('Surat_izin_siswa/get_data');
            } else {
                toastr.error('Error: ' + (response.message || 'Unknown error'));
                btn.prop('disabled', false).html(originalText);
            }
        },
        error: function(xhr, status, error) {
            toastr.error('Error: ' + error);
            btn.prop('disabled', false).html(originalText);
        }
    });
}

// MANUAL TRIGGERS - Panggil fungsi ini dari console atau controller

// Force init - panggil ini setelah halaman di-load via SPA
window.forceInitSuratIzin = function() {
    console.log('Force init called');
    setTimeout(function() {
        initSuratIzin();
    }, 100);
};

// Panggil otomatis jika halaman sudah ready
$(document).ready(function() {
    console.log('Document ready, checking for form...');
    setTimeout(function() {
        if ($('#form-surat-izin').length > 0) {
            console.log('Form found, initializing...');
            initSuratIzin();
        } else {
            console.log('Form not found');
        }
    }, 100);
});

// Debug function
window.debugSuratIzin = function() {
    console.log('=== DEBUG INFO ===');
    console.log('Form exists:', $('#form-surat-izin').length > 0);
    console.log('Container exists:', $('#siswa-container').length > 0);
    console.log('Search exists:', $('#search-siswa').length > 0);
    console.log('Selected IDs:', selectedSiswaIds);
    console.log('Is Loading:', isLoading);
    console.log('Current Page:', currentPage);
    console.log('Has More:', hasMore);
    console.log('==================');
};

// Test AJAX
window.testAjax = function() {
    console.log('Testing AJAX...');
    loadSiswa(true);
};

</script>