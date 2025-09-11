<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/forms/selects/select2.min.js"></script>
<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/notifications/sweet_alert.min.js"></script>
<style>
.panel-heading {
    padding: 15px 20px;
    border-bottom: 1px solid #ddd;
}
.panel {
    box-shadow: 0 1px 3px rgba(0,0,0,.1);
    margin-bottom: 20px;
    border-radius: 3px;
}
.panel-title {
    display: flex;
    align-items: center;
}
.table > thead > tr > th {
    background-color: #f5f5f5;
    border-bottom: 2px solid #ddd;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 12px;
}
.form-control {
    border-radius: 3px;
    box-shadow: none;
    border-color: #ddd;
}
.form-control:focus {
    border-color: #66afe9;
    box-shadow: 0 1px 3px rgba(102,175,233,.6);
}
.table-hover > tbody > tr:hover {
    background-color: #f9f9f9;
}
.loading {
    position: relative;
}
.loading:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255,255,255,0.7);
    z-index: 1;
}
.loading:before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -15px 0 0 -15px;
    width: 30px;
    height: 30px;
    border: 3px solid #f3f3f3;
    border-top: 3px solid #3498db;
    border-radius: 50%;
    animation: spin 1s linear infinite;
    z-index: 2;
}
@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
.mb-20 {
    margin-bottom: 20px;
}
.btn-group {
    margin-bottom: 15px;
}
.select2-container {
    width: 100% !important;
}
.input-group-addon {
    min-width: 40px;
    background-color: #f5f5f5;
}
/* Badge styles */
.badge-warning {
    background-color: #ff9800;
}
.badge-success {
    background-color: #4caf50;
}
.form-group {
    margin-bottom: 20px;
}

.panel-title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 16px;
}
.input-group-addon {
    min-width: 40px;
    text-align: center;
}
</style>

<div class="row">
    <form class="form-horizontal" action="pelanggaran_siswa/simpan_poin" id="app-submit" method="POST">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title"><i class="icon-file-plus position-left"></i> Form Tambah Pelanggaran</h5>
                </div>
                <div class="panel-body">
                    <fieldset>
                        <input type="hidden" name="id" class="id">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Kode</label>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-barcode2"></i></span>
                                    <input type="text" class="form-control kode_pelanggaran" name="kode_pelanggaran" required placeholder="Masukkan kode pelanggaran">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Nama</label>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-file-text2"></i></span>
                                    <input type="text" class="form-control nama_pelanggaran" name="nama_pelanggaran" required placeholder="Masukkan nama pelanggaran">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Poin</label>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-calculator"></i></span>
                                    <input type="number" class="form-control poin" name="poin" required placeholder="Masukkan poin pelanggaran">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Kategori</label>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-type"></i></span>
                                    <select class="form-control kategori_pelanggaran" name="kategori_pelanggaran" required>
                                        <option value="">Pilih Kategori</option>
                                        <option value="PELANGGARAN">Pelanggaran</option>
                                        <option value="KEBAIKAN">Kebaikan</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Jenis</label>
                            <div class="col-lg-9">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-list3"></i></span>
                                    <select class="form-control idjenispelanggaran_fk" name="idjenispelanggaran_fk" required>
                                        <option value="">Pilih Jenis Pelanggaran</option>
                                    <?php foreach ($data_get['jenis_pelanggaran'] as $key => $value): ?>
                                        <option value="<?php echo $value['id_jenis_pelanggaran'] ?>">
                                            <?php echo $value['jenis_pelanggaran'] ?>
                                        </option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group text-right">
                            <button class="btn btn-submit btn-success btn-labeled" type="submit">
                                <b><i class="icon-floppy-disk"></i></b> Simpan
                            </button>
                            <button class="btn btn-batal btn-danger btn-labeled" type="button" style="display: none;">
                                <b><i class="icon-cross2"></i></b> Batal
                            </button>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </form>
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h5 class="panel-title"><i class="icon-list-unordered position-left"></i> Daftar Pelanggaran</h5>
            </div>
            <div class="panel-body">
                
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover" width="100%" id="tabel-data">
                        <thead>
                            <tr>
                                <th class="text-center" style="width: 100px">Kode</th>
                                <th>Nama</th>
                                <th>Pelanggaran</th>
                                <th class="text-center" style="width: 100px">Poin</th>
                                <th class="text-center" style="width: 60px"><i class="icon-pencil7"></i></th>
                                <th class="text-center" style="width: 60px"><i class="icon-trash"></i></th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>