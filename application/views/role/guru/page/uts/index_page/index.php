<div class="row">
  <div class="col-md-12">
    <div class="panel panel-body">
      <table style ="border: 1px solid black;" class="table table-bordered">
        <thead>
          <tr>
            <th width="2%">No</th>
            <th width="20%">Kelas</th>
            <th>Mata Pelajaran</th>
            <th width="10%">Action</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $no = 0;
          foreach ($data_get['dt_guru']['mapel'] as $key => $value): ?>
            <tr>
              <td><?php echo ++$no ?></td>
              <td><?php echo $value['kelas'] ?></td>
              <td><?php echo $value['mata_pelajaran'] ?></td>
              <td><a href="<?php echo base_url('guru/uts/input_nilai/'.$value['id_kelas'].'/'.$value['id_mata_pelajaran']) ?>" class="app-item btn btn-success"><i class="icon-pencil"></i> INPUT NILAI</a></td>
            </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>
  </div>
</div>