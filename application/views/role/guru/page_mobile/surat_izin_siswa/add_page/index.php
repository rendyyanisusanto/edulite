<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <i class="icon-plus"></i> Tambah Surat Izin Siswa
                    </h3>
                </div>
                <div class="panel-body">
                    <form id="form-surat-izin" action="<?php echo $data_get['param']['table'] . '/tambah'; ?>" method="POST">
                        <!-- Alert Info -->
                        <div class="alert alert-info">
                            <i class="icon-info"></i>
                            Lengkapi semua data dengan benar untuk membuat surat izin siswa.
                        </div>

                        <!-- Data Surat -->
                        <hr>
                        
                        <div class="form-group">
                            <label for="kegiatan">Kegiatan <span class="text-danger">*</span></label>
                            <textarea name="kegiatan" id="kegiatan" class="form-control" rows="3" required placeholder="Deskripsi kegiatan yang akan dilakukan..."></textarea>
                        </div>

                        <div class="form-group">
                            <label for="tempat">Tempat <span class="text-danger">*</span></label>
                            <input type="text" name="tempat" id="tempat" class="form-control" required placeholder="Lokasi kegiatan">
                        </div>

                        <!-- Hidden fields yang otomatis -->
                        <input type="hidden" name="idguru_fk" value="<?= $data_get['guru']['guru']['id_guru'] ?>">
                        <input type="hidden" name="status" value="DRAFT">
                        
                        <div class="form-group">
                            <label for="pendamping">Nama Pendamping</label>
                            <input type="text" name="pendamping" value="<?= $data_get['guru']['guru']['nama'] ?>" id="pendamping" class="form-control" readonly>
                        </div>

                        <hr>
                        
                        <!-- Tanggal dan Waktu -->
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="tanggal_mulai">Tanggal Mulai <span class="text-danger">*</span></label>
                                    <input type="date" name="tanggal_mulai" id="tanggal_mulai" class="form-control" value="<?= date('Y-m-d') ?>" required>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="tanggal_selesai">Tanggal Selesai <span class="text-danger">*</span></label>
                                    <input type="date" name="tanggal_selesai" id="tanggal_selesai" class="form-control" value="<?= date('Y-m-d') ?>" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="waktu_mulai">Waktu Mulai <span class="text-danger">*</span></label>
                                    <input type="time" name="waktu_mulai" id="waktu_mulai" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <div class="form-group">
                                    <label for="waktu_selesai">Waktu Selesai <span class="text-danger">*</span></label>
                                    <input type="time" name="waktu_selesai" id="waktu_selesai" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <!-- Pilihan Siswa -->
                        <h4><i class="icon-users"></i> Pilih Siswa</h4>
                        <hr>
                        
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" id="search-siswa" class="form-control" placeholder="Cari nama siswa atau kelas...">
                                <span class="input-group-addon">
                                    <i class="icon-search"></i>
                                </span>
                            </div>
                        </div>

                        <div id="selected-count" class="label label-primary" style="display: none; margin-bottom: 10px; font-size: 12px;">
                            <i class="icon-users"></i> <span id="count-text">0 siswa dipilih</span>
                            <button type="button" class="btn btn-xs btn-default" onclick="clearAllSelection()" style="margin-left: 10px; padding: 2px 8px;">
                                <i class="icon-x"></i> Clear All
                            </button>
                        </div>

                        <!-- <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-12">
                                <button type="button" class="btn btn-sm btn-info" onclick="selectAllVisible()" style="margin-right: 10px;">
                                    <i class="icon-check"></i> Pilih Semua (Tampilan)
                                </button>
                                <small class="text-muted">
                                    <i class="icon-info"></i> Siswa yang dipilih akan tetap tersimpan meskipun Anda mencari yang lain
                                </small>
                            </div>
                        </div> -->

                        <div id="siswa-container" class="well" style="max-height: 250px; overflow-y: auto; margin-top: 10px;">
                            <div class="text-center">
                                <i class="icon-spinner2 spinner"></i> Memuat data siswa...
                            </div>
                        </div>

                        <div class="text-center" style="margin-top: 15px;">
                            <button type="button" class="btn btn-default btn-sm" id="btn-load-more" onclick="loadMoreSiswa()" style="display: none;">
                                <i class="icon-plus"></i> Muat Lebih Banyak
                            </button>
                        </div>

                        <!-- Action Buttons -->
                        <hr>
                        <div class="row">
                            <div class="col-xs-12 text-center">
                                <button type="button" class="btn btn-default btn-lg" onclick="window.history.back()">
                                    <i class="icon-arrow-left"></i> Kembali
                                </button>
                                <button type="submit" class="btn btn-primary btn-lg" style="margin-left: 10px;">
                                    <i class="icon-floppy-disk"></i> Simpan
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Custom CSS untuk mobile Bootstrap 3 -->
<style>
/* Simple mobile-friendly styles */
.siswa-card {
    background: #fff;
    border: 2px solid #ddd;
    border-radius: 8px;
    margin-bottom: 12px;
    cursor: pointer;
    transition: all 0.2s ease;
    min-height: 80px;
    position: relative;
}

.siswa-card:hover {
    border-color: #007bff;
    background-color: #f8f9fa;
}

.siswa-card.selected {
    border-color: #28a745;
    background-color: #d4edda;
}

.siswa-content {
    display: flex;
    align-items: center;
    padding: 15px;
    min-height: 80px;
}

.check-area {
    flex-shrink: 0;
    margin-right: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.siswa-checkbox {
    width: 20px;
    height: 20px;
    cursor: pointer;
    margin: 0;
}

.siswa-details {
    flex: 1;
    min-width: 0;
}

.siswa-name {
    font-weight: bold;
    font-size: 16px;
    color: #333;
    margin-bottom: 4px;
    word-wrap: break-word;
}

.siswa-meta {
    font-size: 13px;
    color: #666;
    word-wrap: break-word;
}

/* Mobile optimizations */
@media (max-width: 768px) {
    .panel-body {
        padding: 15px;
    }
    
    .form-control {
        font-size: 16px; /* Prevent iOS zoom */
        padding: 12px;
        border-radius: 6px;
    }
    
    .btn {
        padding: 12px 20px;
        font-size: 15px;
        border-radius: 6px;
        min-height: 44px;
    }
    
    .btn-lg {
        padding: 15px 25px;
        font-size: 16px;
        min-height: 50px;
    }
    
    #siswa-container {
        max-height: 250px;
        overflow-y: auto;
        padding: 10px;
    }
    
    .siswa-card {
        min-height: 88px; /* iOS touch target */
        margin-bottom: 15px;
    }
    
    .siswa-content {
        padding: 18px 15px;
        min-height: 88px;
    }
    
    .siswa-checkbox {
        width: 22px;
        height: 22px;
        transform: scale(1.2);
    }
    
    .siswa-name {
        font-size: 17px;
        margin-bottom: 6px;
    }
    
    .siswa-meta {
        font-size: 14px;
    }
    
    .check-area {
        margin-right: 18px;
    }
}

@media (max-width: 480px) {
    .siswa-content {
        padding: 20px 15px;
    }
    
    .siswa-checkbox {
        width: 24px;
        height: 24px;
        transform: scale(1.3);
    }
    
    .siswa-name {
        font-size: 16px;
    }
}

/* Selected count */
#selected-count {
    display: inline-block;
    padding: 10px 15px;
    margin-bottom: 15px;
    font-size: 14px;
    border-radius: 6px;
}

/* Spinner */
.spinner {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* Prevent text selection */
.siswa-card {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Button improvements */
.btn {
    margin: 5px;
}

.text-center .btn {
    margin: 8px 4px;
}

/* Form improvements */
.form-group label {
    font-weight: bold;
    margin-bottom: 8px;
}

.alert {
    border-radius: 6px;
    margin-bottom: 15px;
}

/* Container improvements */
.well {
    border-radius: 6px;
    border: 1px solid #ddd;
}

/* Responsive text */
@media (max-width: 768px) {
    .panel-title {
        font-size: 16px;
        text-align: center;
    }
    
    h4 {
        font-size: 17px;
        margin-top: 25px;
        margin-bottom: 15px;
    }
}
</style>