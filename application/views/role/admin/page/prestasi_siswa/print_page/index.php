<form id="frm-set">
<div class="row">
  <div class="col-xs-6">
    <div class="panel panel-flat">
      <div class="panel-body">
        <table class="table table-bordered table-xxs">
          <tr>
            <td>Laporan</td>
            <td>
              <select class="form-control" name="laporan">
                <option> Pilih </option>
                <option value="data"> Cetak Data(Tabel) </option>
              </select>
            </td>
          </tr>

          <tr>
            <td>Jenis Data</td>
            <td>
              <select class="form-control" name="data_yg_dicetak" id="data_yg_dicetak">
                          <option> Pilih </option>
                          <option value="all"> Semua Data </option>
                          <?php if ($data_get['sum_selected']>0): ?>
                            <option value="pilih"> Data yg dipilih (<?php echo $data_get['sum_selected'] ?> data terpilih) </option>
                          <?php endif ?>
                          <option value="manual"> Filter manual</option>
                        </select>
                         <?php if ($data_get['sum_selected']>0): ?>
                          <input type="hidden" value="<?php echo $data_get['input_selected'] ?>" name="input_selected">
                      <?php endif ?>
            </td>
          </tr>
          <tr>
            <td>Cetak</td>
            <td>
              <select class="form-control" name="tipe_laporan" id="tipe_laporan">
                          <option> Pilih </option>
                          <option value="pdf"> PDF </option>
                          <option value="web"> Cetak Website </option>
                        </select>
            </td>
          </tr>
          <tr>
            <td>Posisi</td>
            <td>
              <select class="form-control" name="posisi" id="posisi">
                          <option> Pilih </option>
                          <option value="portrait"> Portrait </option>
                          <option value="landscape"> Landscape </option>
                        </select>
            </td>
          </tr>
        </table>
        <hr>
        <button id="cek" class="btn btn-success">Ekspor</button>
      </div>
    </div>
  </div>
  <div class="col-xs-6">
    <div class="filter" style="display: none;">

      <div class="panel panel-flat">
        <div class="panel-body">
          <center><h4><u><b>Filter</b></u></h4></center>
          <table class="table table-bordered table-xxs">
              <tr>
                <td width="30%">Nama Siswa</td>
                <td><input type="text" class="form-control" name="f_pengirim" placeholder="Tambahkan data Siswa"></td>
              </tr>
              <tr>
                <td width="30%">Prestasi</td>
                <td><input type="date" class="form-control" name="f_tanggal_surat"></td>
              </tr>
              <tr>
                <td width="30%">Lomba</td>
                <td><input type="text" class="form-control" name="f_kode_arsip" placeholder="Tambahkan data kode arsip"></td>
              </tr>
              <tr>
                <td width="30%">Tahun</td>
                <td><input type="text" class="form-control" name="f_no_surat" placeholder="Tambahkan data no surat"></td>
              </tr>
            
          </table>
        </div>
      </div>
    </div>
  </div>

</div>
<div class="row">
  <div class="col-xs-12">
    <div class="panel panel-flat">
      <div class="panel-body">
        <div id="display_dialog"></div>
      </div>
    </div>
  </div>
</div>
</form>