
  <script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="kepegawaian/update_data" id="app-submit" method="POST">
  <div class="row">
    <div class="col-md-8">
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h5 class="panel-title">Edit Data Pegawai (<i>Edit Data</i>)<a class="heading-elements-toggle"><i class="icon-more"></i></a></h5>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
              <li><a data-action="close"></a></li>
            </ul>
          </div>
        </div>
        <div class="panel-body">
          <fieldset>
          <div class="tab-content">
            <div class="tab-pane active" id="stacked-icons-a">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>A. KETERANGAN PRIBADI</b></label>
            </div>
            <input type="hidden" name="id_guru" value="<?php echo $data_get['guru']['id_guru'] ?>">
            <div class="form-group">
              <label class="col-lg-3 control-label">Kode Pegawai:</label>
              <div class="col-lg-6">
                <input type="text" name="kode_pegawai" value="<?= (!empty($data_get['guru']['kode_pegawai'])) ? $data_get['guru']['kode_pegawai'] : ''; ?>" class="form-control kode_pegawai"  placeholder="Input here......">
              </div>
              <div class="col-lg-3">
                  <button class="btn btn-xs btn-success" data-toggle="tooltip" onclick="reload_table('guru','kode_pegawai','kode_pegawai');" data-placement="top" title="Reload Kode" type="button"><i class="icon-pencil7"></i></button>
                  <button class="btn btn-xs btn-info" type="button" onclick="setting_table('guru','kode_pegawai');" data-toggle="tooltip" data-placement="top" title="Setting Kode" ><i class="icon-cog3"></i></button>
                </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">1. Nama:</label>
              <div class="col-lg-6">
                <input type="text" name="nama" class="form-control" value="<?php echo $data_get['guru']['nama'] ?>" placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">2. Jenis Kelamin:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Jenis Kelamin" name="jenis_kelamin" class="form-control">
                  <option <?php echo ($data_get['guru']['jenis_kelamin'] == "Laki-laki") ? "selected" : ""; ?> value="Laki-laki">Laki-laki</option>
                  <option <?php echo ($data_get['guru']['jenis_kelamin'] == "Perempuan") ? "selected" : ""; ?> value="Perempuan">Perempuan</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">3. Tempat Lahir:</label>
              <div class="col-lg-6">
                <input type="text" name="tempat_lahir" value="<?php echo $data_get['guru']['tempat_lahir'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">4. Tanggal Lahir:</label>
              <div class="col-lg-4">
                <input type="date" name="tanggal_lahir" value="<?php echo $data_get['guru']['tanggal_lahir'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            
            <div class="form-group">
              <label class="col-lg-3 control-label">5. Agama/kepercayaan:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Agama" name="agama" class="form-control">
                  <option <?php echo ($data_get['guru']['agama'] == "Islam") ? "selected" : ""; ?> value="Islam">Islam</option>
                  <option <?php echo ($data_get['guru']['agama'] == "Kristen") ? "selected" : ""; ?> value="Kristen">Kristen</option>
                  <option <?php echo ($data_get['guru']['agama'] == "Hindu") ? "selected" : ""; ?> value="Hindu">Hindu</option>
                  <option <?php echo ($data_get['guru']['agama'] == "Budha") ? "selected" : ""; ?> value="Budha">Budha</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">6. Kewarganegaraan:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Kewarganegaraan" name="kewarganegaraan" class="form-control">
                  <option <?php echo ($data_get['guru']['kewarganegaraan'] = "WNI") ? "selected" : ""; ?> value="WNI">WNI</option>
                  <option <?php echo ($data_get['guru']['kewarganegaraan'] = "WNA") ? "selected" : ""; ?> value="WNA">WNA</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label class="col-lg-3 control-label">7. Status Menikah:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Status Menikah" name="status_pernikahan" class="select">
                  <option <?php echo ($data_get['guru']['status_pernikahan'] == "Kawin") ? "selected" : ""; ?> value="Kawin">Kawin</option>
                  <option <?php echo ($data_get['guru']['status_pernikahan'] == "Belum Kawin") ? "selected" : ""; ?> value="Belum Kawin">Belum Kawin</option>
                  <option <?php echo ($data_get['guru']['status_pernikahan'] == "Janda") ? "selected" : ""; ?> value="Janda">Janda</option>
                  <option <?php echo ($data_get['guru']['status_pernikahan'] == "Duda") ? "selected" : ""; ?> value="Duda">Duda</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">8. Suami/istri:</label>
              <div class="col-lg-6">
                <input type="text" name="istri" value="<?php echo $data_get['guru']['istri'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            
            <div class="form-group">
              <label class="col-lg-3 control-label"><b>9. Anak:</b></label>
              <div class="col-lg-3">
                
              </div>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-anak" type="button"><i class="icon-plus2"></i> Tambah data anak</button>
              <hr>
              <table class="table table-bordered table-framed tbl-anak">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Nama</th>
                    <th>Tmpt Lahir</th>
                    <th>Tgl Lahir</th>
                    <th>Nama Ibu/Ayah</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>

            <div class="form-group">
              <label class="col-lg-3 control-label">10. Email:</label>
              <div class="col-lg-6">
                <input type="text" name="email" value="<?php echo $data_get['guru']['email'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">11. Foto:</label>
              <div class="col-lg-3">
                <input type="file" name="foto" class="form-control"  placeholder="Input here......">
              </div>
            </div>

            </div>
            <div class="tab-pane" id="stacked-icons-b">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>B. KETERANGAN TEMPAT TINGGAL</b></label>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">1. Alamat rumah:</label>
              <div class="col-lg-6">
                <input type="text" name="alamat" value="<?php echo $data_get['guru']['alamat'] ?>" class="form-control" placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">2. Status Rumah:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Status Rumah" name="status_rumah" class="select">
                  <option <?php echo ($data_get['guru']['status_rumah'] == "Rumah Pribadi") ? "selected" : ""; ?> value="Rumah Pribadi" >Rumah Pribadi</option>
                  <option <?php echo ($data_get['guru']['status_rumah'] == "Ikut Orang Tua") ? "selected" : ""; ?> value="Ikut Orang Tua">Ikut Orang Tua</option>
                  <option <?php echo ($data_get['guru']['status_rumah'] == "Rumah Kontrak") ? "selected" : ""; ?> value="Rumah Kontrak">Rumah Kontrak</option>
                  <option <?php echo ($data_get['guru']['status_rumah'] == "Rumah Kos") ? "selected" : ""; ?> value="Rumah Kos">Rumah Kos</option>
                </select>
              </div>
            </div>
             <div class="form-group">
              <label class="col-lg-3 control-label">3. No. HP:</label>
              <div class="col-lg-6">
                <input type="text" name="no_hp" value="<?php echo $data_get['guru']['no_hp'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">4. Jarak ke Kantor:</label>
              <div class="col-lg-6">
                <input type="text" name="jarak_ke_kantor" value="<?php echo $data_get['guru']['jarak_ke_kantor'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-c">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>C. KETERANGAN JASMANI</b></label>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">1. Berat Badan:</label>
              <div class="col-lg-6">
                <input type="number" name="bb" class="form-control" value="<?php echo $data_get['guru']['bb'] ?>"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">2. Tinggi Badan:</label>
              <div class="col-lg-6">
                <input type="number" name="tb" class="form-control" value="<?php echo $data_get['guru']['tb'] ?>"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">3. Golongan Darah:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Golongan Darah" name="gd" class="select">
                  <option <?php echo ($data_get['guru']['gd'] == "A") ? "selected" : ""; ?> value="A">A</option>
                  <option <?php echo ($data_get['guru']['gd'] == "B") ? "selected" : ""; ?> value="B">B</option>
                  <option <?php echo ($data_get['guru']['gd'] == "AB") ? "selected" : ""; ?> value="AB">AB</option>
                  <option <?php echo ($data_get['guru']['gd'] == "O") ? "selected" : ""; ?> value="O">O</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">4. Penyakit Berat yg Pernah Diderita:</label>
              <div class="col-lg-6">
                <input type="text" name="penyakit" class="form-control" value="<?php echo $data_get['guru']['penyakit'] ?>"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">5. Kelainan yg Dimiliki:</label>
              <div class="col-lg-6">
                <input type="text" name="kelainan" class="form-control"  value="<?php echo $data_get['guru']['kelainan'] ?>" placeholder="Input here......">
              </div>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-d">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>D. PENDIDIKAN FORMAL</b></label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-pendidikan" type="button"><i class="icon-plus2"></i> Tambah data pendidikan</button>
              <hr>
              <table class="table table-bordered table-framed tbl-pendidikan">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Jenis Pendidikan</th>
                    <th>Berijazah/tidak</th>
                    <th>Tahun</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-e">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>E. KURSUS PENATARAN/LATIHAN DALAM DAN LUAR NEGERI</b></label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-kursus" type="button"><i class="icon-plus2"></i> Tambah data kursus</button>
              <hr>
              <table class="table table-bordered table-framed tbl-kursus">
                <thead>
                  <tr>
                    <th width="1%" rowspan="2">#</th>
                    <th rowspan="2">Jenis</th>
                    <th colspan="3">Lamanya</th>
                    <th rowspan="2">Tingkat</th>
                    <th rowspan="2">Keterangan</th>
                  </tr>
                  <tr>
                    <th>Tahun</th>
                    <th>Bln</th>
                    <th>Hari</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-f">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>F. KETERANGAN KEPEGAWAIAN</b></label>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">1. Status Kepegawaian:</label>
              <div class="col-lg-3">
                <select data-placeholder="Pilih Status Kepegawaian" name="status_kepegawaian" class="select">
                  <option  <?php echo ($data_get['guru']['status_kepegawaian'] = "PNS") ? "selected" : ""; ?> value="PNS">PNS</option>
                  <option  <?php echo ($data_get['guru']['status_kepegawaian'] = "Non PNS") ? "selected" : ""; ?> value="Non PNS">Non PNS</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-6 control-label">2. Khusus Untuk Pegawai Negeri</label>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">&nbsp; 2.1. NIP:</label>
              <div class="col-lg-6">
                <input type="number" name="nip" value="<?php echo $data_get['guru']['nip'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">&nbsp; 2.2. No. Karpeg:</label>
              <div class="col-lg-6">
                <input type="number" name="no_karpeg" class="form-control" value="<?php echo $data_get['guru']['no_karpeg'] ?>" placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">&nbsp; 2.2. No. Taspen:</label>
              <div class="col-lg-6">
                <input type="number" name="no_taspen" class="form-control" value="<?php echo $data_get['guru']['no_taspen'] ?>" placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-6 control-label">&nbsp; 2.3 Riwayat Pekerjaan (<b>Khusus PNS</b>)</label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-riwayat-pns" type="button"><i class="icon-plus2"></i> Tambah data riwayat</button>
              <hr>
              <table class="table table-bordered table-framed tbl-riwayat-pns">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Pangkat</th>
                    <th>Jabatan</th>
                    <th>Gaji Pokok</th>
                    <th>Terhitung Mulai</th>
                    <th>Keterangan</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            <div class="form-group">
              <label class="col-lg-6 control-label">3. Khusus Untuk Pegawai Swasta</label>
            </div>
            <div class="form-group">
              <label class="col-lg-6 control-label">&nbsp; 3.1 Riwayat Pekerjaan (<b>Khusus SWASTA</b>)</label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-riwayat-swasta" type="button"><i class="icon-plus2"></i> Tambah data riwayat</button>
              <hr>
              <table class="table table-bordered table-framed tbl-riwayat-swasta">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Jenis Pekerjaan</th>
                    <th>Tahun</th>
                    <th>Keterangan</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            <div class="form-group">
              <label class="col-lg-6 control-label">4. Mata Pelajaran yg Pernah Diajarkan</label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-mapel" type="button"><i class="icon-plus2"></i> Tambah data mapel</button>
              <hr>
              <table class="table table-bordered table-framed tbl-mapel">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Mapel</th>
                    <th>Sekolah</th>
                    <th>Kelas</th>
                    <th>Tahun</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-g">

            <div class="form-group">
              <label class="col-lg-6 control-label"><b>G. KEGIATAN ORGANISASI/KEMASYARAKATAN</b></label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-organisasi" type="button"><i class="icon-plus2"></i> Tambah data organisasi</button>
              <hr>
              <table class="table table-bordered table-framed tbl-organisasi">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Organisasi</th>
                    <th>Jabatan</th>
                    <th>Tahun</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-h">
            <div class="form-group">
              <label class="col-lg-6 control-label"><b>H. KEGEMARAN/HOBI</b></label>
            </div>
            <div class="panel panel-body">
              <button class="btn btn-sm btn-success btn-add-hobi" type="button"><i class="icon-plus2"></i> Tambah data hobi</button>
              <hr>
              <table class="table table-bordered table-framed tbl-hobi">
                <thead>
                  <tr>
                    <th width="1%">#</th>
                    <th>Jenis</th>
                    <th>Aktif/Pasif</th>
                    <th>Kapan</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-i">
              <div class="form-group">
              <label class="col-lg-6 control-label"><b>I. LAIN-LAIN</b></label>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">1. Mulai Bertugas pada Tanggal:</label>
              <div class="col-lg-6">
                <input type="date" name="mulai_bertugas" value="<?php echo $data_get['guru']['mulai_bertugas'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">2. Berasal dari:</label>
              <div class="col-lg-6">
                <input type="text" name="berasal_dari" value="<?php echo $data_get['guru']['berasal_dari'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">3. Meninggalkan Tempat Ini pada Tanggal:</label>
              <div class="col-lg-6">
                <input type="date" name="tanggal_meninggalkan" value="<?php echo $data_get['guru']['tanggal_meninggalkan'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            <div class="form-group">
              <label class="col-lg-3 control-label">4. Alasan Meninggalkan:</label>
              <div class="col-lg-6">
                <input type="text" name="alasan_meninggalkan" value="<?php echo $data_get['guru']['alasan_meninggalkan'] ?>" class="form-control"  placeholder="Input here......">
              </div>
            </div>
            </div>
            <div class="tab-pane" id="stacked-icons-j">
              <div class="form-group">
                <label class="col-lg-6 control-label"><b>J. DOKUMEN PENDUKUNG</b></label>
              </div>
              <div class="panel panel-body">
                <div class="alert alert-success">
                  Anda bisa menambahkan dokumen pendukung pegawai seperti :
                  <ul>
                    <li>Scan Ijazah</li>
                    <li>Scan KTP</li>
                    <li>Scan KK</li>
                    <li>dll</li>
                  </ul>
                </div>
                <button class="btn btn-sm btn-success btn-add-dokumen" type="button"><i class="icon-plus2"></i> Tambah data Dokumen</button>
                <hr>
                
                <table class="table table-bordered table-framed tbl-dokumen">
                  <thead>
                    <tr>
                      <th width="1%">#</th>
                      <th>Nama</th>
                      <th>File</th>
                      <th>Keterangan</th>
                    </tr>
                  </thead>
                  <tbody></tbody>
                </table>
              </div>
            </div>
          </div>
          </fieldset>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="col-md-12">
        <div class="panel panel-flat">
        <div class="panel-body">
          <button type="submit" class="btn btn-block btn-success legitRipple">Simpan<i class="icon-floppy-disk position-right"></i></button>
          <a href="Kepegawaian/get_data" class="btn btn-block app-item btn-danger legitRipple">Batal<i class="icon-close2 position-right"></i></a><br>
        </div>
      </div>
      </div>
      <div class="col-md-12">
        <div class="panel panel-flat">
          <div class="panel-heading">
            <h6 class="panel-title">Data yg harus diisi<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
            <div class="heading-elements">
              <ul class="icons-list">
                <li><a data-action="collapse"></a></li>
                <li><a data-action="reload"></a></li>
                <li><a data-action="close"></a></li>
              </ul>
            </div>
          </div>
          <div class="panel-body">
            <div class="tabbable">
              <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#stacked-icons-a" data-toggle="tab" aria-expanded="true">A. Keterangan Pribadi</a></li>
                <li class=""><a href="#stacked-icons-b" data-toggle="tab" aria-expanded="false">B. Keterangan Tempat Tinggal</a></li>
                <li class=""><a href="#stacked-icons-c" data-toggle="tab" aria-expanded="false">C. Keterangan Jasmani</a></li>
                <li class=""><a href="#stacked-icons-d" data-toggle="tab" aria-expanded="false">D. Pendidikan Formal</a></li>
                <li class=""><a href="#stacked-icons-e" data-toggle="tab" aria-expanded="false">E. Kursus Dalam/Luar Negeri</a></li>
                <li class=""><a href="#stacked-icons-f" data-toggle="tab" aria-expanded="false">F. Keterangan Kepegawaian</a></li>
                <li class=""><a href="#stacked-icons-g" data-toggle="tab" aria-expanded="false">G. Kegiatan Organisasi</a></li>
                <li class=""><a href="#stacked-icons-h" data-toggle="tab" aria-expanded="false">H. Hobi/Kegemaran</a></li>
                <li class=""><a href="#stacked-icons-i" data-toggle="tab" aria-expanded="false">I. Lain-lain</a></li>
                <li class=""><a href="#stacked-icons-j" data-toggle="tab" aria-expanded="false">J. Dokumen Pendukung</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
</form>
