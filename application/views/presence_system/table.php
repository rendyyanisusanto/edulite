<div class="col-md-12">
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>Nama</th>
                    <th>Masuk</th>
                    <th>Ijin Keluar</th>
                    <th>Ijin Kembali</th>
                    <th>Pulang</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($presence as $key => $value): ?>
                    <tr>
                        <td class="fw-bold"><?php echo $value['nama_siswa'] ?></td>
                        <td class="text-center  fw-semibold">
                            <?php echo $value['masuk'] ?: '-' ?>
                        </td>
                        <td class="text-center  fw-semibold">
                            <?php echo $value['ijin_keluar'] ?: '-' ?>
                        </td>
                        <td class="text-center  fw-semibold">
                            <?php echo $value['ijin_kembali'] ?: '-' ?>
                        </td>
                        <td class="text-center  fw-semibold">
                            <?php echo $value['pulang'] ?: '-' ?>
                        </td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    </div>
</div>
