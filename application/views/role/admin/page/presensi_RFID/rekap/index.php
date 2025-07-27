<!-- ini panel pencarian -->
<div class="row">

    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">Filter Presensi</div>
            <div class="panel-body">
                <div class="form-inline">
                    <label for="tanggal_mulai">Tanggal Mulai:</label>
                    <input type="date" class="form-control" id="tanggal_mulai" name="tanggal_mulai">
                    
                    <label for="tanggal_selesai">Tanggal Selesai:</label>
                    <input type="date" class="form-control" id="tanggal_selesai" name="tanggal_selesai">

                    <label for="kelas">Kelas:</label>
                    <select class="form-control" id="kelas" name="kelas">
                        <option value="">-- Pilih Kelas --</option>
                        <!-- Tambahkan opsi kelas dari PHP (opsional) -->
                        <?php foreach ($data_get['kelas'] as $kelas): ?>
                            <option value="<?= $kelas['id_kelas'] ?>"><?= $kelas['kelas'] ?></option>
                        <?php endforeach; ?>
                    </select>

                    <button type="button" class="btn btn-primary" onclick="get_presensi()">Tampilkan</button>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- ini hasil pencarian -->
<div class="row">
    <div class="content-presensi"></div>
</div>