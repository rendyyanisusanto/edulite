<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" style="margin:0;">Santri Tidak Masuk Berturut-turut</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="tanggal_mulai" class="control-label">Tanggal Mulai</label>
                            <input type="date" id="tanggal_mulai" class="form-control" value="<?= date('Y-m-01'); ?>">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label foLaporan ini menampilkan daftar santri yang tidak memiliki status “MASUK” pada tanggal tersebut (belum tap RFID sama sekali).r="tanggal_selesai" class="control-label">Tanggal Selesai</label>
                            <input type="date" id="tanggal_selesai" class="form-control" value="<?= date('Y-m-d'); ?>">
                        </div>
                    </div>
                    <div class="col-md-3">
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
                        <div class="form-group">
                            <label for="min_berturut" class="control-label">Min. Hari</label>
                            <input type="number" id="min_berturut" class="form-control" value="3" min="1">
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group" style="margin-top:25px;">
                            <button type="button" class="btn btn-primary btn-block" onclick="get_tidak_masuk_berturut()">Tampilkan</button>
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
                                <th class="text-center" style="width:120px;">Streak (hari)</th>
                                <th style="width:220px;">Periode Streak</th>
                            </tr>
                        </thead>
                        <tbody class="content-berturut">
                            <tr><td colspan="6" class="text-center">Silakan isi filter, lalu klik Tampilkan</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
