<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title" style="margin:0;">Laporan Bulanan Presensi (RFID)</h4>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="bulan" class="control-label">Bulan</label>
                            <input type="month" id="bulan" class="form-control" value="<?= date('Y-m'); ?>">
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
                            <button type="button" class="btn btn-primary btn-block" onclick="get_laporan_bulanan()">Tampilkan</button>
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
                                <th class="text-center" style="width:110px;">Total Hadir</th>
                                <th class="text-center" style="width:100px;">Total Izin</th>
                                <th class="text-center" style="width:140px;">Total Tidak Hadir</th>
                            </tr>
                        </thead>
                        <tbody class="content-laporan-bulanan">
                            <tr><td colspan="6" class="text-center">Silakan pilih bulan dan kelas, lalu klik Tampilkan</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
