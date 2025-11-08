<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" style="margin:0;">Laporan Tidak Masuk Harian (RFID)</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="tanggal" class="control-label">Tanggal</label>
                            <input type="date" id="tanggal" class="form-control" value="<?= date('Y-m-d'); ?>">
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="kelas" class="control-label">Kelas</label>
                            <select id="kelas" class="form-control">
                                <option value="">-- Pilih Kelas --</option>
                                <?php if (!empty($data_get['kelas'])) { foreach ($data_get['kelas'] as $k) { ?>
                                    <option value="<?= $k['id_kelas']; ?>"><?= $k['kelas']; ?></option>
                                <?php } } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group" style="margin-top:25px;">
                            <button type="button" class="btn btn-primary btn-block" onclick="get_tidak_masuk_harian()">Tampilkan</button>
                        </div>
                    </div>
                </div>

                <div class="table-responsive" style="margin-top:15px;">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th class="text-center" style="width:60px;">No</th>
                                <th>Nama Santri</th>
                                <th style="width:120px;">NIS</th>
                                <th style="width:160px;">Kelas</th>
                                <th style="width:130px;">Tanggal</th>
                            </tr>
                        </thead>
                        <tbody class="content-tidak-masuk">
                            <tr><td colspan="5" class="text-center">Silakan pilih tanggal dan kelas, lalu klik Tampilkan</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
