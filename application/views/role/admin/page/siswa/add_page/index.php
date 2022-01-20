<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<script src="<?php echo base_url('include/template/limitless/')?>/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/simpan_data" id="app-submit" method="POST">
  <div class="row">
    <div class="col-md-8">
      <div class="panel panel-flat">
        <div class="panel-heading">
          <h5 class="panel-title">Tambah Data Siswa (<i>Add Data</i>)<a class="heading-elements-toggle"><i class="icon-more"></i></a></h5>
          <div class="heading-elements">
            <ul class="icons-list">
              <li><a data-action="collapse"></a></li>
              <li><a data-action="reload"></a></li>
              <li><a data-action="close"></a></li>
            </ul>
          </div>
        </div>
        <div class="panel-body">
          <div class="tab-content">
            <div class="tab-pane active" id="stacked-icons-biodata">
              
              <fieldset>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Nis:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nis" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Nama:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nama" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Jurusan:</label>
                  <div class="col-lg-4 col-md-6">

                    <select data-placeholder="Pilih Jurusan" name="idjurusan_fk" class="select jurusan">
                      <?php foreach ($data_get['jurusan'] as $key => $value): ?>
                      <option value="<?php echo $value['id_jurusan'] ?>"><?php echo $value['jurusan'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Kelas:</label>
                  <div class="col-lg-4 col-md-6">
                    <div class="select_kelas">
                        <select data-placeholder="Pilih Jurusan terlebih dahulu" name="idkelas_fk" class="select kelas">
                          
                        </select>  
                    </div>
                  </div>
                  <div class="col-md-5">
                    <code>Kelas pada tahun ajaran saat ini</code>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-lg-3 control-label">Agama:</label>
                  <div class="col-lg-4 col-md-6">
                    <select data-placeholder="Pilih agama" name="agama" class="select">
                      <option value="islam">Islam</option>
                      <option value="kristen">Kristen</option>
                      <option value="hindu">Hindu</option>
                      <option value="budha">Budha</option>
                      <option value="lain">Lain</option>
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Jenis Kelamin:</label>
                  <div class="col-lg-4 col-md-6">
                    <select data-placeholder="Pilih jenis kelamin" name="jenis_kelamin" class="select">
                      <option value="L">Laki-Laki (L)</option>
                      <option value="P">Perempuan (P)</option>
                    </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-lg-3 control-label">NISN:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nisn" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">No Ijazah (Sekolah Asal):</label>
                  <div class="col-lg-9">
                    <input type="text" name="no_ijazah_sekolah_asal" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">No SKUHN(Sekolah Asal):</label>
                  <div class="col-lg-9">
                    <input type="text" name="no_skhun_sekolah_asal" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">No Ujian Nasional(Sekolah Asal):</label>
                  <div class="col-lg-9">
                    <input type="text" name="no_un_sekolah_asal" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">NPSN Sekolah Asal:</label>
                  <div class="col-lg-9">
                    <input type="text" name="npsn_sekolah_asal" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Nama Sekolah Asal:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nama_sekolah_asal" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">No KK:</label>
                  <div class="col-lg-9">
                    <input type="text" name="no_kk" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Tempat Lahir:</label>
                  <div class="col-lg-9">
                    <input type="text" name="tempat_lahir" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Tanggal Lahir:</label>
                  <div class="col-lg-9">
                    <input type="date" name="tanggal_lahir" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Berkebutuhan Khusus?</label>
                  <div class="col-lg-9">
                    <select data-placeholder="Pilih..." name="berkebutuhan_khusus" class="select">
                      <option value="Ya">Ya</option>
                      <option value="Tidak">Tidak</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Provinsi</label>
                  <div class="col-lg-9">
                    <select data-placeholder="Pilih..." name="idprovince_fk" class="select idprovince_fk">
                     <?php foreach ($data_get['province'] as $key => $value): ?>
                       <option value="<?php echo $value['id'] ?>"><?php echo $value['name'] ?></option>
                     <?php endforeach ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Kabupaten/Kota</label>
                  <div class="col-lg-9">
                    <select data-placeholder="Pilih..." name="idcities_fk" class="select idcities_fk">
                    
                    </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Dusun:</label>
                  <div class="col-lg-9">
                    <input type="text" name="dusun" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Kelurahan:</label>
                  <div class="col-lg-9">
                    <input type="text" name="kelurahan" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">RT:</label>
                  <div class="col-lg-9">
                    <input type="text" name="rt" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">RW:</label>
                  <div class="col-lg-9">
                    <input type="text" name="rw" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Alamat:</label>
                  <div class="col-lg-9">
                    <input type="text" name="alamat" class="form-control"  placeholder="Input here......">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Foto:</label>
                  <div class="col-lg-9">
                    <input type="file" class="form-control" name="foto">
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="stacked-icons-ibu">
              <div class="form-group">
                  <label class="col-lg-3 control-label">Nama Ibu:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nama_ibu" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Tempat Lahir:</label>
                  <div class="col-lg-9">
                    <input type="text" name="tempat_lahir_ibu" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Tanggal Lahir:</label>
                  <div class="col-lg-9">
                    <input type="date" name="tanggal_lahir_ibu" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Pendidikan Terakhir:</label>
                  <div class="col-lg-9">
                    <select name="pendidikan_ibu"  data-placeholder=" Pendidikan Ibu..." class="select">
                            <option></option>
                            <option value="Tidak Sekolah">Tidak Sekolah</option>
                            <option value="Putus SD">Putus SD</option>
                            <option value="SD Sederajat">SD Sederajat</option>
                            <option value="SMP Sederajat">SMP Sederajat</option>
                            <option value="SMA Sederajat">SMA Sederajat</option>
                            <option value="D1">D1</option>
                            <option value="D2">D2</option>
                            <option value="D3">D3</option>
                            <option value="D4/S1">D4/S1</option>
                            <option value="S2">S2</option>
                            <option value="S3">S3</option>
                          </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Pekerjaan:</label>
                  <div class="col-lg-9">
                    <select name="pekerjaan_ibu" data-placeholder=" Pekerjaan Ibu..." class="select">
                            <option></option>
                            <option value="Tidak Bekerja">Tidak Bekerja</option>
                            <option value="Nelayan">Nelayan</option>
                            <option value="Petani">Petani</option>
                            <option value="Peternak">Peternak</option>
                            <option value="PNS/TNI/Polri">PNS/TNI/Polri</option>
                            <option value="Karyawan Swasta">Karyawan Swasta</option>
                            <option value="Pedagang Kecil">Pedagang Kecil</option>
                            <option value="Wiraswasta">Wiraswasta</option>
                            <option value="Wirausaha">Wirausaha</option>
                            <option value="Buruh">Buruh</option>
                            <option value="Pedagang Besar">Pedagang Besar</option>
                            <option value="Pensiunan">Pensiunan</option>
                          </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Penghasilan:</label>
                  <div class="col-lg-9">
                    <select name="penghasilan_ibu" data-placeholder=" Penghasilan Ibu..." class="select">
                            <option></option>
                            <option value="< Rp. 500.000">< Rp. 500.000</option>
                            <option value="Rp. 500.000 - Rp. 999.999">Rp. 500.000 - Rp. 999.999</option>
                            <option value="Rp. 1.000.000 - Rp. 1.999.999">Rp. 1.000.000 - Rp. 1.999.999</option>
                            <option value="Rp. 2.000.000 - Rp. 4.999.999">Rp. 2.000.000 - Rp. 4.999.999</option>
                            <option value="Rp. 5.000.000 - Rp. 20.000.000">Rp. 5.000.000 - Rp. 20.000.000</option>
                            <option value="> Rp. 20.000.000">> Rp. 20.000.000</option>
                            <option value="Tidak berpenghasilan">Tidak berpenghasilan</option>
                          </select>
                  </div>
                </div>
            </div>
            <div class="tab-pane" id="stacked-icons-ayah">
              <div class="form-group">
                  <label class="col-lg-3 control-label">Nama Ayah:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nama_ayah" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Tempat Lahir:</label>
                  <div class="col-lg-9">
                    <input type="text" name="tempat_lahir_ayah" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Tanggal Lahir:</label>
                  <div class="col-lg-9">
                    <input type="date" name="tanggal_lahir_ayah" class="form-control"  placeholder="Input here......">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Pendidikan Terakhir:</label>
                  <div class="col-lg-9">
                    <select name="pendidikan_ayah"  data-placeholder=" Pendidikan Ayah..." class="select">
                            <option></option>
                            <option value="Tidak Sekolah">Tidak Sekolah</option>
                            <option value="Putus SD">Putus SD</option>
                            <option value="SD Sederajat">SD Sederajat</option>
                            <option value="SMP Sederajat">SMP Sederajat</option>
                            <option value="SMA Sederajat">SMA Sederajat</option>
                            <option value="D1">D1</option>
                            <option value="D2">D2</option>
                            <option value="D3">D3</option>
                            <option value="D4/S1">D4/S1</option>
                            <option value="S2">S2</option>
                            <option value="S3">S3</option>
                          </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Pekerjaan:</label>
                  <div class="col-lg-9">
                    <select name="pekerjaan_ayah" data-placeholder=" Pekerjaan Ayah..." class="select">
                            <option></option>
                            <option value="Tidak Bekerja">Tidak Bekerja</option>
                            <option value="Nelayan">Nelayan</option>
                            <option value="Petani">Petani</option>
                            <option value="Peternak">Peternak</option>
                            <option value="PNS/TNI/Polri">PNS/TNI/Polri</option>
                            <option value="Karyawan Swasta">Karyawan Swasta</option>
                            <option value="Pedagang Kecil">Pedagang Kecil</option>
                            <option value="Wiraswasta">Wiraswasta</option>
                            <option value="Wirausaha">Wirausaha</option>
                            <option value="Buruh">Buruh</option>
                            <option value="Pedagang Besar">Pedagang Besar</option>
                            <option value="Pensiunan">Pensiunan</option>
                          </select>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-lg-3 control-label">Penghasilan:</label>
                  <div class="col-lg-9">
                    <select name="penghasilan_ayah" data-placeholder=" Penghasilan Ayah..." class="select">
                            <option></option>
                            <option value="< Rp. 500.000">< Rp. 500.000</option>
                            <option value="Rp. 500.000 - Rp. 999.999">Rp. 500.000 - Rp. 999.999</option>
                            <option value="Rp. 1.000.000 - Rp. 1.999.999">Rp. 1.000.000 - Rp. 1.999.999</option>
                            <option value="Rp. 2.000.000 - Rp. 4.999.999">Rp. 2.000.000 - Rp. 4.999.999</option>
                            <option value="Rp. 5.000.000 - Rp. 20.000.000">Rp. 5.000.000 - Rp. 20.000.000</option>
                            <option value="> Rp. 20.000.000">> Rp. 20.000.000</option>
                            <option value="Tidak berpenghasilan">Tidak berpenghasilan</option>
                          </select>
                  </div>
                </div>
            </div>
            <div class="tab-pane" id="stacked-icons-periodik">
               <div class="form-group">
                  <label class="col-lg-3 control-label">Tinggi Badan:</label>
                  <div class="col-lg-4">
                    <div class="input-group">
                      <input type="text" name="tinggi_badan" class="form-control"  placeholder="Input here......">
                      <span class="input-group-addon">Cm</span>
                    </div>
                    
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-lg-3 control-label">Berat Badan:</label>
                  <div class="col-lg-4">
                    <div class="input-group">
                      <input type="text" name="berat_badan" class="form-control"  placeholder="Input here......">
                      <span class="input-group-addon">Kg</span>
                    </div>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-lg-3 control-label">Jarak ke Sekolah:</label>
                  <div class="col-lg-4">
                    <div class="input-group">
                      <input type="text" name="jarak_ke_sekolah" class="form-control"  placeholder="Input here......">
                      <span class="input-group-addon">Km</span>
                    </div>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-lg-3 control-label">Jumlah Saudara:</label>
                  <div class="col-lg-4">
                    <input type="text" name="jumlah_saudara" class="form-control"  placeholder="Input here......">
                  </div>
              </div>
            </div>
            <div class="tab-pane" id="stacked-icons-beasiswa">
              <div class="table-responsive">
              <button type="button" class="btn btn-success btn-add-beasiswa">Tambah Data</button>
              <hr>
              <table class="table table-beasiswa table-bordered table-xss">
                <thead>
                  <tr>
                    <td>Jenis</td>
                    <td>Penyelenggara</td>
                    <td>Tahun Mulai</td>
                    <td>Tahun Selesai</td>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
              </div>
            </div>
            <div class="tab-pane" id="stacked-icons-prestasi">
              <div class="table-responsive">

              <button type="button" class="btn btn-success btn-add-prestasi">Tambah Data</button>
              <hr>
              <table class="table table-prestasi table-bordered table-xss">
                <thead>
                  <tr>
                    <td>Jenis</td>
                    <td>Tingkat</td>
                    <td>Nama Prestasi</td>
                    <td>Tahun</td>
                    <td>Penyelenggaraan</td>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
              </div>
            </div>
            <div class="tab-pane" id="stacked-icons-dokumen">
               <div class="table-responsive">

              <button type="button" class="btn btn-success btn-add-dokumen">Tambah Data</button>
              <hr>
              <table class="table table-dokumen table-bordered table-xss">
                <thead>
                  <tr>
                    <td>Keterangan</td>
                    <td>File</td>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="col-md-12">
        <div class="panel panel-flat">
          <div class="panel-body">
            <button type="submit" class="btn btn-block btn-success legitRipple">Simpan<i class="icon-floppy-disk position-right"></i></button>
            <a href="<?php echo $data_get['param']['table'] ?>/get_data" class="btn btn-block app-item btn-danger legitRipple">Batal<i class="icon-close2 position-right"></i></a><br>
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
                <li class="active"><a href="#stacked-icons-biodata" data-toggle="tab" aria-expanded="true">Biodata</a></li>
                <li class=""><a href="#stacked-icons-ibu" data-toggle="tab" aria-expanded="false">Data Ibu</a></li>
                <li class=""><a href="#stacked-icons-ayah" data-toggle="tab" aria-expanded="false">Data Ayah</a></li>
                <li class=""><a href="#stacked-icons-periodik" data-toggle="tab" aria-expanded="false">Data Periodik</a></li>
                <li class=""><a href="#stacked-icons-prestasi" data-toggle="tab" aria-expanded="false">Data Prestasi</a></li>
                <li class=""><a href="#stacked-icons-beasiswa" data-toggle="tab" aria-expanded="false">Data Beasiswa</a></li>
                <li class=""><a href="#stacked-icons-dokumen" data-toggle="tab" aria-expanded="false">Dokumen Tambahan</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</form>