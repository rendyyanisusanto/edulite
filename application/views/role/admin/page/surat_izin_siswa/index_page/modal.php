
<!-- Custom CSS for enhanced styling -->
<style>
.student-list-container {
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    padding: 15px;
    background: #fafafa;
}

.selected-students-container {
    max-height: 150px;
    overflow-y: auto;
    padding: 10px;
    background: #f8f9fa;
    border-radius: 6px;
    border: 1px solid #e9ecef;
}

.selected-student-tag {
    display: inline-block;
    background: linear-gradient(135deg, #4caf50, #45a049);
    color: white;
    padding: 6px 12px;
    margin: 3px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 500;
    position: relative;
    box-shadow: 0 2px 4px rgba(76, 175, 80, 0.3);
    transition: all 0.2s ease;
}

.selected-student-tag:hover {
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(76, 175, 80, 0.4);
}

.selected-student-tag .remove-student {
    margin-left: 8px;
    cursor: pointer;
    font-weight: bold;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    width: 18px;
    height: 18px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    transition: all 0.2s ease;
}

.selected-student-tag .remove-student:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: scale(1.1);
}

.student-item {
    padding: 12px 15px;
    border: 2px solid #e9e9e9;
    border-radius: 8px;
    margin-bottom: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    background: white;
    position: relative;
    overflow: hidden;
}

.student-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
    transition: left 0.5s ease;
}

.student-item:hover {
    background-color: #f8f9fa;
    border-color: #007bff;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.15);
}

.student-item:hover::before {
    left: 100%;
}

.student-item.selected {
    background: linear-gradient(135deg, #e7f3ff, #cce7ff);
    border-color: #007bff;
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.25);
    transform: translateY(-1px);
}

.student-item.selected::after {
    content: '✓';
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #007bff;
    font-weight: bold;
    font-size: 18px;
}

.student-name {
    font-weight: 600;
    color: #333;
    font-size: 14px;
    margin-bottom: 4px;
}

.student-class {
    color: #666;
    font-size: 12px;
    display: flex;
    align-items: center;
}

.student-class::before {
    margin-right: 5px;
}

.checkbox-success input[type="checkbox"]:checked + label::before {
    background-color: #4caf50;
    border-color: #4caf50;
}

.modal-header.bg-primary {
    background: linear-gradient(135deg, #007bff, #0056b3) !important;
}

.modal-header.bg-warning {
    background: linear-gradient(135deg, #ffc107, #e0a800) !important;
}

.panel-heading {
    background: linear-gradient(135deg, #f8f9fa, #e9ecef);
    border-bottom: 2px solid #007bff;
}

.btn-labeled {
    position: relative;
    padding-left: 44px;
    margin-right: 8px;
    margin-bottom: 8px;
}

.btn-labeled b {
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 32px;
    background: rgba(0,0,0,0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 4px 0 0 4px;
}

.search-box-container {
    position: relative;
    margin-bottom: 15px;
}

.search-box-container .form-control {
    padding-left: 40px;
    border-radius: 25px;
    border: 2px solid #e9ecef;
    transition: all 0.3s ease;
}

.search-box-container .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.search-box-container .form-control-feedback {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    z-index: 3;
}

.empty-state {
    text-align: center;
    padding: 40px 20px;
    color: #6c757d;
}

.empty-state i {
    font-size: 3em;
    margin-bottom: 15px;
    opacity: 0.5;
}

.loading-state {
    text-align: center;
    padding: 30px 20px;
    color: #6c757d;
}

.spinner {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* .table-responsive {
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    overflow: hidden;
} */

.table-striped > tbody > tr:nth-of-type(odd) {
    background-color: rgba(0, 123, 255, 0.05);
}

.table-hover > tbody > tr:hover {
    background-color: rgba(0, 123, 255, 0.1);
    transform: scale(1.002);
    transition: all 0.2s ease;
}

.panel-flat {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.filter-section {
    /* background: linear-gradient(135deg, #f8f9fa, #e9ecef); */
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
}

.selected-count-badge {
    background: #007bff;
    color: white;
    padding: 2px 8px;
    border-radius: 12px;
    font-size: 11px;
    font-weight: bold;
    margin-left: 5px;
}

.section-divider {
    border: none;
    height: 2px;
    background: linear-gradient(to right, transparent, #007bff, transparent);
    margin: 20px 0;
}
</style>

<!-- Modal Tambah -->
<div id="modal-tambah" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                <h5 class="modal-title text-white">
                    Tambah Surat Izin Siswa
                </h5>
            </div>
            <form id="form-tambah" action="surat_izin_siswa/tambah" method="post">
                <div class="modal-body">
                    <!-- Form Fields -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Kode Surat 
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
	              				    <input type="text" class="form-control kode" required name="kode" placeholder="Input here......">
                                    <span class="input-group-btn">
								        <button class="btn btn-success" 
                                                data-toggle="tooltip" 
                                                onclick="generate_kode_surat();" 
                                                data-placement="top" 
                                                title="Generate Kode Otomatis" 
                                                type="button">
                                            <i class="icon-spinner"></i> Generate
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Kegiatan 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="kegiatan" class="form-control" placeholder="Masukkan nama kegiatan" required>
                            </div>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                                <div class="form-group">
                                    <label class="text-semibold">
                                        Tujuan 
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" name="tujuan" class="form-control" required>
                                </div>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tanggal Mulai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" name="tanggal_mulai" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tanggal Selesai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" name="tanggal_selesai" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Waktu Mulai 1
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="time"  lang="id" step="60" name="waktu_mulai" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Waktu Selesai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="time"  lang="id" step="60" name="waktu_selesai" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tempat 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="tempat" class="form-control" placeholder="Masukkan lokasi kegiatan" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Guru Pendamping 
                                    <span class="text-danger">*</span>
                                </label>
                                <select name="idguru_fk" id="select-guru" class="form-control" required onchange="updatePendamping(this)">
                                    <option value="">Pilih Guru Pendamping</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Pendamping 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="pendamping" id="input-pendamping" class="form-control" placeholder="Otomatis terisi dari guru" readonly required>
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Status 
                                    <span class="text-danger">*</span>
                                </label>
                                <select name="status" class="form-control" id="">
									<option value="DRAFT">DRAFT</option>
									<option value="DITERIMA">DITERIMA</option>
									<option value="DITOLAK">DITOLAK</option>
								</select>
                            </div>
                        </div>
                    </div>
                    
                    <hr class="section-divider">
                    
                    <!-- Student Selection Section -->
                    <div class="form-group">
                        <label class="text-semibold">
                            Pilih Siswa 
                            <span class="text-danger">*</span>
                        </label>
                        <div class="panel panel-flat">
                            <div class="panel-body">
                                <!-- Search Box -->
                                <div class="search-box-container">
                                    <input type="text" id="search-siswa" class="form-control" placeholder=" Cari nama siswa atau kelas...">
                                    <div class="form-control-feedback">
                                        <i class="icon-search4 text-muted"></i>
                                    </div>
                                </div>
                                
                                <!-- Selected Students -->
                                <div id="selected-students" class="mb-15" style="display: none;">
                                    <label class="text-semibold text-success mb-10">
                                        <i class="icon-users2 mr-1"></i>Siswa Terpilih
                                        <span class="selected-count-badge" id="selected-count">0</span>
                                    </label>
                                    <div id="selected-list" class="selected-students-container"></div>
                                </div>
                                
                                <!-- Student List -->
                                <div id="daftar-siswa" class="student-list-container">
                                    <div class="empty-state">
                                        <i class="icon-search4"></i>
                                        <div>Mulai ketik untuk mencari siswa...</div>
                                        <small class="text-muted">Minimal 2 karakter untuk pencarian</small>
                                    </div>
                                </div>
                                
                                <!-- Load More Button -->
                                <div id="load-more-container" class="text-center mt-15" style="display: none;">
                                    <button type="button" id="load-more-btn" class="btn btn-link btn-sm">
                                        <i class="icon-arrow-down8 mr-1"></i>Muat lebih banyak
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-link" data-dismiss="modal">
                        <i class="icon-cross2 mr-1"></i>Batal
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="icon-floppy-disk mr-1"></i>Simpan Data
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Edit -->
<div id="modal-edit" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                <h5 class="modal-title text-white">
                    Edit Surat Izin Siswa
                </h5>
            </div>
            <form id="form-edit" action="surat_izin_siswa/edit" method="post">
                <input type="hidden" name="id_surat_izin_siswa" id="edit_id">
                <div class="modal-body">
                    <!-- Form Fields -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                   Kode Surat 
                                    <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <input type="text" name="kode" id="edit_kode" class="form-control kode" required>
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" 
                                                data-toggle="tooltip" 
                                                onclick="generate_kode_surat();" 
                                                data-placement="top" 
                                                title="Generate Kode Otomatis" 
                                                type="button">
                                            <i class="icon-spinner"></i> Generate
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Empty column for spacing -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Kegiatan 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="kegiatan" id="edit_kegiatan" class="form-control" required>
                            </div>
                        </div>                                      
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tujuan 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="tujuan" id="edit_tujuan" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tanggal Mulai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" name="tanggal_mulai" id="edit_tanggal_mulai" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tanggal Selesai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="date" name="tanggal_selesai" id="edit_tanggal_selesai" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Waktu Mulai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="time" name="waktu_mulai" id="edit_waktu_mulai" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Waktu Selesai 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="time" name="waktu_selesai" id="edit_waktu_selesai" class="form-control" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Tempat 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="tempat" id="edit_tempat" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Guru Pendamping 
                                    <span class="text-danger">*</span>
                                </label>
                                <select name="idguru_fk" id="edit-select-guru" class="form-control" required onchange="updatePendampingEdit(this)">
                                    <option value="">Pilih Guru Pendamping</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Pendamping 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" name="pendamping" id="edit_pendamping" class="form-control" readonly required>
                            </div>
                        </div>
						<div class="col-md-6">
                            <div class="form-group">
                                <label class="text-semibold">
                                    Status 
                                    <span class="text-danger">*</span>
                                </label>
                                <select name="status" class="form-control" id="edit_status">
									<option value="DRAFT">DRAFT</option>
									<option value="DITERIMA">DITERIMA</option>
									<option value="DITOLAK">DITOLAK</option>
								</select>
                            </div>
                        </div>
                    </div>
                    
                    <hr class="section-divider">
                    
                    <!-- Student Selection Section for Edit -->
                    <div class="form-group">
                        <label class="text-semibold">
                            Pilih Siswa 
                            <span class="text-danger">*</span>
                        </label>
                        <div class="panel panel-flat">
                            <div class="panel-body">
                                <!-- Search Box -->
                                <div class="search-box-container">
                                    <input type="text" id="search-siswa-edit" class="form-control" placeholder=" Cari nama siswa atau kelas...">
                                    <div class="form-control-feedback">
                                        <i class="icon-search4 text-muted"></i>
                                    </div>
                                </div>
                                
                                <!-- Selected Students -->
                                <div id="selected-students-edit" class="mb-15" style="display: none;">
                                    <label class="text-semibold text-success mb-10">
                                        <i class="icon-users2 mr-1"></i>Siswa Terpilih
                                        <span class="selected-count-badge" id="selected-count-edit">0</span>
                                    </label>
                                    <div id="selected-list-edit" class="selected-students-container"></div>
                                </div>
                                
                                <!-- Student List -->
                                <div id="daftar-siswa-edit" class="student-list-container">
                                    <div class="empty-state">
                                        <i class="icon-search4"></i>
                                        <div>Mulai ketik untuk mencari siswa...</div>
                                        <small class="text-muted">Minimal 2 karakter untuk pencarian</small>
                                    </div>
                                </div>
                                
                                <!-- Load More Button -->
                                <div id="load-more-container-edit" class="text-center mt-15" style="display: none;">
                                    <button type="button" id="load-more-btn-edit" class="btn btn-link btn-sm">
                                        <i class="icon-arrow-down8 mr-1"></i>Muat lebih banyak
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-link" data-dismiss="modal">
                        <i class="icon-cross2 mr-1"></i>Batal
                    </button>
                    <button type="submit" class="btn btn-warning">
                        <i class="icon-checkmark3 mr-1"></i>Update Data
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>