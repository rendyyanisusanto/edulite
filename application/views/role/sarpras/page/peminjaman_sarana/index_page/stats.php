<ul class="icons-list">
	<li><a href="Sarana/get_data" class="app-item"><span class="label  label-default">Sarana : <?= $data_get['sarana'] ?></span></a></li>
	<li><a href="Prasarana/get_data" class="app-item"><span class="label  label-default">Prasarana : <?= $data_get['prasarana'] ?></span></a></li>
	<li><a href="pengembalian_sarana/get_data" class="app-item"><span class="label  label-default">Pengembalian Sarana : <?= $data_get['pengembalian_sarana'] ?></span></a></li>
</ul>

<ul class="icons-list">
	<li>|</li>
</ul>

<ul class="icons-list">
	<li><span class="label label-primary">Total Data : <?= $data_get['total'] ?></span></li>
	<li><span class="label label-success">Dikembalikan : <?= $data_get['sudah_kembali'] ?></span></li>
	<li><span class="label label-danger">Belum Dikembalikan : <?= $data_get['belum_kembali'] ?></span></li>
</ul>


