<ul class="icons-list">
	<li><a href="Sarana/get_data" class="app-item"><span class="label  label-default">Sarana : <?= $data_get['sarana'] ?></span></a></li>
	<li><a href="Prasarana/get_data" class="app-item"><span class="label  label-default">Prasarana : <?= $data_get['prasarana'] ?></span></a></li>
	<li><a href="peminjaman_sarana/get_data" class="app-item"><span class="label  label-default">Peminjaman Sarana : <?= $data_get['peminjaman_sarana'] ?></span></a></li>
</ul>

<ul class="icons-list">
	<li>|</li>
</ul>

<ul class="icons-list">
	<li><span class="label label-primary">Total Data : <?= $data_get['total'] ?></span></li>
	<li><span class="label label-success">Tidak Lengkap : <?= $data_get['tidak_lengkap'] ?></span></li>
	<li><span class="label label-danger">Lengkap : <?= $data_get['lengkap'] ?></span></li>
</ul>


