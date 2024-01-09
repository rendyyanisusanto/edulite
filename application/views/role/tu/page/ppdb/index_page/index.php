<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>
<?php  

  function gantiformat($nomorhp) {
     //Terlebih dahulu kita trim dl
     $nomorhp = trim($nomorhp);
    //bersihkan dari karakter yang tidak perlu
     $nomorhp = strip_tags($nomorhp);     
    // Berishkan dari spasi
    $nomorhp= str_replace(" ","",$nomorhp);
    // bersihkan dari bentuk seperti  (022) 66677788
     $nomorhp= str_replace("(","",$nomorhp);
    // bersihkan dari format yang ada titik seperti 0811.222.333.4
     $nomorhp= str_replace(".","",$nomorhp); 

     //cek apakah mengandung karakter + dan 0-9
     if(!preg_match('/[^+0-9]/',trim($nomorhp))){
         // cek apakah no hp karakter 1-3 adalah +62
         if(substr(trim($nomorhp), 0, 3)=='+62'){
             $nomorhp= trim($nomorhp);
         }
         // cek apakah no hp karakter 1 adalah 0
        elseif(substr($nomorhp, 0, 1)=='0'){
             $nomorhp= '62'.substr($nomorhp, 1);
         }
     }
     return $nomorhp;
 }
?>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-flat">
      <div class="panel-heading">
        <h6 class="panel-title">Data Pendaftar Baru<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
        <div class="heading-elements">
          <ul class="icons-list">
            <li><a data-action="collapse"></a></li>
            <li><a data-action="reload"></a></li>
            <li><a data-action="close"></a></li>
          </ul>
        </div>
      </div>
      <div class="panel-body">
        <div class="table-responsive">
          <table class="table table-framed table-bordered table-xxs">
            <thead >
              <tr >
                <th style="text-align:center; font-weight: bold;">No</th>
                <th style="text-align:center; font-weight: bold;">No. Reg</th>
                <th style="text-align:center; font-weight: bold;">Nama</th>
                <th style="text-align:center; font-weight: bold;">No. WA</th>
                <th style="text-align:center; font-weight: bold;">TTL</th>
                <th style="text-align:center; font-weight: bold;">Alamat</th>
                <th style="text-align:center; font-weight: bold;">Asal Sekolah</th>
                <th style="text-align:center; font-weight: bold;">Uk. Baju</th>
                <th style="text-align:center; font-weight: bold;">Jurusan</th>
                <th style="text-align:center; font-weight: bold;">#</th>
                <th style="text-align:center; font-weight: bold;">#</th>
              </tr>
            </thead>
            <tbody>
              <?php $no = 0; ?>
              <?php foreach ($data_get['result']->values as $key => $value): ?>
                <tr>
                  <td width="1%"><?php echo ++$no; ?></td>
                  <td><?php echo $value->no_register ?></td>
                  <td><?php echo $value->nama ?></td>
                  <td><?php echo $value->no_wa ?></td>
                  <td><?php echo $value->tempat_lahir ?> / <?php echo date_format(date_create($value->tanggal_lahir), "d-M-y") ?></td>

                  <td><?php echo $value->alamat ?></td>
                  <td><?php echo $value->asal_sekolah ?></td>
                  <td><?php echo $value->ukuran_baju ?></td>
                  <td><?php echo $value->jurusan ?></td>
                  <td><a target="__blank" href="https://wa.me/<?php echo gantiformat($value->no_wa) ?>" class="btn btn-success btn-xs">Wa</a></td>
                  <td><a href="Calon_siswa/add_page/<?php echo $value->no_register; ?>" class="btn btn-primary btn-xs app-item"><i class="icon-spinner2"></i></a></td>
                </tr>
              <?php endforeach ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>