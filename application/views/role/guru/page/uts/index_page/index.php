<div class="row">
  <div class="col-md-12">
    <div class="panel panel-body">
      <table class="table table-bordered table-framed" style="width: 50%;" >
        <tr>
          <td class="bg-slate">Nama Guru</td>
          <td class="bg-slate-300"><?php echo $data_get['guru']['nama'] ?></td>
        </tr>
      </table>
      <hr>
      <table style ="border: 1px solid black;" class="table table-bordered">
        <thead>
          <tr>
            <th width="2%">No</th>
            <th width="20%">Kelas</th>
            <th>Mata Pelajaran</th>
            <th>Tahun Ajaran</th>
            <th width="5%">NT</th>
            <th width="5%">NK</th>
            <th width="5%">NTS</th>
            <th width="5%">NAS</th>
            <th>Menu</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $no = 0;
          foreach ($data_get['view_mapel'] as $key => $value): ?>
            <tr>
              <td><?php echo ++$no ?></td>
              <td><?php echo $value['mapel']['kelas'] ?></td>
              <td><?php echo $value['mapel']['mata_pelajaran'] ?></td>
              <td><?php echo $value['mapel']['tahun_ajaran'].' '.$value['mapel']['semester'] ?></td>
              <td><a href="nilai/input_nilai_harian/<?php echo $value['mapel']['id_kelas'].'/'.$value['mapel']['id_mata_pelajaran'].'/'.$value['mapel']['id_tahun_ajaran']; ?>" class="app-item btn btn-<?php echo ($value['input_nilai_pengetahuan'] == 0) ? "danger" :"success"; ?> btn-sm"><i class="icon-<?php echo ($value['input_nilai_pengetahuan'] == 0) ? "pencil" :"checkmark4"; ?>"></i></a></td>
              <td><a href="nilai/input_nilai_keterampilan/<?php echo $value['mapel']['id_kelas'].'/'.$value['mapel']['id_mata_pelajaran'].'/'.$value['mapel']['id_tahun_ajaran']; ?>"  class="app-item btn btn-<?php echo ($value['input_nilai_keterampilan'] == 0) ? "danger" :"success"; ?> btn-sm"><i class="icon-<?php echo ($value['input_nilai_keterampilan'] == 0) ? "pencil" :"checkmark4"; ?>"></i></a></td>
              <td><a href="uts/input_nilai_pts/<?php echo $value['mapel']['id_kelas'].'/'.$value['mapel']['id_mata_pelajaran'].'/'.$value['mapel']['id_tahun_ajaran']; ?>" class="app-item btn btn-<?php echo ($value['input_nilai_pts'] == 0) ? "danger" :"success"; ?> btn-sm"><i class="icon-<?php echo ($value['input_nilai_pts'] == 0) ? "pencil" :"checkmark4"; ?>"></i></a></td>
              <td><a href="nilai/input_nilai_pas/<?php echo $value['mapel']['id_kelas'].'/'.$value['mapel']['id_mata_pelajaran'].'/'.$value['mapel']['id_tahun_ajaran']; ?>" class="app-item btn btn-<?php echo ($value['input_nilai_pas'] == 0) ? "danger" :"success"; ?> btn-sm"><i class="icon-<?php echo ($value['input_nilai_pas'] == 0) ? "pencil" :"checkmark4"; ?>"></i></a></td>
              <td><?php echo ($value['cek_kd'] > 0 ) ? '<a href="nilai/import_all/'.$value['mapel']['id_kelas'].'/'.$value['mapel']['id_mata_pelajaran'].'/'.$value['mapel']['id_tahun_ajaran'].'" class=" app-item ">Import Excel</a> <br> <a href="nilai/cek_nilai/'.$value['mapel']['id_kelas'].'/'.$value['mapel']['id_mata_pelajaran'].'/'.$value['mapel']['id_tahun_ajaran'].'" class=" app-item ">Lihat Nilai</a>' :'<a href="Kd/get_data" class="app-item"><p class="text-danger">KD BELUM LENGKAP</p></a>'; ?></td>
            </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>
  </div>
</div>