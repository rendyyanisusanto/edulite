<table class="table table-bordered table-hover">
    <thead class="thead-dark">
        <tr style="text-align: center">
            <th scope="col">#</th>
            <th scope="col">Nama</th>
            <th scope="col">Kelas</th>
            <th scope="col">Barang</th>
            <th scope="col">Loker</th>
            <th scope="col">Pinjam</th>
            <th scope="col">Kembali</th>
        </tr>
    </thead>
    <tbody>
        <?php $no = 0; ?>
        <?php foreach ($mutasi_penitipan as $value): ?>
        <tr>
            <th scope="row"><?= ++$no; ?></th>
            <td><?= ucwords(strtolower($value['penitip']['nama'])) ?></td>
            <td><?= ucwords(strtolower($value['kelas']['kelas'])) ?></td>
            <td><?= ucwords(strtolower($value['detail_penitipan']['nama_barang'])) ?></td>
            <td><?= ucwords(strtolower($value['detail_penitipan']['lokasi'])) ?></td>
            <td style="text-align: center"><?php echo (!empty($value['mutasi_penitipan']['pinjam'])) ? "<b class='text-success'>".$value['mutasi_penitipan']['pinjam']."</b>":"<b class='text-danger'>Absent<b>" ; ?></td>
            <td style="text-align: center"><?php echo (!empty($value['mutasi_penitipan']['kembali'])) ? "<b class='text-success'>".$value['mutasi_penitipan']['kembali']."</b>":"<b class='text-danger'>Belum Kembali<b>" ; ?></td>
        </tr>
        <?php endforeach ?>
        
    </tbody>
</table>