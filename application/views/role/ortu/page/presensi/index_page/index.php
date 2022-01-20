<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-body">
            <center><b>Histori Presensi Harian Siswa</b></center>
            <br>

            <div class="panel panel-body">
                Status presensi <?php echo $data_get['siswa']['nama'] ?> hari ini, 
                <?php  echo ($data_get['presensi_siswa']['presensi'] == "M") ? "<b class='text-success'>Masuk</b>" : "<b class='text-danger'>Tidak Masuk</b>";?>
            </div>
        </div>
    </div>
</div>

<a class="btn btn-danger btn-block app-item" href="Dashboard/get_data">Kembali</a>